extends Node2D





func _ready():
	
	var window_size = OS.get_window_size()
	var circle_dia = 36+10
	var circle_size = Vector2.ONE * circle_dia
	
	var circle_points_array: PoolVector2Array
	for deg in range(0,360,15):
		circle_points_array.append(circle_size.rotated(deg2rad(deg)) - circle_size / 2)
	
	$CircleDashedLine2D.position = OS.get_window_size() / 2 - Vector2(100, 100)
	$CircleDashedLine2D.draw_dashed_line(circle_points_array, circle_dia/10)
	
	
	var rect_points_array: PoolVector2Array
	var rect_length_of_side = 100
	var rect_size = Vector2.ONE * rect_length_of_side
	var rect_pos = OS.get_window_size() / 2 - Vector2(100, -100)
	
	rect_points_array.append(Vector2.ZERO - (rect_size / 2))
	rect_points_array.append(Vector2(rect_size.x, 0) - (rect_size / 2))
	rect_points_array.append(rect_size - (rect_size / 2))
	rect_points_array.append(Vector2(0, rect_size.y) - (rect_size / 2))
	rect_points_array.append(Vector2.ZERO - (rect_size / 2))
	
	$RectDashedLine2D.position = OS.get_window_size() / 2 - Vector2(-100, 100)
	$RectDashedLine2D.draw_dashed_line(rect_points_array, rect_length_of_side/50, Color.green, false, true)
	
	
	# TODO: A better way to draw rectangles
	for i in range(rect_points_array.size() - 1):
		var from = rect_points_array[i]
		var to = rect_points_array[i+1]
		
		var dashed_line = DashedLine2D.new()
		dashed_line.position = rect_pos
		dashed_line.draw_dashed_line([from, to], rect_length_of_side/50)
		add_child(dashed_line)
