#import,dir "../Raylib";
using RL;
#import "Basic"()(MEMORY_DEBUGGER=true);
#import "Math";
#import "Random";

fit :: (rect : Rectangle, ratio := 1.5) -> Rectangle {
    new_width := rect.height * ratio;
    new_height := rect.width / ratio;
    result : Rectangle;
    if new_width <= rect.width {
        result = .{rect.x + (rect.width - new_width) / 2, rect.y, new_width, rect.height};
    } else {
        result = .{rect.x, rect.y + (rect.height - new_height) / 2, rect.width, new_height};
    }
    result.width = max(0., result.width);
    result.height = max(0., result.height);
    return result;
}
get_full_bounds :: () -> Rectangle {
    W, H := GetScreenWidth(), GetScreenHeight();
    return .{0., 0., xx W, xx H};
}
make_offset :: (rect : Rectangle, offset : float) -> Rectangle {
    return .{rect.x + offset, rect.y + offset, rect.width - offset * 2, rect.height - offset * 2};
}
get_active_zone :: () -> Rectangle {
    return fit(make_offset(get_full_bounds(), 10.), 1.5);
}
rand_dir :: () -> Vector2 {
    phi := random_get_within_range(0., 2 * PI);
    return .{sin(phi), cos(phi)};
}
random_reflect :: (_v : Vector2, right : bool) -> Vector2 {
    v := _v + rand_dir() * .5;
    v.x = abs(v.x) + .1;
    normalize_or_zero(*v);
    if !right v.x = -v.x;
    return v;
}

// rl_allocator_proc :: (mode: Allocator_Mode, size: s64, old_size: s64, old_memory: *void, allocator_data: *void) -> *void {
// 	if mode == {
// 		case .ALLOCATE;
// 		return MemAlloc(xx size);

// 		case .RESIZE;
// 		return MemRealloc(old_memory, xx size);		

// 		// case .FREE;
// 		// MemFree(old_memory);
// 		// return null;

// 		// case .STARTUP;
// 		// return null;

// 		// case .SHUTDOWN;
// 		// return null;

// 		case;
// 		assert(false, "invalid operation: %!", mode);
// 	}
// 	return null;
// }

// RL_ALLOCATOR :: Allocator.{
// 	rl_allocator_proc,
// 	null
// };

GenMeshCustom :: () -> Mesh {
	vertices : [..]Vector3;
	array_add(*vertices, .{0, 0, 0});
	array_add(*vertices, .{3, 4, 5});
	array_add(*vertices, .{2, 0, 0});

	mesh : Mesh;
	mesh.triangleCount = 1;
	mesh.vertexCount = mesh.triangleCount * 3;
	mesh.vertices = xx vertices.data;

	UploadMesh(*mesh, false);
	return mesh;
}

main :: () {
	defer report_memory_leaks();

	W0, H0 :: 1200, 800;

	InitWindow(W0, H0, "meshes"); defer CloseWindow();
	camera := Camera.{.{5, 5, 5}, .{0, 0, 0}, .{0, 1, 0}, 45, 0};
	position := Vector3.{0, 0, 0};

	img_checked := GenImageChecked(2, 2, 1, 1, RED, GREEN); defer UnloadImage(img_checked);
	texture := LoadTextureFromImage(img_checked); defer UnloadTexture(texture);

	mesh := GenMeshCustom();
	model := LoadModelFromMesh(mesh); defer UnloadModel(model);

	draw_scene :: () #expand {
		ctx := context;
		ctx.allocator = temp;
		push_context ctx {
			global_context_for_raylib = *context;
			BeginDrawing(); defer EndDrawing();

			ClearBackground(WHITE);
			BeginMode3D(camera);
				DrawGrid(10, 1.0);
				DrawModel(model, position, 1., RED);
			EndMode3D();

			DrawFPS(20, 20);
		}
		global_context_for_raylib = null;
	}
	// SetConfigFlags(xx ConfigFlags.WINDOW_RESIZABLE);
	SetTargetFPS(60);

	while !WindowShouldClose() {
        UpdateCamera(*camera, .ORBITAL);
		draw_scene();
		reset_temporary_storage();
	}
}
