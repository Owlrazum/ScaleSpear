shader_type canvas_item;

uniform float appear : hint_range(0, 1) = 1;
uniform float hide : hint_range(0, 1) = 1;

void fragment() {
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	COLOR.a = step(abs(uv.x), appear) * step(abs(0.5 - uv.x), hide);
}