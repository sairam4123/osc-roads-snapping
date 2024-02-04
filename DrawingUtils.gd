extends Node


var im_geo: ImmediateGeometry = ImmediateGeometry.new()

func _ready():
	add_child(im_geo)
	im_geo.material_override = preload("res://im_geo.tres")
	
func draw_vector(from: Vector3, to: Vector3, color: Color):
	im_geo.set_color(color)
	im_geo.add_vertex(from)
	im_geo.set_color(color)
	im_geo.add_vertex(to)
	im_geo.set_color(Color.white)

func begin():
	im_geo.begin(Mesh.PRIMITIVE_LINES)

func end():
	im_geo.end()


func clear():
	im_geo.clear()
