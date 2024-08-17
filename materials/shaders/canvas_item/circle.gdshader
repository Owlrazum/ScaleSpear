shader_type canvas_item;

uniform float aa : hint_range(0, 0.8) = 0.3;

void fragment() {
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	COLOR.a = COLOR.a * smoothstep(1, 1.0 - aa, length(uv));
}