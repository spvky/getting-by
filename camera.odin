package main

import m "core:math"
import l "core:math/linalg"
import rl "vendor:raylib"

Camera :: struct {
	using raw:        rl.Camera3D,
	look_sensitivity: f32,
	mode:             CameraMode,
	pitch:            f32,
	yaw:              f32,
	forward:          Vec3,
	right:            Vec3,
}

CameraMode :: enum {
	Free,
	LockedOn,
}

update_camera :: proc() {
	frametime := rl.GetFrameTime()
	camera := &world.camera
	camera.yaw += m.to_radians_f32(90) * frametime
	#partial switch camera.mode {
	case .Free:
		delta := rl.GetMouseDelta()
		min: f32 = -89
		max: f32 = 89

		forward := l.normalize(
			Vec3 {
				m.cos(camera.yaw) * m.cos(camera.pitch),
				m.sin(camera.pitch),
				m.sin(camera.yaw) * m.cos(camera.pitch),
			},
		)
		right := l.normalize(l.cross(forward, Vec3{0, 1, 0}))


		camera.forward = forward
		camera.right = right
		world.camera.target = camera.position + forward
	}
}


interpolate_vector :: proc(vector: Vec3) -> Vec3 {
	true_vec := (world.camera.forward * vector.z) + (world.camera.right * vector.x)
	true_vec.y = 0
	return l.normalize0(true_vec)
}
