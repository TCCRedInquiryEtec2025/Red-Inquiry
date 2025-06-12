shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);

    float r = color.r;
    float g = color.g;
    float b = color.b;

    // Verifica se o vermelho é significativamente maior que os outros componentes
    float red_diff = r - max(g, b);

    if (red_diff < 0.3) {
        // Converte para escala de cinza (média simples)
        float gray = (r + g + b) / 3.0;
        color.rgb = vec3(gray);
    }

    COLOR = color;
}
