extends Node

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
#win game
	if point_count == point_count_total:
		print("win")
