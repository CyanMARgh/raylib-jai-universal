Particle_System :: struct {
	particles_count : u32;
	is_fresh := false;

	vao, vbo : u32;
	draw_shader : Shader;
	particles_counter : u32;
	shader_simulate : u32;
	shader_emit : u32;
}
init :: (using particle_system : *Particle_System) {
	vao = LoadVertexArray();
	EnableVertexArray(vao); defer DisableVertexArray();
	vbo = LoadVertexBuffer(null, xx(particles_count * size_of(Particle)), true);

	draw_shader = LoadShaderFromMemory(GLSL_VERT_PARTICLE, GLSL_FRAG_PARTICLE);
	particles_counter = get_atomic_counter();
	shader_simulate = get_compute_shader(GLSL_COMP_PARTICLE_SIMULATE);
	shader_emit = get_compute_shader(GLSL_COMP_PARTICLE_EMIT);
}
deinit :: (using particle_system : *Particle_System) {
	glDeleteProgram(shader_emit);
	glDeleteProgram(shader_simulate);
	clear_atomic_counter(particles_counter);
	UnloadShader(draw_shader);

	UnloadVertexArray(vao);
	UnloadVertexBuffer(vbo);
}
draw :: (using particle_system : *Particle_System) {
	EnableShader(draw_shader.id); defer DisableShader();
    EnableVertexArray(vao); defer DisableVertexArray();

	particles_count = get_value(particles_counter);

	glBindVertexArray(vao);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, vbo);

	mat_mvp := MatrixMultiply(GetMatrixModelview(), GetMatrixProjection());
	SetUniformMatrix(draw_shader.locs[SHADER_LOC_MATRIX_MVP], mat_mvp);
	if IsWindowResized() is_fresh = false;
	if !is_fresh {
		is_fresh = true;
		ratio := cast(float)GetScreenHeight() / GetScreenWidth();
		set_uniform(draw_shader.id, "ratio", ratio);
	}
	print("particles_count = %\n", particles_count);
	DisableDepthMask();
		glDrawArrays(GL_TRIANGLES, 0, xx (particles_count * 6));
	EnableDepthMask();
}
simulate :: (using particle_system : *Particle_System, delta_time : float) {
	glUseProgram(shader_simulate);
	set_uniform(shader_simulate, "u_dt", delta_time);

	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, particle_system.vbo);
	glBindBufferBase(GL_ATOMIC_COUNTER_BUFFER, 0, particles_counter);

	glDispatchCompute(xx particles_count, 1, 1);
	glMemoryBarrier(GL_ALL_BARRIER_BITS);
}
emit :: (using particle_system : *Particle_System, point : Vector3, new_particles_count := 30, speed_factor := 1.,
	base_color := RED, base_variation := Vector3.{.1, 0, 0},
	aspect_color := WHITE, aspect_variation := Vector3.{}
) {
	glUseProgram(shader_emit);
	set_uniform(shader_emit, "u_random_state", __random_state);
	set_uniform(shader_emit, "u_center", point);
	set_uniform(shader_emit, "u_base_color", base_color);
	set_uniform(shader_emit, "u_base_variation", base_variation);
	set_uniform(shader_emit, "u_aspect_color", aspect_color);
	set_uniform(shader_emit, "u_aspect_variation", aspect_variation);
	set_uniform(shader_emit, "u_speed_factor", speed_factor);

	__random_state += 1;

	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, vbo);
	glBindBufferBase(GL_ATOMIC_COUNTER_BUFFER, 0, particles_counter);

	glDispatchCompute(xx new_particles_count, 1, 1);
	glMemoryBarrier(GL_ALL_BARRIER_BITS);		
}

#scope_file
#import "GL";

Particle :: struct {
	lifetime : float;
	pos, velocity, acceleration : Vector3;
	dragg : float;
	base_color, aspect_color : Vector3;
	next : u32;
}

MatrixMultiply :: (left : Matrix, right : Matrix) -> Matrix {
    result : Matrix;

    result.m0 = left.m0*right.m0 + left.m1*right.m4 + left.m2*right.m8 + left.m3*right.m12;
    result.m1 = left.m0*right.m1 + left.m1*right.m5 + left.m2*right.m9 + left.m3*right.m13;
    result.m2 = left.m0*right.m2 + left.m1*right.m6 + left.m2*right.m10 + left.m3*right.m14;
    result.m3 = left.m0*right.m3 + left.m1*right.m7 + left.m2*right.m11 + left.m3*right.m15;
    result.m4 = left.m4*right.m0 + left.m5*right.m4 + left.m6*right.m8 + left.m7*right.m12;
    result.m5 = left.m4*right.m1 + left.m5*right.m5 + left.m6*right.m9 + left.m7*right.m13;
    result.m6 = left.m4*right.m2 + left.m5*right.m6 + left.m6*right.m10 + left.m7*right.m14;
    result.m7 = left.m4*right.m3 + left.m5*right.m7 + left.m6*right.m11 + left.m7*right.m15;
    result.m8 = left.m8*right.m0 + left.m9*right.m4 + left.m10*right.m8 + left.m11*right.m12;
    result.m9 = left.m8*right.m1 + left.m9*right.m5 + left.m10*right.m9 + left.m11*right.m13;
    result.m10 = left.m8*right.m2 + left.m9*right.m6 + left.m10*right.m10 + left.m11*right.m14;
    result.m11 = left.m8*right.m3 + left.m9*right.m7 + left.m10*right.m11 + left.m11*right.m15;
    result.m12 = left.m12*right.m0 + left.m13*right.m4 + left.m14*right.m8 + left.m15*right.m12;
    result.m13 = left.m12*right.m1 + left.m13*right.m5 + left.m14*right.m9 + left.m15*right.m13;
    result.m14 = left.m12*right.m2 + left.m13*right.m6 + left.m14*right.m10 + left.m15*right.m14;
    result.m15 = left.m12*right.m3 + left.m13*right.m7 + left.m14*right.m11 + left.m15*right.m15;

    return result;
}
make_shader_part :: (src : *u8, type : GLuint) -> u32 {
	id := glCreateShader(GL_COMPUTE_SHADER);
	glShaderSource(id, 1, *src, null);
	glCompileShader(id);
	succes : s32;
	info_log : [512]u8;
	glGetShaderiv(id, GL_COMPILE_STATUS, *succes);
	if !succes {
		glGetShaderInfoLog(id, 512, null, cast(*GLchar) *info_log);
		print("failed to compile shader: %\n", to_string(info_log));		
		glDeleteShader(id);
		return 0;
	}
	print("shader compiling done\n");
	return id;
}
get_compute_shader :: (src : *u8) -> u32 {
	comp := make_shader_part(src, GL_COMPUTE_SHADER); defer glDeleteShader(comp);
	id := glCreateProgram();
	glAttachShader(id, comp);
	glLinkProgram(id);
	succes : s32;
	info_log : [512]u8;
	glGetProgramiv(id, GL_LINK_STATUS, *succes);
	if !succes {
		glGetProgramInfoLog(id, 512, null, cast(*GLchar) *info_log);
		print("failed to link shader: %\n", to_string(info_log));
		glDeleteProgram(id);
		return 0;
	}
	print("shader linking done\n");
	return id;	
}
get_atomic_counter :: () -> u32 {
	id : u32;
	glGenBuffers(1, *id);
	glBindBuffer(GL_ATOMIC_COUNTER_BUFFER, id);
		glBufferData(GL_ATOMIC_COUNTER_BUFFER, size_of(u32), null, GL_DYNAMIC_DRAW);
	glBindBuffer(GL_ATOMIC_COUNTER_BUFFER, 0);
	return id;
}
clear_atomic_counter :: (id : u32) {
	glDeleteBuffers(1, *id);
}
get_value :: (id : u32) -> u32 {
	glBindBuffer(GL_ATOMIC_COUNTER_BUFFER, id);
	ptr := glMapBuffer(GL_ATOMIC_COUNTER_BUFFER, GL_READ_ONLY);
	val := << cast(*u32) ptr;
	glUnmapBuffer(GL_ATOMIC_COUNTER_BUFFER);
	return val;
}
set_uniform :: (shader : u32, name : *u8, value : float) {
	loc := glGetUniformLocation(shader, name);
	glUniform1f(loc, value);
}
set_uniform :: (shader : u32, name : *u8, value : s32) {
	loc := glGetUniformLocation(shader, name);
	glUniform1i(loc, value);
}
set_uniform :: (shader : u32, name : *u8, value : Vector3) {
	loc := glGetUniformLocation(shader, name);
	glUniform3f(loc, value.x, value.y, value.z);
}
set_uniform :: (shader : u32, name : *u8, value : Vector4) {
	loc := glGetUniformLocation(shader, name);
	glUniform4f(loc, value.x, value.y, value.z, value.w);
}
set_uniform :: (shader : u32, name : *u8, value : Color) {
	set_uniform(shader, name, Vector3.{xx value.r, xx value.g, xx value.b} / 255.);
}
__random_state : s32;
GLSL_COMP_PARTICLE_EMIT :: #string GLSL
	#version 430 core
	layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

	struct Particle_Sim {
		float lifetime;

		vec3 pos;
		vec3 velocity;
		vec3 acceleration;
		float dragg;

		vec3 base_color;
		vec3 aspect_color;

		uint next;
	};
	layout(std430, binding = 0) buffer u_sim_particles {
		Particle_Sim sim_particles[];
	};
	layout (binding = 0) uniform atomic_uint u_alive_counter;

	uniform int u_random_state;
	uniform vec3 u_center;
	uniform float u_speed_factor;

	uniform vec3 u_base_color;
	uniform vec3 u_base_variation;

	uniform vec3 u_aspect_color;
	uniform vec3 u_aspect_variation;

	vec2 hash22(vec2 p) {
		p = p * mat2(127.1, 311.7, 269.5 ,183.3);
		p = -1.0 + 2.0 * fract(sin(p) * 43758.5453123);
		return sin(p * 6.283);
	}
	const float PI = 3.14159265;
	vec3 hash32(vec2 p) {
		vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
		p3 += dot(p3, p3.yxz+33.33);
		return fract((p3.xxy+p3.yzz)*p3.zyx);
	}

	vec3 hsv2rgb(vec3 c) {
		vec4 K = vec4(1., 2. / 3., 1. / 3., 3.);
		return c.z * mix(K.xxx, clamp(abs(fract(c.x + K.xyz) * 6. - K.w) - K.x, 0, 1), c.y);
	}
	vec3 rgb2hsv(vec3 c) {
		float
			cMax = max(max(c.r, c.g), c.b),
			cMin = min(min(c.r, c.g), c.b),
			delta = cMax - cMin;
		vec3 hsv = vec3(0, 0, cMax);
		if(cMax > cMin){
			hsv.y = delta / cMax;
			if(c.r == cMax){
				hsv.x = (c.g - c.b) / delta;
			} else if(c.g == cMax){
				hsv.x = 2 + (c.b - c.r) / delta;
			} else {
				hsv.x = 4 + (c.r - c.g) / delta;
			}
			hsv.x = fract(hsv.x / 6);
		}
		return hsv;
	}

	vec3 gen_color(vec3 col, vec3 H, vec3 variation) {
		vec3 hsv = rgb2hsv(col) + (H - .5) * variation;
		hsv.x = mod(hsv.x, 1);
		return hsv2rgb(hsv);
	}

	Particle_Sim gen_particle(uint i) {
		float fi = float(i);
		vec3 H = hash32(vec2(fi, u_random_state));
		vec3 phi_y_r = vec3(H.x * 2 * PI, H.y * 2 - 1, (H.z * .3 + 1) * 3);
		vec3 speed = vec3(0, 3, 0) + .7 * phi_y_r.z * vec3(vec2(sin(phi_y_r.x), cos(phi_y_r.x)) * sqrt(1 - phi_y_r.y * phi_y_r.y),  phi_y_r.y);
		float timer = .8 + .3 * hash22(vec2(fi, u_random_state + 1)).x;

		vec3 var = hash32(vec2(fi, u_random_state + 2)) - .5;
	
		return Particle_Sim(
			timer,
			u_center,
			speed * u_speed_factor,
			vec3(0, -2, 0),
			2,
			gen_color(u_base_color.rgb, var, u_base_variation),
			gen_color(u_aspect_color.rgb, var, u_aspect_variation),
			0xFFFFFFFF
		);
	}

	void main() {
		uint particle_id = atomicCounterIncrement(u_alive_counter);
		sim_particles[particle_id] = gen_particle(particle_id);
	}
GLSL
GLSL_COMP_PARTICLE_SIMULATE :: #string GLSL
	#version 430 core
	layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

	struct Particle_Sim {
		float lifetime;
		vec3 pos;
		vec3 velocity;
		vec3 acceleration;
		float dragg;

		vec3 base_color;
		vec3 aspect_color;

		uint next;
	};
	layout(std430, binding = 0) buffer u_sim_particles {
		Particle_Sim sim_particles[];
	};
	layout (binding = 0) uniform atomic_uint u_alive_counter;

	uniform float u_dt;

	void main() {
		int particle_id = int(gl_GlobalInvocationID.x);
		uint alive_count = atomicCounter(u_alive_counter);

		if(particle_id < alive_count) {
			Particle_Sim P = sim_particles[particle_id];
			P.velocity.xyz += P.acceleration * u_dt;
			P.velocity.xyz *= (1 - P.dragg * u_dt);
			P.pos += P.velocity.xyz * u_dt;

			P.lifetime -= u_dt;
			if(P.lifetime < 0) {
				P.next = atomicCounterDecrement(u_alive_counter);
			}
			sim_particles[particle_id] = P;
		}
		memoryBarrier();
		alive_count = atomicCounter(u_alive_counter);

		if(particle_id < alive_count) {
			uint repl = particle_id;
			int MAX_ITERATIONS = 100;
			for(int i = 0; i < MAX_ITERATIONS; i++) {
				uint next = sim_particles[repl].next;
				if(next == 0xFFFFFFFF) break;
				repl = next;
			}
			sim_particles[particle_id] = sim_particles[repl];
		}
	}
GLSL
GLSL_VERT_PARTICLE :: #string GLSL
	#version 430

	uniform mat4 mvp;
	uniform float ratio = 1;
	const float size = .2;

	struct Particle_Sim {
		float lifetime;
		vec3 pos;
		vec3 velocity;
		vec3 acceleration;
		float dragg;

		vec3 base_color;
		vec3 aspect_color;

		uint next;
	};
	layout(std430, binding = 0) buffer u_sim_particles {
		Particle_Sim sim_particles[];
	};

	struct Particle_Visual {
		vec2 uv;
		vec3 base_color;
		vec3 aspect_color;
		float angle;
	};
	out Particle_Visual particle_visual;

	void main() {
		int id = gl_VertexID;
		int particle_id = id / 6;
		int offset_id = id % 6;

		vec2 offsets[6] = vec2[6](
			vec2(-1,-1),
			vec2( 1, 1),
			vec2(-1, 1),
			vec2(-1,-1),
			vec2( 1,-1),
			vec2( 1, 1)
		);
		Particle_Sim particle = sim_particles[particle_id]; 
		float time = particle.lifetime;
		float scale = time <= 0 ? 0 : 1 - 1 / (20 * time + 1);

		vec4 p = mvp * vec4(particle.pos, 1);
		vec2 offset = offsets[offset_id];

		particle_visual = Particle_Visual(
			offset,
			particle.base_color.rgb,
			particle.aspect_color.rgb,
			0
		);

		gl_Position = p + vec4(offset * vec2(ratio, 1), 0, 0) * size * scale;
	}
GLSL
GLSL_FRAG_PARTICLE :: #string GLSL
	#version 430

	struct Particle_Visual {
	    vec2 uv;
	    vec3 base_color;
	    vec3 aspect_color;
	    float angle;
	};
	in Particle_Visual particle_visual;
	out vec4 o_color;

	void main() {
	    float r = length(particle_visual.uv);
	    o_color = vec4(r < .5 ? particle_visual.aspect_color : particle_visual.base_color, r < 1 ? 1 : 0);
	}
GLSL