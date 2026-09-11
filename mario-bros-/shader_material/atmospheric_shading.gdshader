shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform vec4 target_color : source_color = vec4(0.09, 0.039, 0.11, 1.0);
uniform vec4 replacement_color : source_color = vec4(0.286, 0.6, 1.0, 1.0);
uniform vec4 target_color2 : source_color = vec4(0.38, 0.055, 0.502, 1.0);
uniform vec4 replacement_color2 : source_color = vec4(0.525, 0.714, 0.957, 1.0);
uniform vec4 target_color3 : source_color = vec4(0.549, 0.133, 0.706, 1.0);
uniform vec4 replacement_color3 : source_color = vec4(0.675, 0.796, 0.949, 1.0);
uniform float tolerance : hint_range(0.0, 1.0) = 0.1;

void fragment() {
	vec4 screen = texture(SCREEN_TEXTURE, SCREEN_UV);

    // Compare distance between current pixel and target color
    float diff = distance(screen.rgb, target_color.rgb);
	float diff2 = distance(screen.rgb, target_color2.rgb);
	float diff3 = distance(screen.rgb, target_color3.rgb);

    if (diff < tolerance) {
        screen.rgb = replacement_color.rgb;
    }
	if (diff2 < tolerance) {
        screen.rgb = replacement_color2.rgb;
    }
	if (diff3 < tolerance) {
        screen.rgb = replacement_color3.rgb;
    }

    COLOR = screen ;
}
	// Called for every pixel the material is visible on.


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}