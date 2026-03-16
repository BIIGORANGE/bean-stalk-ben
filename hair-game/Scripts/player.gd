extends CharacterBody2D
@export var speed = 300
@onready var game_manager: Node = %GameManager

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var health = 1
func _ready() -> void:
	pass
func add_health():
	health = health + 1
	print(health)

func subtract_health():
	health -= 1
	print(health)
	if health == 0:
		#die
		game_manager.restart_game()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_just_pressed("right"):
		animated_sprite.flip_h = false
	elif Input.is_action_just_pressed("left"):
		animated_sprite.flip_h = true

	if input_direction:
		animated_sprite.play("walk")

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
