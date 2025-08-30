extends Control

@export var animation_p: AnimationPlayer

func _on_backbutton_pressed() -> void:
	print("closing options")
	animation_p.play("close_options")
