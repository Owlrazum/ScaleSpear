shader_type spatial;
render_mode unshaded;

uniform float edge1 : hint_range(0, 1) = 0.4f;
uniform float edge2 : hint_range(0, 1) = 0.6f;
uniform float alpha_b : hint_range(0, 1) = 0.9;
uniform float alpha_e : hint_range(0, 1) = 0.95;

void fragment() {
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	float len = length(uv);
	ALPHA = smoothstep(alpha_e, alpha_b, len);
	if (ALPHA > 0.0)
	{
		ALBEDO = vec3(0.0);
		ALBEDO *= vec3(smoothstep(edge2, edge1, len));
		ALBEDO += vec3(smoothstep(edge1, edge2, len));
	}
}