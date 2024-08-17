shader_type canvas_item;

uniform float level : hint_range(0, 1);
uniform float levelsAmount = 3;
uniform float sandLength : hint_range(0, 0.6);

uniform float aa : hint_range(0, 0.5) = 0.1;

void fragment() {
	float col = step(UV.y, 1.0 - level);
	float fra = fract(UV.y * levelsAmount);
	col += smoothstep(0.5 + aa, 0.5, fra);
	col += smoothstep(1.0 - aa, 1.0, fra);
	col *= step(aa * level, 1.0 - UV.y);
	col += step(1.0, sandLength * sin(UV.y * 3.14) + UV.x);
	col += step(0.0, sandLength * sin(UV.y * 3.14) - UV.x);
	vec4 color = vec4(col, col, col, 1.0);
	COLOR = color;
}
