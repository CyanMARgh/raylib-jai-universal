#import,dir "Raylib";
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

main :: () {
	defer report_memory_leaks();

	W0, H0 :: 1200, 800;

	using game_data : struct {
		player_y, bot_y : float = .5;

		ball_pos, ball_speed : Vector2;

		state : enum u8 {
			IDLE	:: 0;
			RUN		:: 1;
		};
		player_score, bot_score := 0;

		collision_count := 0;
		cc_to_speed := (cc : int) -> float { return xx pow(1.1, xx min(cc, 20)); };
	};

	BALL_RAD :: 0.03;
	draw_scene :: () #expand {
		BeginDrawing(); defer EndDrawing();

		ClearBackground(GRAY);
		zone := get_active_zone();
		DrawRectangleRec(zone, BLACK);

		BAR_W :: 0.02;
		BAR_W_S := BAR_W * zone.width;

		DrawRectangleRec(.{zone.x, zone.y + zone.height * player_y * .8, BAR_W_S, zone.height * .2}, WHITE);
		DrawRectangleRec(.{zone.x + zone.width - BAR_W_S, zone.y + zone.height * bot_y * .8, BAR_W_S, zone.height * .2}, WHITE);

		BALL_RAD_S := zone.height * BALL_RAD;

		DrawCircle(
			xx(zone.x + BALL_RAD_S + BAR_W_S + (ball_pos.x + 1) / 2 * (zone.width - (BALL_RAD_S + BAR_W_S) * 2)), 
			xx(zone.y + BALL_RAD_S + (ball_pos.y + 1) / 2 * (zone.height - BALL_RAD_S * 2)),
			BALL_RAD_S,
			RED
		);

		DrawText(tprint("%\0", player_score).data,
			xx (zone.x + zone.width / 4 - 20),
			xx (zone.y + 20),
			80,
			RAYWHITE
		);
		DrawText(tprint("%\0", bot_score).data,
			xx (zone.x + 3 * zone.width / 4 - 20),
			xx (zone.y + 20),
			80,
			RAYWHITE
		);

		// DrawFPS(20, 20);
	}

	iterate :: (dt : float) #expand {
		pad_speed :: .7;

		if state == {
			case .IDLE;
			ball_pos = .{0, 0};
			if IsKeyPressed(KEY_SPACE) {
				//TODO restart()
				collision_count = 0;
				ball_speed = rand_dir();
				state = .RUN;	
			}

			case .RUN;
			scaled_ball_coord := BALL_RAD + (ball_pos.y * .5 + .5) * (1 - 2 * BALL_RAD);
			scaled_player_coord := .1 + player_y * .8;
			scaled_bot_coord := .1 + bot_y * .8;

			bot_dir := ifx abs(scaled_bot_coord - scaled_ball_coord) < .07 then 0 else ifx scaled_bot_coord < scaled_ball_coord then 1 else -1;
			player_dir := cast(int)IsKeyDown(KEY_DOWN) - cast(int)IsKeyDown(KEY_UP);
	
			bot_y += bot_dir * pad_speed * dt;
			player_y += player_dir * pad_speed * dt;

			Clamp(*bot_y, 0, 1);
			Clamp(*player_y, 0, 1);

			scaled_bot_coord = .1 + bot_y * .8;

			ball_pos += ball_speed * cc_to_speed(collision_count) * dt;
			if ball_pos.y > 1 {
				ball_pos.y = 2 - ball_pos.y;
				ball_speed.y *= -1;
			} else if ball_pos.y < -1 {
				ball_pos.y = -2 - ball_pos.y;
				ball_speed.y *= -1;
			}
			if ball_pos.x > 1 {
				ball_pos.x = 2 - ball_pos.x;
				ball_speed = random_reflect(ball_speed, false);
				collision_count += 1;

				if abs(scaled_ball_coord - scaled_bot_coord) > .1 {
					state = .IDLE;
					player_score += 1;
				}
			} else if ball_pos.x < -1 {
				ball_pos.x = -2 - ball_pos.x;
				ball_speed = random_reflect(ball_speed, true);
				collision_count += 1;

				if abs(scaled_ball_coord  - scaled_player_coord) > .1 {
					state = .IDLE;
					bot_score += 1;
				}
			}
			assert(abs(ball_pos.y) <= 1 && abs(ball_pos.x) <= 1);
		}
	}
	SetConfigFlags(xx ConfigFlags.WINDOW_RESIZABLE);
	InitWindow(W0, H0, "pong"); defer CloseWindow();
	SetTargetFPS(60);

	while !WindowShouldClose() {
		iterate(GetFrameTime());
		draw_scene();
		reset_temporary_storage();
	}
}