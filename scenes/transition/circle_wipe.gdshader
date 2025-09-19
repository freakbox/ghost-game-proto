shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.5) = 1.5;

void fragment() {
    vec2 uv = UV;
    vec2 center = vec2(0.5, 0.5); // center of screen
    float dist = distance(uv, center);

    if (dist > radius) {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0); // black outside circle
    } else {
        COLOR.a = 0.0; // transparent inside circle
    }
}
