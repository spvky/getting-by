package main

import rl "vendor:raylib"

Model_Tag :: enum {
	HORIZONTAL_WALL,
	VERTICAL_WALL,
	FLOOR
}

load_models :: proc(size: f32 = 100) -> [Model_Tag]rl.Model {
	wall_x_offset := size / 2
	wall_height := size / 5
	wall_y_offset := size / 10
	wall_thickness := size / 100

	horizontal_wall := rl.LoadModelFromMesh(rl.GenMeshCube(
		size, wall_height, wall_thickness
	))

	vertical_wall := rl.LoadModelFromMesh(rl.GenMeshCube(wall_thickness, wall_height, size))

	floor := rl.LoadModelFromMesh(rl.GenMeshCube(size, wall_thickness, size))

	return [Model_Tag]rl.Model {
		.HORIZONTAL_WALL = horizontal_wall,
		.VERTICAL_WALL = vertical_wall,
		.FLOOR = floor
	}
}
