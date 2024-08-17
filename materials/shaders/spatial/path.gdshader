shader_type spatial;
render_mode unshaded;

uniform float edge1 = 0.4f;
uniform float edge2 = 0.6f;
uniform vec3 color : source_color;

uniform float tear : hint_range(0.0, 1.0) = 0.1f;

void fragment() {
	ALBEDO = color;
	vec2 uv = UV * 2.0 - 1.0;
	//ALPHA = v;
	ALPHA = smoothstep(edge1, edge2, length(uv.x));
	ALPHA = step(tear, abs(uv.y));
}
