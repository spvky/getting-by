package main

import l "core:math/linalg"
import rl "vendor:raylib"

Player :: struct {
	position:   Vec3,
	velocity:   Vec3,
	move_delta: Vec3,
}

set_player_move_vector :: proc() {
	x, y: f32

	if rl.IsKeyDown(.A) {
		x -= 1
	}
	if rl.IsKeyDown(.D) {x += 1}
	if rl.IsKeyDown(.W) {y += 1}
	if rl.IsKeyDown(.S) {y -= 1}

	world.player.move_delta = interpolate_vector({x, 0, y})
}

set_player_velocity :: proc() {
	player := &world.player
	player.velocity = player.move_delta * 5
}

set_player_position :: proc() {
	player := &world.player
	if player.velocity != {0, 0, 0} {
		frametime := rl.GetFrameTime()
		player.position += player.velocity * frametime
	}
}

player_physics :: proc() {
	set_player_move_vector()
	set_player_velocity()
	set_player_position()
}

render_player :: proc() {
	rl.DrawSphere(world.player.position, 2, rl.GRAY)
}
