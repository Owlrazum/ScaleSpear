shader_type canvas_item;

uniform float freq : hint_range(0, 5) = 1.6;
uniform float speed : hint_range(0, 5) = 3;
uniform float level : hint_range(0, 1) = 1.0;
uniform float amplitude : hint_range(0.0, 0.5) = 0.1;

uniform float aa : hint_range(0, 0.5) = 0.1;

uniform float levels_amount = 3;
uniform float markLength : hint_range(0, 0.4) = 0.1;
uniform float sandLength : hint_range(0, 0.6) = 0.25;

void fragment() {
	float col = 1.0;
	float m = mod(UV.y, 1.0 / levels_amount);
	col *= smoothstep(markLength + markLength * 0.5 + aa, markLength, m);
	col *= smoothstep(markLength - markLength * 0.5 - aa, markLength, m);
	col += step(0.5 + sandLength, sandLength * sin(UV.y * 3.14 + 3.14) + UV.x);
	col += step(-0.5 + sandLength, sandLength * sin(UV.y * 3.14 + 3.14) - UV.x);
	
	float wave = sin(UV.x * TAU * freq + TIME * speed) * 0.5 + 0.5;
	wave = amplitude * wave;
	col += smoothstep(1.0 - level + aa, 1.0 - level, wave + UV.y);
	vec4 color = vec4(col, col, col, 1.0);
	COLOR = color;
}
