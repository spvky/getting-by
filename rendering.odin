package main

import rl "vendor:raylib"

render_scene :: proc() {
	rl.BeginTextureMode(screen_texture)
	rl.ClearBackground({0, 12, 240, 255})
	rl.BeginMode3D(world.camera)
	test_walls(10)
	rl.EndMode3D()
	rl.EndTextureMode()
}

test_walls :: proc(size: f32 = 100) {
	wall_x_offset := size / 2
	wall_height := size / 5
	wall_y_offset := size / 10
	wall_thickness := size / 100
	rl.DrawCubeV({0,wall_y_offset,wall_x_offset}, {size,wall_height,wall_thickness}, rl.RED)
	rl.DrawCubeV({wall_x_offset,wall_y_offset, 0}, {wall_thickness, wall_height, size}, rl.GREEN)
	rl.DrawCubeV({-wall_x_offset,wall_y_offset, 0}, {wall_thickness, wall_height, size}, rl.YELLOW)
	rl.DrawCubeV({0, -wall_thickness/2, 0}, {size, wall_thickness, size}, rl.WHITE)
}

draw_to_screen :: proc() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.BLACK)
	source := rl.Rectangle {
		x      = f32(SCREEN_WIDTH) / 2,
		y      = f32(SCREEN_HEIGHT) / 2,
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
