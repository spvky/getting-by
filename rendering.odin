package main

import rl "vendor:raylib"

render_scene :: proc() {
	rl.BeginTextureMode(screen_texture)
	rl.ClearBackground(rl.BLACK)
	rl.BeginMode3D(world.camera)
	render_player()
	test_walls(50)
	rl.EndMode3D()
	rl.EndTextureMode()
}

test_walls :: proc(size: f32 = 100) {
	wall_x_offset := size / 2
	wall_height := size / 5
	wall_y_offset := size / 10
	wall_thickness := size / 100
	rot_axis :Vec3={0,1,0}
	uniform_scale :Vec3={1,1,1}
	rl.DrawModelEx(models[.HORIZONTAL_WALL],{0, wall_y_offset, wall_x_offset}, rot_axis, 0, uniform_scale, rl.RED)
	rl.DrawModelEx(models[.VERTICAL_WALL],{wall_x_offset, wall_y_offset, 0}, rot_axis, 0, uniform_scale, rl.GREEN)
	rl.DrawModelEx(models[.VERTICAL_WALL],{-wall_x_offset, wall_y_offset, 0}, rot_axis, 0, uniform_scale, rl.YELLOW)
	rl.DrawModelEx(models[.FLOOR], {0, -wall_thickness / 2, 0}, rot_axis,0,uniform_scale, rl.WHITE)
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
