extends Spatial

class Segment:
	var start: Vector3
	var end: Vector3
	
	func direction():
		return (end-start).normalized()
	
	func angle_to(other: Segment):
		var this_v1 = direction()
		var other_v2 = other.direction()
		var prod = this_v1.dot(other_v2)
		return acos(prod)
	
	func _init(p_start, p_end):
		start = p_start
		end = p_end
		

var segment1 = Segment.new(Vector3(25, 0, 10), Vector3(-15, 0, 10))
var segment2 = Segment.new(Vector3(-15, 0, 10), Vector3(0, 0, 0))

func _physics_process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	segment2.end = _cast_ray_to(mouse_pos)
	
	DrawingUtils.clear()
	
	DrawingUtils.begin()
	DrawingUtils.draw_vector(segment1.start, segment1.end, Color.blue)
	DrawingUtils.draw_vector(segment2.start, segment2.end, Color.violet)
	DrawingUtils.end()
	

func _cast_ray_to(pos: Vector2) -> Vector3:
	var camera = get_viewport().get_camera()
	var from = camera.project_ray_origin(pos)
	var to = from + camera.project_ray_normal(pos) * 1000
	var dict = get_world().direct_space_state.intersect_ray(from, to)
	if dict:
		return dict["position"]
	return Vector3(0, 0, 0)

func snap_vectors(from: Vector3, to: Vector3, rot_snap: float = 45.0, len_snap: float = 2.5):
	var length = from.distance_to(to)
	var direction = from.direction_to(to)
	prints(length, direction)

