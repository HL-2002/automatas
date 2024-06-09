extends RigidBody2D
@export var speed = 250
var direction = Vector2.ZERO
@onready var nav  = $NavigationAgent2D
var markeds
var to_follow
var eat_is = false
# Called when the node enters the scene tree for the first time.
func _ready():
	markeds = get_tree().get_nodes_in_group("marked")
	random_marked()
	$AnimatedSprite2D.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if to_follow:
		nav.target_position = to_follow.position
		var direction = nav.get_next_path_position() - global_position
		#var velocity = Vector2.ZERO
		direction = direction.normalized()
		var velocity = Vector2.ZERO.slerp(direction,speed * delta)
		position += velocity
		 
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
	$CollisionShape2D.disabled = false
	$AnimatedSprite2D.play("walk")
	speed = 250
	eat_is = false
	
func random_marked():
	to_follow = markeds.pick_random()


func _on_navigation_agent_2d_target_reached():
	random_marked()
	
func  change_eat():
	if not eat_is:
		normal_mode()
		
	
		
	
	
func to_home():
	for node in markeds:
		if node.name == "Home":
			speed = 400
			to_follow = node
			eat_is = true
			$Score.hide()
			$CollisionShape2D.disabled = true
			$AnimatedSprite2D.show()
			$AnimatedSprite2D.play("died")
			nav.target_reached.connect(normal_mode)
			
