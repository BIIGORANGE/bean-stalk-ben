extends CharacterBody2D
@export var speed = 2500
@onready var game_manager: Node = %GameManager
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var bullet = preload("res://Scenes/character_bullet.tscn")
var stalk = preload("res://Scenes/bean_stalk.tscn")

var health = 0
var current_height = 180

func change_height():
	var height = health
	collision_shape.scale.y =  height
	collision_shape.position.y = (height * current_height/4) * -1
	sprite.scale.y =  height
	
func _ready() -> void:
	health += 1
	change_height()

func add_health():
	health = health + 1
	change_height()
	print(health)
	#var stalk_instance = stalk.instantiate()
	#add_child(stalk_instance)

func subtract_health():
	health -= 1
	#var stalk_instance = stalk.instantiate()
	print(health)
	change_height()
	
	#remove_child(stalk_instance)
	if health == 0:
		#die
		game_manager.restart_game()
	
func shoot():
	var instance = bullet.instantiate()
	var mouse_pos = get_global_mouse_position()
	var spawn_pos = self.global_position
	var direction = (mouse_pos - spawn_pos).normalized()
	instance.global_position = spawn_pos
	instance.velocity = direction * instance.speed
	get_tree().current_scene.get_parent().add_child(instance)
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
	elif Input.is_action_just_pressed("left"):
		sprite.flip_h = true
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
