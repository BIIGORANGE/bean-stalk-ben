extends Node

@onready var player: CharacterBody2D = %Player
@onready var beetle_spawn_timer: Timer = $BeetleSpawnTimer
@onready var restart_timer: Timer = $RestartTimer
@onready var fly_spawn_timer: Timer = $FlySpawnTimer
@onready var fly = preload("res://Scenes/fly.tscn")
@onready var health_pickup = preload("res://Scenes/health.tscn")
@onready var beetle = preload("res://Scenes/beetle.tscn")

var r_numberx = randf_range(-6300, 6400)
var r_numbery = randf_range(-3500,3500)

func _ready():
	start_spawn()
	randomize()

func start_spawn():
	fly_spawn_timer.start()
	beetle_spawn_timer.start()

func drop_health_pickup(pos: Vector2):
	var instance = health_pickup.instantiate()
	add_sibling(instance)
	instance.global_position = pos
	
func random_spawn(entity):
	var instance = entity.instantiate()
	add_sibling(instance)
	instance.position = Vector2(r_numberx,r_numbery)
	instance.game_manager = self
	instance.player = player

func _on_fly_spawn_timer_timeout() -> void:
	r_numberx = randf_range(-6300, 6400)
	r_numbery = randf_range(-3500,3500)
	random_spawn(fly)
	
func _on_beetle_spawn_timer_timeout() -> void:
	r_numberx = randf_range(-6300, 6400)
	r_numbery = randf_range(-3500,3500)
	random_spawn(beetle)


func restart_game():
	Engine.time_scale = 0.2
	restart_timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	
