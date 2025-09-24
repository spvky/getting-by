package main

import "core:math"

World :: struct {
	camera: Camera,
}

make_world :: proc() -> World {
	return World {
		camera = Camera {
			position = {0, 82, -174},
			up = {0, 1, 0},
			fovy = 45,
			look_sensitivity = 10,
			pitch = math.PI * -0.125,
			yaw = math.PI * 0.5
		},
	}
}
