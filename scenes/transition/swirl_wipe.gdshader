shader_type canvas_item;

uniform sampler2D noise_tex : source_color;
uniform float progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    float n = texture(noise_tex, UV).r;
    if (n < progress) {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0); // black fills in
    } else {
        COLOR.a = 0.0; // transparent
    }
}
