shader_type spatial;
render_mode unshaded;

uniform float width : hint_range(0.0, 1.0) = 0.1f;
uniform float height : hint_range(0.0, 1.0) = 0.1f;
uniform vec3 color : source_color;

float diag(vec2 v){
	float w = step(1.0 - width, v.x) * step(v.x, 1.0 + width);
	float h = step(1.0 - height, v.y) * step(v.y, 1.0 + height); 
	return w * h;
}

void fragment() {
	ALBEDO = vec3(0); 
	
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	vec2 main = vec2(UV.x + UV.y, 1.0 - UV.x + UV.y);
	vec2 second = vec2(main.y, main.x);
	ALPHA = diag(main) + diag(second);
}