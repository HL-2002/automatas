extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"nivel 1/Player".position = $"nivel 1/Marker2D".position
	$Music.play()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_dead():
	$"nivel 1/Player".position = $"nivel 1/Marker2D".position


	


func _on_player_power_up_start():
	$Music.stop()


func _on_player_power_up_end():
	$Music.play()
