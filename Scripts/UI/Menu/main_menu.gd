extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_options_button_pressed() -> void:
	print("opening options")
	get_tree().paused = true
	animation_player.play("open_options")

func _on_play_button_pressed() -> void:
	print("play")
