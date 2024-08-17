shader_type spatial;
render_mode unshaded;

uniform float offset : hint_range(0.0, 1.0) = 0.1f;
uniform float width : hint_range(0.0, 1.0) = 0.1f;
uniform vec3 color : source_color;

void fragment() {
	ALBEDO = vec3(0); 
	
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	float v = length(uv);
	
	ALPHA = step(offset, v) * step(v, offset + width);
}