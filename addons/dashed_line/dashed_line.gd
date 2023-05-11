tool
class_name DashedLine2D, "dashed_line.svg"
extends Line2D


const gdshader = preload("dashed_line.gdshader")


func _init():
	material = ShaderMaterial.new()
	material.shader = gdshader
	texture_mode = Line2D.LINE_TEXTURE_STRETCH
	width = 3


func draw_dashed_line(_points: PoolVector2Array, _width: float = 1.0, color: Color = Color.white, is_dashed: bool = true, _antialiased: bool = false):
	points = _points
	width = clamp(_width, 1, 50)
	antialiased = _antialiased
	
	var point_distance = 0
	for i in range(points.size() - 1):
		point_distance += points[i].distance_to(points[i+1])
	
#	print(point_distance)
	
	# TODO: + 0.5 解决, 最后绘制线时不显示最后一段的问题
	var dashed_count = ceil((point_distance / 10) / width) + 0.5
#	print(dashed_count)
	material.set_shader_param("color", color)
	material.set_shader_param("is_dashed", is_dashed)
	material.set_shader_param("dashed_count", dashed_count)


