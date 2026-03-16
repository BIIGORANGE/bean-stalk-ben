extends Node

@onready var restart_timer: Timer = $RestartTimer
@onready var spawn_timer: Timer = $SpawnTimer

@onready var fly = preload("res://Scenes/fly.tscn")

func spawn_fly():
	var instance = fly.instantiate()
	add_child(instance)
	
func start_spawn():
	spawn_timer.start()
	
func _on_spawn_timer_timeout() -> void:
	spawn_fly()
	
func restart_game():
	Engine.time_scale = 0.2
	restart_timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	
#runs once at game start
func _ready():
	start_spawn()
