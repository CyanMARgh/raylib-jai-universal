#import,dir "../Raylib";
#import "Basic"()(MEMORY_DEBUGGER=true);
#import "Math";
#import "Random";

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
	SetTargetFPS(60);

	while !WindowShouldClose() {
		UpdateCamera(*camera, .ORBITAL);
		draw_scene();
		reset_temporary_storage();
	}
}
