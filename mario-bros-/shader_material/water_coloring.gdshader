shader_type canvas_item;

// Grabs the screen cache (which now includes the atmosphere swap!)
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

uniform vec4 water_tint : source_color = vec4(0.0, 0.4, 0.8, 1.0);
uniform float tint_strength : hint_range(0.0, 1.0) = 0.4;
uniform float wave_amplitude : hint_range(0.0, 0.1) = 0.005;

void fragment() {
    // Wave ripple math
    vec2 wave_offset;
    wave_offset.x = sin(SCREEN_UV.y * 20.0 + TIME * 2.0) * wave_amplitude;
    wave_offset.y = cos(SCREEN_UV.x * 20.0 + TIME * 2.0) * wave_amplitude;
    
    // Samples the already-swapped screen pixels
    vec4 background_color = texture(screen_texture, SCREEN_UV + wave_offset);
    
    // Tints those pixels blue
    vec3 tinted_rgb = mix(background_color.rgb, water_tint.rgb, tint_strength);
    
    COLOR = vec4(tinted_rgb, 1.0);
}
