shader_type canvas_item;

const vec4 color = vec4(1, 0, 0, 1.0);
uniform bool is_dashed = true;
uniform float dashed_count = 25.5;


void fragment()
{
	float alpha = 1.0;
	
	if (is_dashed) {
		vec2 st = fract(UV * dashed_count);
		vec2 rb = step(vec2(0.5), 1.0-st);
		alpha = rb.x;
	}
	
	COLOR = vec4(color.rgb, alpha);
}