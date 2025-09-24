package main

import "core:c"
import rl "vendor:raylib"

world: World
screen_texture: rl.RenderTexture
run: bool
ui_font: rl.Font

WINDOW_WIDTH: i32
WINDOW_HEIGHT: i32
SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450


init :: proc() {
	WINDOW_WIDTH = 1600
	WINDOW_HEIGHT = 900
	run = true
	ui_font = load_font()
	rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Game")
	screen_texture = rl.LoadRenderTexture(WINDOW_WIDTH, WINDOW_HEIGHT)
	world = make_world()
}

update :: proc() {
	update_camera()
	render_scene()
	draw_to_screen()
}

shutdown :: proc() {
	rl.UnloadRenderTexture(screen_texture)
	rl.CloseWindow()
}

should_run :: proc() -> bool {
	when ODIN_OS != .JS {
		run = !rl.WindowShouldClose()
	}
	return run
}

parent_window_size_changed :: proc(w, h: int) {
	WINDOW_WIDTH = i32(w)
	WINDOW_HEIGHT = i32(h)
	rl.SetWindowSize(c.int(WINDOW_WIDTH), c.int(WINDOW_WIDTH))
}
