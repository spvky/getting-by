package main

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

debug_camera :: proc() {
	debug_string := fmt.tprintf(
		"Position: %v\nYaw: %v\nPitch: %v",
		world.camera.position,
		world.camera.yaw,
		world.camera.pitch,
	)
	rl.DrawTextEx(ui_font, strings.clone_to_cstring(debug_string), {0, 0}, 24, 1, rl.WHITE)
}
