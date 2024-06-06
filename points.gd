extends Node
class_name  Pointa
signal new_point()


var point_count_total
var point_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var points = self.get_children() as Array[Point]
	point_count_total = points.size()
	for point in points:
		point.get_point.connect(_on_get_point)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_get_point():
	point_count += 1;
	print(point_count)
	new_point.emit()
#win game
	if point_count == point_count_total:
		if get_tree().current_scene.name == "LevelCode":
			get_tree().change_scene_to_file("res://code_level_2.tscn")
		elif get_tree().current_scene.name == "code_level_2":
			get_tree().change_scene_to_file("res://code_level_3.tscn")
		elif get_tree().current_scene.name == "code_level_3":
			get_tree().change_scene_to_file("res://code_level_4.tscn")
		else:
			pass
#fin del juego
			
			
