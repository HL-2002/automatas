extends CharacterBody2D

class_name Player

signal dead
signal power_up_start
signal power_up_end
var SPEED = 200.0
var Eate_enemys = false
var counter_powers = 0




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
	if body.is_in_group("enemy") && not Eate_enemys:
		$diedSound.play()
		$AnimatedSprite2D.play("die")
		await get_tree().create_timer(0.6).timeout
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 3
		dead.emit()
		$AnimatedSprite2D.frame = 0
	elif body.is_in_group("enemy"):
		body.get_ete()
		$AnimatedSprite2D.hide()
		get_tree().paused = true
		await get_tree().create_timer(0.5).timeout		
		get_tree().paused = false
		body.to_home()
		$AnimatedSprite2D.show()
		
		

func get_power():
	SPEED = 300
	counter_powers += 1
	Eate_enemys = true
	get_tree().call_group("enemy","enter_weak_mode")
	power_up_start.emit()
	await get_tree().create_timer(5).timeout
	counter_powers -= 1	
	if counter_powers >= 2:
		return
	power_up_end.emit()
	Eate_enemys = false
	SPEED = 200
	get_tree().call_group("enemy","change_eat")
	
