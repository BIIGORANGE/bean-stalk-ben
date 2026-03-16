extends Node

@onready var restart_timer: Timer = $RestartTimer
@onready var fly_spawn_timer: Timer = $FlySpawnTimer

@onready var fly = preload("res://Scenes/fly.tscn")
@onready var health_pickup = preload("res://Scenes/health.tscn")

var r_numberx = randf_range(-550, 925)
var r_numbery = randf_range(-320,300)
	
func _ready():
	start_spawn()
	randomize()

func start_spawn():
	fly_spawn_timer.start()

func spawn(entity):
	#if !player.position:
	var instance = entity.instantiate()
	add_sibling(instance)
	instance.position = Vector2(r_numberx,r_numbery)

func _on_fly_spawn_timer_timeout() -> void:
	r_numberx = randf_range(-600, 500)
	r_numbery = randf_range(-300,300)
	spawn(fly)


func restart_game():
	Engine.time_scale = 0.2
	restart_timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	
