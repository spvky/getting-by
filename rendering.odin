package main

import "core:math"
import rl "vendor:raylib"

render_scene :: proc() {
	rl.BeginTextureMode(screen_texture)
	rl.ClearBackground({0, 12, 240, 255})
	rl.BeginMode3D(world.camera)
	test_walls()
	rl.DrawCubeV({0, 0, 0}, {1, 1, 1}, rl.WHITE)
	rl.EndMode3D()
	rl.EndTextureMode()
}

test_walls :: proc() {
	rl.DrawCubeV({0, 10, 50}, {50, 20, 1}, rl.BLUE)
	rl.DrawCubeV({0, 10, -50}, {50, 20, 1}, rl.RED)
	rl.DrawCubeV({50, 10, 0}, {1, 20, 50}, rl.GREEN)
	rl.DrawCubeV({-50, 10, 0}, {1, 20, 50}, rl.YELLOW)
}

draw_to_screen :: proc() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.BLACK)
	source := rl.Rectangle {
		x      = 0,
		y      = f32(WINDOW_HEIGHT - SCREEN_HEIGHT),
		width  = f32(SCREEN_WIDTH),
		height = -f32(SCREEN_HEIGHT),
	}
	dest := rl.Rectangle {
		x      = 0,
		y      = 0,
		width  = f32(WINDOW_WIDTH),
		height = f32(WINDOW_HEIGHT),
	}
	origin := Vec2{0, 0}
	rotation: f32 = 0
	rl.DrawTexturePro(screen_texture.texture, source, dest, origin, rotation, rl.WHITE)
	debug_camera()
	rl.EndDrawing()
}
