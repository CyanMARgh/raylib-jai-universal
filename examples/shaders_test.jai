#import,dir "../Raylib";
using RL;
#import "Math";
#import "Basic"()(MEMORY_DEBUGGER = true);
#import "GL";
#import "Random";
#import "File";

#load "particle_system.jai";

set_shader_value :: (shader : Shader, location : s32, value : $T, t0 := ShaderUniformDataType.FLOAT) {
	is_enum_s32 :: ($T : Type) -> bool {
		ti := type_info(T);
		if ti.type != .ENUM return false;
		using (cast(*Type_Info_Enum)ti).internal_type;
		return runtime_size == 4 && signed;
	}

	#if T == Matrix4 || T == Matrix {
		SetShaderValueMatrix(shader, location, value);
	} else #if T == Texture2D {
		SetShaderValueTexture(shade, location, value);
	} else {
		t := t0;
		#if T == float {
			t = .FLOAT;
		} else #if (T == [2]float) || (T == Vector2) {
			t = .VEC2;
		} else #if (T == [3]float) || (T == Vector3) {
			t = .VEC3;
		} else #if (T == [4]float) || (T == Vector4) {
			t = .VEC4;
		} else #if (T == [1]s32) || (T == s32) || #run is_enum_s32(T) {
			t = .INT;
		} else #if T == [2]s32 {
			t = .IVEC2;
		} else #if T == [3]s32 {
			t = .IVEC3;
		} else #if T == [4]s32 {
			t = .IVEC4;
		} else {
			#run assert(false, "unknown type");
		}
		SetShaderValue(shader, location, *value, t);
	}
}
MAX_LIGHTS :: 4;
Light :: struct {
	type : enum s32 {
		DIRECTIONAL :: 0;
		POINT :: 1;
	} = .POINT;
	enabled := true;
	position : Vector3;
	target : Vector3;
	color : Color;
	attenuation : float;
}
Light_Loc :: struct {
	enabled : s32;
	type : s32;
	position : s32;
	target : s32;
	color : s32;
	attenuation : s32;
}
get_light_locations :: (shader : Shader, i : int) -> Light_Loc {
	using result : Light_Loc;
	enabled = GetShaderLocation(shader, tprint("lights[%].enabled\0", i).data);
	type = GetShaderLocation(shader, tprint("lights[%].type\0", i).data);
	position = GetShaderLocation(shader, tprint("lights[%].position\0", i).data);
	target = GetShaderLocation(shader, tprint("lights[%].target\0", i).data);
	color = GetShaderLocation(shader, tprint("lights[%].color\0", i).data);
	return result;
}
set_shader_values :: (shader : Shader, loc : Light_Loc, light : Light) {
	set_shader_value(shader, loc.enabled, cast(s32)light.enabled);
	set_shader_value(shader, loc.type, light.type);
	set_shader_value(shader, loc.position, light.position);
	set_shader_value(shader, loc.target, light.target);
	set_shader_value(shader, loc.color, Vector4.{xx light.color.r, xx light.color.g, xx light.color.b, xx light.color.a}  / 255.);
}
Light_Shader :: struct {
	#as using shader : Shader;
	lights : [MAX_LIGHTS]Light;
	ambient : Color;
	light_locs : [MAX_LIGHTS]Light_Loc;
	ambient_loc : s32;
}
init :: (using light_shader : *Light_Shader) {
	shader = LoadShader("lighting.vert", "lighting.frag");

	locs[SHADER_LOC_VECTOR_VIEW] = GetShaderLocation(shader, "viewPos");

	ambient_loc = GetShaderLocation(shader, "ambient");
	for i : 0..MAX_LIGHTS-1 light_locs[i] = get_light_locations(shader, i);
}
update_light_values :: (using light_shader : *Light_Shader) {
	set_shader_value(shader, ambient_loc, Vector4.{0.1, 0.1, 0.1, 1});
	for i : 0..3 set_shader_values(shader, light_locs[i], lights[i]);		
}
deinit :: (using light_shader : *Light_Shader) {
	UnloadShader(shader);
}
get_material :: (using light_shader : Light_Shader) -> Material { return .{shader = shader}; } 
switch_light :: (using light_shader : *Light_Shader, i : int) {
	lights[i].enabled ^= true;
}
set_camera_pos :: (using light_shader : *Light_Shader, camera : Camera) {
	set_shader_value(shader, locs[SHADER_LOC_VECTOR_VIEW], camera.position);	
}

find_intersection :: (camera : Camera) -> RayCollision {
	ray := GetMouseRay(GetMousePosition(), camera);
	collision := GetRayCollisionBox(ray, .{.{-10, 0, -10}, .{10, 0, 10}});
	return collision;
}

main :: () {
	defer report_memory_leaks();
	W, H : s32 = 800, 450;

	SetConfigFlags(.MSAA_4X_HINT);
	SetConfigFlags(.WINDOW_RESIZABLE);
	InitWindow(W, H, "basic lighting"); defer CloseWindow();
	gl_load(*gl);

	camera := Camera.{position = .{2, 4, 6}, target = .{0, 0.5, 0}, up = .{0, 1, 0}, fovy = 45, projection = .PERSPECTIVE};
	particle_system := Particle_System.{particles_count = 100000};
	init(*particle_system); defer deinit(*particle_system);

	light_shader : Light_Shader; init(*light_shader); defer deinit(*light_shader);
	light_shader.lights = .[.{position = .{-2,  1, -2}, color = YELLOW}, .{position = .{ 2,  1,  2}, color = RED}, .{position = .{-2,  1,  2}, color = GREEN}, .{position = .{ 2,  1, -2}, color = BLUE}];
	update_light_values(*light_shader);

	plane := LoadModelFromMesh(GenMeshPlane(20, 20, 1, 1)); defer UnloadModel(plane);
	cube := LoadModelFromMesh(GenMeshCube(2, 4, 2)); defer UnloadModel(cube);
	sphere := LoadModelFromMesh(GenMeshSphere(.2, 16, 16)); defer UnloadModel(sphere);
	plane.materials[0].shader = light_shader;

	cam_state : enum u8 {FIXED; MOVE;} = .FIXED;

	SetTargetFPS(60);
	while (!WindowShouldClose()) {
		set_camera_pos(*light_shader, camera);
		for KeyboardKey.[.Y, .R, .G, .B] if IsKeyPressed(it) switch_light(*light_shader, it_index);
		update_light_values(*light_shader);

		if IsMouseButtonPressed(.RIGHT) {
			if(cam_state == .FIXED) {
				DisableCursor();
				cam_state = .MOVE;
			} else {
				EnableCursor();
				cam_state = .FIXED;
			}
		}
		if cam_state == {
			case .FIXED;
			if IsMouseButtonDown(.LEFT) {
				coll := find_intersection(camera);
				if coll.hit {
					emit(*particle_system, coll.point);
				}
			}
			case .MOVE;
			update_camera_free_move(*camera);
		}
		simulate(*particle_system, GetFrameTime());
		BeginDrawing();
			ClearBackground(RAYWHITE);
			BeginMode3D(camera);
				DrawModel(plane, .{}, 1, WHITE);
				for light_shader.lights if it.enabled DrawModel(sphere, it.position, 1, it.color);
				DrawGrid(20, 1);
				draw(*particle_system);
			EndMode3D();
			DrawFPS(10, 10);
		EndDrawing();
		reset_temporary_storage();
	}
}