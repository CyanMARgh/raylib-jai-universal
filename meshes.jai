#import,dir "Raylib";
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
GenMeshCustom :: () -> Mesh {
	mesh : Mesh;
	mesh.triangleCount = 1;
	mesh.vertexCount = mesh.triangleCount * 3;

	vertices := array_copy(Vector3.[
		.{0, 0, 0},
		.{3, 4, 5},
		.{2, 0, 0},
	]);
	normals := array_copy(Vector3.[
		.{0, 1, 0},
		.{0, 1, 0},
		.{0, 1, 0}
	]);
	texcoords := array_copy(Vector2.[
		.{0, 0},
		.{.5, 1},
		.{1, 0}
	]);

	mesh.vertices = xx vertices.data;
	mesh.texcoords = xx texcoords.data;
	mesh.normals = xx normals.data;

	UploadMesh(*mesh, false);
	return mesh;
}
free_mesh :: (using mesh : Mesh) {
	free(vertices);
	free(texcoords);
	free(normals);
}

main :: () {
	defer report_memory_leaks();

	W0, H0 :: 1200, 800;

	InitWindow(W0, H0, "meshes"); defer CloseWindow();
	camera := Camera.{.{5, 5, 5}, .{0, 0, 0}, .{0, 1, 0}, 45, 0};
	position := Vector3.{0, 0, 0};

	img_checked := GenImageChecked(2, 2, 1, 1, RED, GREEN);
	texture := LoadTextureFromImage(img_checked);

	print("(3)\n");
	mesh := GenMeshCustom(); defer free_mesh(mesh);
	// mesh := GenMeshPlane(2, 2, 5, 5);
	model := LoadModelFromMesh(mesh);	

	draw_scene :: () #expand {
		BeginDrawing(); defer EndDrawing();

		ClearBackground(WHITE);
		BeginMode3D(camera);
			DrawGrid(10, 1.0);
			DrawModel(model, position, 1., RED);
		EndMode3D();

		DrawFPS(20, 20);
	}

	// SetConfigFlags(xx ConfigFlags.WINDOW_RESIZABLE);
	SetTargetFPS(60);

	while !WindowShouldClose() {
        UpdateCamera(*camera, .ORBITAL);
		draw_scene();
		reset_temporary_storage();
	}
}
