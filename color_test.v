import color

fn test_equals() {
	zero := color.Color{0, 0, 0, 0}
	assert zero.equals(color.Color{0, 0, 0, 0})

	one := color.Color{1, 1, 1, 1}
	assert one.equals(color.Color{1, 1, 1, 1})

	full := color.Color{255, 255, 255, 255}
	assert full.equals(color.Color{255, 255, 255, 255})

	custom := color.Color{255, 127, 0, 255}
	assert custom.equals(color.Color{255, 127, 0, 255})
}

