extends Area2D

class_name Point

signal get_point()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player:
		$Sprite2D.hide()
		$scoreText.show()
		await get_tree().create_timer(0.3).timeout
		queue_free()
		get_point.emit()
