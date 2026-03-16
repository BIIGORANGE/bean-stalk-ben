extends CharacterBody2D

const SPEED = 50
const HEALTH = 1

@onready var fly: CharacterBody2D = $"."
@onready var timer: Timer = $Timer

#@onready var ray_cast_right: RayCast2D = $RayCastRight
#@onready var ray_cast_left: RayCast2D = $RayCastLeft
#@onready var ray_cast_down: RayCast2D = $RayCastDown
#@onready var ray_cast_up: RayCast2D = $RayCastUp
#@onready var ray_cast_up_right: RayCast2D = $RayCastUpRight
#@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight
#@onready var ray_cast_up_left: RayCast2D = $RayCastUpLeft
#@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft

var r_numberx = randf_range(-550, 925)
var r_numbery = randi_range(-330,320)
var direction: Vector2 = Vector2(0,0)

#Runs once at game start
func _ready() -> void:
	randomize() 
	timer_start()

func timer_start():
	if fly: #characterbody exists
		timer.start()
		
func _on_timer_timeout() -> void:
	timer.start()
	r_numberx = randf_range(-550, 925)
	r_numbery = randi_range(-330,320)

func move(delta):
	#PICK A DIRECTION BASED ON VECTOR2 POINT
	direction = global_position.direction_to(Vector2(r_numberx, r_numbery))
	#MOVE TOWARDS POINT
	velocity = direction * SPEED
	

func _process(delta: float) -> void:
	move(delta)
	move_and_slide()
