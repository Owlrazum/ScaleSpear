shader_type spatial;
render_mode unshaded;

uniform float vert : hint_range(0.0, 1.0) = 0.1f;
uniform float horiz : hint_range(0.0, 1.0) = 0.1f;

void fragment() {
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	ALPHA = smoothstep(0, vert, UV.y) * smoothstep(1.0, 1.0 - vert, UV.y);
	ALPHA *= smoothstep(0, horiz, UV.x) * smoothstep(1.0, 1.0 - horiz, UV.x);
	ALBEDO = vec3(0); 
}