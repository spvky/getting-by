package main

import "core:math"

World :: struct {
	camera: Camera,
}

make_world :: proc(size: f32 = 100) -> World {
	return World {
		camera = Camera {
			position = {0, size * 0.82, size * -1.74},
			up = {0, 1, 0},
			fovy = 45,
			look_sensitivity = 10,
			pitch = math.PI * -0.125,
			yaw = math.PI * 0.5
		},
	}
}
