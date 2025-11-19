shader_type spatial;
render_mode unshaded, cull_front, blend_mix;

uniform float width : hint_range(0.05, 0.5) = 0.1;
uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void vertex(){
	VERTEX += NORMAL * width;
}

void fragment(){
	ALBEDO = outline_color.rgb;
	ALPHA = outline_color.a;
}