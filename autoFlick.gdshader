shader_type canvas_item;
uniform vec4 base_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 hover_color : source_color = vec4(0.25, 0.65, 1.0, 1.0);
uniform vec4 pressed_color : source_color = vec4(0.15, 0.35, 0.7, 1.0);
uniform float glow_strength : hint_range(0.0, 2.0) = 0.35;
uniform float pulse_speed = 3.0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    vec4 col = tex * COLOR * base_color;

    float pulse = sin(TIME * pulse_speed) * 0.5 + 0.5;
    vec4 glow = mix(base_color, hover_color, pulse) * glow_strength;

    if (tex.a < 0.05) {
        discard;
    }

    COLOR = col + glow;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
