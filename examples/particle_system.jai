Particle_System :: struct {
	vao, vbo, instance_vbo : u32;
	shader_draw : Shader;

	max_particles : u32;
	buffer_cpu	: [..]Particle_CPU_Part;
	buffer_gpu	: [..]Particle_GPU_Part;

	is_fresh := false;
}
init :: (using particle_system : *Particle_System, _max_particles :u32= 100000) {
	add_attrib :: (size : int) #expand {
		glEnableVertexAttribArray(xx attr_index);
		glVertexAttribPointer(xx attr_index, size, GL_FLOAT, GL_FALSE, size_of(Particle_GPU_Part), xx offset); // position
		glVertexAttribDivisor(xx attr_index, 1);
		offset += size * 4;
		attr_index += 1;
	}

	max_particles = _max_particles;
	glGenVertexArrays(1, *vao);
	glGenBuffers(1, *instance_vbo);
	glGenBuffers(1, *vbo);

	glBindVertexArray(vao);
		glBindBuffer(GL_ARRAY_BUFFER, vbo);
		glBindBuffer(GL_ARRAY_BUFFER, instance_vbo);
		glBufferData(GL_ARRAY_BUFFER, size_of(Particle_GPU_Part) * max_particles, null, GL_STATIC_DRAW);
		offset := 0;
		attr_index := 0;
		add_attrib(3);
		add_attrib(1);
		add_attrib(3);
		add_attrib(3);
		glBindBuffer(GL_ARRAY_BUFFER, 0);
	glBindVertexArray(0);

	shader_draw = LoadShaderFromMemory(SRC_VERT_PARTICLE, SRC_FRAG_PARTICLE_CHECKERS);
}
deinit :: (using particle_system : *Particle_System) {
	glDeleteVertexArrays(1, *vao);
	glDeleteBuffers(1, *instance_vbo);
	array_reset(*buffer_cpu);
	array_reset(*buffer_gpu);
	UnloadShader(shader_draw);
}
draw :: (using particle_system : *Particle_System) {
	EnableShader(shader_draw.id); defer DisableShader();
	if IsWindowResized() is_fresh = false;
	if !is_fresh {
		is_fresh = true;
		ratio := cast(float)GetScreenWidth() / GetScreenHeight();
		set_uniform(shader_draw.id, "u_width_over_height", ratio);
	}
	_mv := GetMatrixModelview();
	_p := GetMatrixProjection();
	mat_mvp := MatrixMultiply(_mv, _p);

	DisableDepthMask();
		SetUniformMatrix(shader_draw.locs[SHADER_LOC_MATRIX_MVP], mat_mvp);
		glBindVertexArray(vao);
		glDrawArraysInstanced(GL_TRIANGLES, 0, 6, xx buffer_gpu.count);
		glBindVertexArray(0);
	EnableDepthMask();
}
simulate :: (using particle_system : *Particle_System, dt : float) {
	i := 0;
	while i < buffer_cpu.count {
		buffer_gpu[i].time -= dt;
		if buffer_gpu[i].time < 0 {
			count := buffer_cpu.count - 1;
			buffer_cpu[i] = buffer_cpu[count]; buffer_cpu.count = count;
			buffer_gpu[i] = buffer_gpu[count]; buffer_gpu.count = count;
		} else {
			buffer_gpu[i].position += buffer_cpu[i].velocity * dt;
			buffer_cpu[i].velocity += Vector3.{0, -6, 0} * dt;
			buffer_cpu[i].velocity *= 1 - dt * 3;
			i += 1;
		}
	}
	commit_buffer(particle_system);
}
emit :: (using particle_system : *Particle_System, count : int, center : Vector3) {
	// print("emit at: %\n", center);
	emit(particle_system, count, center, center);
}

#scope_file
#import "GL";

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

Particle_CPU_Part :: struct {
	velocity : Vector3;
}
Particle_GPU_Part :: struct {
	position : Vector3;
	time : float;
	base_color : Vector3;
	aspect_color : Vector3;
}

commit_buffer :: (using particle_system : *Particle_System) {
	glBindBuffer(GL_ARRAY_BUFFER, instance_vbo);
	glBufferSubData(GL_ARRAY_BUFFER, 0, size_of(Particle_GPU_Part) * buffer_gpu.count, buffer_gpu.data);	
	glBindBuffer(GL_ARRAY_BUFFER, 0);
}
emit :: (using particle_system : *Particle_System, count : int, center_0 : Vector3, center_1 : Vector3) {
	to_emit := min(count, max_particles - buffer_cpu.count);
	for i : 0..to_emit-1 {
		center := center_0 + (center_1 - center_0) * (cast(float)i / (to_emit-1));
		direction := Vector3.{random_get_within_range(-1, 1), random_get_within_range(-1, 1), random_get_within_range(-1, 1)};
		direction /= length(direction);
		P0 := array_add(*buffer_cpu);
		P1 := array_add(*buffer_gpu);

		P0.velocity = direction * random_get_within_range(3.3, 3.7) + Vector3.{0, 4, 0};

		P1.time = random_get_within_range(.5, 1.5);
		P1.position = center;
		// P1.base_color = .{1.5, .5, .2};
		P1.base_color = .{.5, .2, 1.5};
		P1.aspect_color = .{1., 1., 1.};
	}
}

SRC_VERT_PARTICLE :: #string GLSL
	#version 410 core

	in vec3 a_position;
	in float a_time;
	in vec3 a_base_color;
	in vec3 a_aspect_color;

	uniform mat4 mvp;
	uniform float u_width_over_height;

	out struct VO {
		vec2 uv;
		vec3 base_color;
		vec3 aspect_color;
	} vo;

	void main() {
		float points[12] = float[12](0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1);
		vec2 p = vec2(points[gl_VertexID << 1], points[(gl_VertexID << 1) | 1]);
		float size = (1 - 1 / (1 + a_time * 1)) * .5; 
		// float size = a_time > 0 ? 0.05 : 0;
		vec2 uv = p * 2 - 1;
		vo.uv = uv;
		vo.aspect_color = a_aspect_color;
		vo.base_color = a_base_color;
		gl_Position = (mvp * vec4(a_position, 1)) + vec4((uv * size) * vec2(1. / u_width_over_height, 1), 0, 0);
	}
GLSL
SRC_FRAG_PARTICLE_CHECKERS :: #string GLSL
	#version 410 core
	in struct VO {
		vec2 uv;
		vec3 base_color;
		vec3 aspect_color;
	} vo;
	out vec4 o_color;	
	void main() {
		float r = length(vo.uv);
		o_color = vec4(r < .5 ? vo.aspect_color : vo.base_color, r < 1 ? 1 : 0);
	}
GLSL