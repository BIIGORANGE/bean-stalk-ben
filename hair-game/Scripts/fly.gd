extends CharacterBody2D

const SPEED = 600
var health = 1

var player
@onready var fly: CharacterBody2D = $"."
@onready var move_timer: Timer = $MoveTimer
@onready var drop_timer: Timer = $DropTimer
var game_manager: Node
@onready var health_pickup = preload("res://Scenes/health.tscn")
var r_numberx = randi_range(-550, 925)
var r_numbery = randi_range(-330,320)
var direction: Vector2 = Vector2(0,0)

#Runs once at game start
func _ready() -> void:
	randomize() 
	move_timer_start()

func move_timer_start():
	if fly: #characterbody exists
		move_timer.start()
		
func _on_move_timer_timeout() -> void:
	move_timer.start()
	r_numberx = randi_range(-550, 925)
	r_numbery = randi_range(-330,320)

func move(delta):
	#PICK A DIRECTION BASED ON VECTOR2 POINT
	direction = global_position.direction_to(Vector2(r_numberx, r_numbery))
	#MOVE TOWARDS POINT
	velocity = direction * SPEED

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
