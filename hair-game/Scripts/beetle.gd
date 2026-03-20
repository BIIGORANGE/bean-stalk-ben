extends CharacterBody2D

const SPEED = 50
var health = 2


var player
var beetle: CharacterBody2D = self
var game_manager: Node

@onready var move_timer: Timer = $MoveTimer
@onready var drop_timer: Timer = $DropTimer
@onready var shoot_timer: Timer = $ShootTimer


@onready var health_pickup = preload("res://Scenes/health.tscn")
var move_direction: Vector2 = Vector2(0,0)
var enemy_bullet = preload("res://Scenes/enemy_bullet.tscn")



#Runs once at game start
func _ready() -> void:
	randomize() 
	timers_start()
	
func _on_shoot_timer_timeout() -> void:
	var spawn_pos = self.global_position
	var player_pos = player.global_position
	var fire_direction = (player_pos - spawn_pos).normalized()
	var instance = enemy_bullet.instantiate()
	add_child(instance)
	instance.global_position = spawn_pos
	instance.velocity = fire_direction * instance.speed
	
func timers_start():
	if beetle: #characterbody exists
		move_timer.start()
		shoot_timer.start()
		
func _on_move_timer_timeout() -> void:
	move_timer.start()

func move(delta):
	#PICK A DIRECTION BASED ON VECTOR2 POINT
	move_direction = global_position.direction_to(Vector2(player.global_position))
	#MOVE TOWARDS POINT
	velocity = move_direction * SPEED

func die():
	if game_manager:
		game_manager.drop_health_pickup(global_position)
	queue_free()

func subtract_health():
	health -= 1

func _process(delta: float) -> void:
	if health == 0:
		die()
	move(delta)
	move_and_slide()
