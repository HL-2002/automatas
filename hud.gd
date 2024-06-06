extends CanvasLayer

var points_counter = 0
var lifes_counter = 3



# Called when the node enters the scene tree for the first time.
func _ready():
	set_lifes_messages()
	set_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_points_new_point():
	$AudioStreamPlayer.play()
	points_counter += 1 * 120
	set_score()
	


func _on_player_dead():
	lifes_counter -= 1
	set_lifes_messages()
	if lifes_counter == 0:
		$"../nivel 1/Player".hide()
		$game_over.show()
		await get_tree().create_timer(1).timeout
		lifes_counter = 2
		points_counter = 0
		set_lifes_messages()
		set_score()
		get_tree().reload_current_scene()
		
		
		
		
func set_lifes_messages():
	$LifesLabel.text  = "Life "  + str(lifes_counter)

func set_score():
	$ScoreLabel.text = "score " + str(points_counter)
	
	

