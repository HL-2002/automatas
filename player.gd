extends CharacterBody2D

class_name Player

const SPEED = 200.0




func _physics_process(_delta):
	# Get input's direction
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up","ui_down")

	if  bool(direction) != bool(direction_y)  :
		velocity.x = 0
		velocity.y = 0
		velocity.x = direction * SPEED
		velocity.y = direction_y * SPEED
		$AnimatedSprite2D.play("walk")

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		$AnimatedSprite2D.play("die")
		await get_tree().create_timer(0.6).timeout
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 3

