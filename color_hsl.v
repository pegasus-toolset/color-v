module color

enum Channel {
	red green blue
}

// hue gets the hue-saturation-lightness (HSL) hue value, in degrees, for this color.
pub fn (this Color) hue() f32 {
	min := this.min_value()
	max := this.max_value()

	if max - min == 0 {
		return 0
	}

	hue := match this.max_channel() {
		.red { (f32(this.g) - f32(this.b)) / (max - min)}
		.green { 2.0 + (f32(this.b) - f32(this.r)) / (max - min)}
		else { 4.0 + (f32(this.r) - f32(this.g)) / (max - min)}
	}

	if hue < 0 {
		return hue / 255 * 60 + 360
	}
	return hue / 255 * 60
}

// saturation gets the hue-saturation-lightness (HSL) saturation value for this color.
pub fn (this Color) saturation() f32 {
	lightness := this.lightness()

	min := this.min_value()
	max := this.max_value()

	if lightness <= 0.5 {
		if max + min == 0 { return 0 }
		return (max - min) / (max + min)
	} else {
		if 2.0 - max - min == 0 { return 0}
		return (max - min) / (2.0 - max - min)
	}
}

// lightness gets the hue-saturation-lightness (HSL) lightness value for this color.
pub fn (this Color) lightness() f32 {
	return (this.min_value() + this.max_value()) / 2
}

fn (this Color) min_value() f32 {
	if this.r < this.g {
		if this.r < this.b {
			return f32(this.r) / 255
		}
		return f32(this.b) / 255
	} else if this.r < this.b {
		return f32(this.g) / 255
	}
	return f32(this.b) / 255
}

fn (this Color) max_value() f32 {
	if this.r > this.g {
		if this.r > this.b {
			return f32(this.r) / 255
		}
		return f32(this.b) / 255
	} else if this.r > this.b {
		return f32(this.g) / 255
	}
	return f32(this.b) / 255
}

fn (this Color) min_channel() Channel {
	min := this.min_value() * 255
	match byte(min) {
		this.r { return .red }
		this.g { return .green }
		else { return .blue }
	}
}

fn (this Color) max_channel() Channel {
	max := this.max_value() * 255
	match byte(max) {
		this.r { return .red }
		this.g { return .green }
		else { return .blue }
	}
}
