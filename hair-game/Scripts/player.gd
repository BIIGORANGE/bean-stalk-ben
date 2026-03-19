extends CharacterBody2D
@export var speed = 250
@onready var game_manager: Node = %GameManager
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var bullet = preload("res://Scenes/character_bullet.tscn")
@onready var gun: Node2D = $gun


var health = 0


func change_height():
	var height = health
	collision_shape.scale.y =  height
	collision_shape.position.y = ((height * 15)/2) * -1
	
func _ready() -> void:
	health += 1
	change_height()
	pass

func add_health():
	health = health + 1
	change_height()
	print(health)

func subtract_health():
	health -= 1
	print(health)
	change_height()
	if health == 0:
		#die
		game_manager.restart_game()
func shoot():
	var instance = bullet.instantiate()
	
	var mouse_pos = get_global_mouse_position()
	var spawn_pos = gun.global_position
	
	var direction = (mouse_pos - spawn_pos).normalized()
	print(direction)
	instance.global_position = spawn_pos
	instance.velocity = direction * instance.speed
	
	
	get_tree().current_scene.get_parent().add_child(instance)
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("right"):
		animated_sprite.flip_h = false
	elif Input.is_action_just_pressed("left"):
		animated_sprite.flip_h = true
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
