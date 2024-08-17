shader_type canvas_item;

// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 color = textureLod(screen_texture, SCREEN_UV, 0.0);
	color = vec4(1.0 - color.r, 1.0 - color.g , 1.0 - color.b, COLOR.w);
    COLOR = color;
}