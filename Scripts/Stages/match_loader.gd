extends Node2D

var stage: Stage
var characters: Array[String]

#debug
const TEST_STAGE = preload("res://Scenes/Stages/test_stage.tscn")
const TestCharacter = preload("res://Scenes/Characters/Characters/TestCharacter.tscn")

func _ready() -> void:
	var map_instance = TEST_STAGE.instantiate();
	var char_instance = TestCharacter.instantiate()
	char_instance.position = map_instance.p1_spawn.position
	map_instance.add_child(char_instance)
	
	
	add_child(map_instance)
