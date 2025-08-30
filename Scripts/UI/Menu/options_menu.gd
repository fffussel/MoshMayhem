extends Control

@export var animation_p: AnimationPlayer

func _on_backbutton_pressed() -> void:
	animation_p.play("close_options")
