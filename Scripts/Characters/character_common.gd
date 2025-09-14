extends CharacterBody2D
class_name Character

@onready var block_time: Timer = $BlockTime
@onready var cooldown: Timer = $Cooldown

enum ATTACKDIRECTIONS {NEUTRAL, UP, SIDE, DOWN}

var character_name: String
var character_id: int
var player: bool
var deviceID: int = 0   # set per-player/device

var special_bar_pc: int = 0
var in_controll: bool = true
var att_dir: ATTACKDIRECTIONS
 
var grounded: bool = false

# tuning
var speed: float = 220.0
var jump_velocity: float = -420.0
var gravity: float = 1200.0

# internal input state (don't shadow `velocity`)
var _move_dir: int = 0
var _wants_jump: bool = false

func _input(event: InputEvent) -> void:
	if event.device != deviceID or not in_controll:
		return

	if event.is_action_pressed("left"):
		_move_dir = -1
	elif event.is_action_pressed("right"):
		_move_dir = 1

	if event.is_action_released("left") and _move_dir == -1:
		_move_dir = 0
	if event.is_action_released("right") and _move_dir == 1:
		_move_dir = 0

	if event.is_action_pressed("jump"):
		_wants_jump = true

	if event.is_action_pressed("attack"):
		print("attack " + str(get_attack_dir()))
	if event.is_action_pressed("special"):
		print("special " + str(special_bar_pc) + "%")
	if event.is_action_pressed("block"):
		print("block")

func get_attack_dir() -> ATTACKDIRECTIONS:
	if Input.is_action_pressed("up"):
		return ATTACKDIRECTIONS.UP
	elif Input.is_action_pressed("down"):
		return ATTACKDIRECTIONS.DOWN
	elif Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return ATTACKDIRECTIONS.SIDE
	else:
		return ATTACKDIRECTIONS.NEUTRAL

func _physics_process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		pass
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		velocity.x = _move_dir * speed
	if _wants_jump and is_on_floor():
		velocity.y = jump_velocity
	_wants_jump = false
	move_and_slide()
	grounded = is_on_floor()
