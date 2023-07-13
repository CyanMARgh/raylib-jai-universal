#import,dir "../Raylib";
using RL;
#import "Basic"()(MEMORY_DEBUGGER=true);
#import "Math";
#import "Random";

main :: () {
	defer report_memory_leaks();
	W0, H0 :: 1200, 800;

	InitWindow(W0, H0, "pong"); defer CloseWindow();
	camera := Camera.{.{5, 5, 5}, .{0, 0, 0}, .{0, 1, 0}, 45, 0};

	SetTargetFPS(60);
	// DisableCursor();

	while !WindowShouldClose() {
        // UpdateCamera(*camera, .FIRST_PERSON);
		draw_scene(*camera);
		reset_temporary_storage();
	}
}

find_mouse_collision :: (camera : *Camera) -> RayCollision {
	ray := GetMouseRay(GetMousePosition(), <<camera);
	S := Vector3.{1.3, 2.1, 1.};
	return GetRayCollisionCylinder(ray, .{0, 0, 0}, .{0, 3, 0}, 1);
}
draw_collision :: (collison : RayCollision) {
	if collison.hit {
		p1 := collison.point;
		p2 := p1 + .2 * collison.normal;
		DrawCube(p1, .05, .05, .05, SKYBLUE);
		DrawLine3D(p1, p2, BLUE);		
	}
}

draw_scene :: (camera : *Camera) {
	BeginDrawing(); defer EndDrawing();

	ClearBackground(WHITE);
	BeginMode3D(<<camera);
		DrawGrid(10, 1.0);
		DrawCylinder(.{0, 0, 0}, 1, 1, 3, 32, RED);
		// DrawCube(.{0, 0, 0}, 1.3, 2.1, 1, RED);
		draw_collision(find_mouse_collision(camera));
	EndMode3D();

	DrawFPS(20, 20);
}