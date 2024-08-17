shader_type spatial;
render_mode unshaded;

uniform float radius : hint_range(0, 1) = 0.4f;
uniform float circle_width : hint_range(0, 1) = 0.6f;
uniform float aa : hint_range(0.0, 0.5) = 0.1f;
uniform float spike_length : hint_range(0.2, 1) = 0.2;
uniform float spike_width : hint_range(0.0, 1) = 0.5;
uniform float spike_count = 4;


void fragment() {
	vec2 uv = (UV - vec2(0.5)) * 2.0;
	float len = length(uv);
	ALPHA = smoothstep(radius, radius + aa, len);
	ALPHA *= smoothstep(radius + circle_width, radius + circle_width - aa, len);
	float angle = atan(uv.y, uv.x) * (spike_count * 0.5) / PI + spike_count / 2.0;
	angle = fract(angle);
	float c = smoothstep(0, aa, angle) * smoothstep(spike_width, spike_width - aa, angle);
	c *= step(spike_length - 0.3, len) * step(len, spike_length);
	ALPHA += c;
	ALBEDO = vec3(0);
}