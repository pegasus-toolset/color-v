import color

const (
	tolerance = 0.000001
)

fn test_hue() {
	zero := color.Color{0, 0, 0, 0}
	assert zero.hue() == 0

	one := color.Color{1, 1, 1, 1}
	assert one.hue() == 0

	full := color.Color{255, 255, 255, 255}
	assert full.hue() == 0

	custom := color.Color{255, 127, 0, 255}
	diff := custom.hue() - 29.882353
	assert diff > -tolerance && diff < tolerance
}

fn test_saturation() {
	zero := color.Color{0, 0, 0, 0}
	assert zero.saturation() == 0

	one := color.Color{1, 1, 1, 1}
	assert one.saturation() == 0

	full := color.Color{255, 255, 255, 255}
	assert full.saturation() == 0

	custom := color.Color{255, 127, 0, 255}
	assert custom.saturation() == 1
}

fn test_lightness() {
	zero := color.Color{0, 0, 0, 0}
	assert zero.lightness() == 0

	one := color.Color{1, 1, 1, 1}
	diff := one.lightness() - 0.003922
	assert diff > -tolerance && diff < tolerance

	full := color.Color{255, 255, 255, 255}
	assert full.lightness() == 1

	custom := color.Color{255, 127, 0, 255}
	assert custom.lightness() == 0.5
}
