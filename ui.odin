package main

import rl "vendor:raylib"

load_font :: proc() -> rl.Font {
	return rl.LoadFont("assets/fonts/medodica.otf")
}
