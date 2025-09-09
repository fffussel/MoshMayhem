extends CharacterBody2D
class_name Character

var character_name: String
var character_id: int
var player: bool
var deviceID: int

var grounded: bool

func take_damage() -> void:
	pass

# basic controller
func _input(event: InputEvent) -> void:
	if event.device == deviceID:
		if event.is_action_pressed("left"):
			pass # move left
		elif event.is_action_pressed("right"):
			pass #move right
		if event.is_action_pressed("down"):
			pass #duck
		if event.is_action_pressed("block"):
			pass #block
		if event.is_action_pressed("attack"):
			pass #attack with dir params
		if event.is_action_pressed("jump") && grounded:
			pass #jump
		if event.is_action_pressed("special"):
			pass #do special
