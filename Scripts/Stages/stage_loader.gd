extends Node2D

var stage: Stage
const TEST_STAGE = preload("res://Scenes/Stages/test_stage.tscn")

func _ready() -> void:
	var instance = TEST_STAGE.instantiate();
	add_child(instance)
