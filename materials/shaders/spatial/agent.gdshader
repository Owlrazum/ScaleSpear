shader_type spatial;
render_mode unshaded;

uniform float alpha_b : hint_range(0, 1) = 0.9;
uniform float alpha_e : hint_range(0, 1) = 0.95;

uniform vec3 color_1 : source_color;
uniform vec3 color_2 : source_color;
uniform vec3 color_3 : source_color;
uniform vec3 color_4 : source_color;
uniform vec3 color_5 : source_color;
uniform vec3 color_6 : source_color;

uniform float count : hint_range(0, 6);

void fragment() {
	vec3 colors[6] = {color_1, color_2, color_3, color_4, color_5, color_6};
	int player = int(floor(count));
	
	ALBEDO = vec3(0.0) + step(0, count) * colors[player];
	
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	float len = length(uv);
	ALPHA = smoothstep(alpha_e, alpha_b, len);
}