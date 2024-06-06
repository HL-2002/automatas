extends RigidBody2D
@export var speed = 100
var direction = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if direction.x != 0 || direction.y != 0:
		#if move_and_collide(direction * speed * delta):
			#_on_walktimer_timeout()
		#else:
			#$AnimatedSprite2D.play()
			#position += direction * speed * delta
func _on_walktimer_timeout():
	pass
	#var up_down = randf()
	#var number_direction = 0
	#if randf() < 0.5:
		#number_direction = -1
	#else:
		#number_direction = 1
	#
	#if up_down < 0.5:
		#direction.x = number_direction
		#direction.y = 0
	#else:
		#direction.y = number_direction
		#direction.x =0
func enter_weak_mode():
	$AnimatedSprite2D.play("weak")
	
func get_ete():
	$AnimatedSprite2D.hide()
	$Score.show()

func normal_mode():
	$AnimatedSprite2D.play("walk")
