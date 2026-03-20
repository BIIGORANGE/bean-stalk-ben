extends Area2D

var speed = 2000
var velocity = Vector2.ZERO
@onready var health_pickup = "res://Scenes/health.tscn"

func _process(delta: float) -> void:
	rotation = velocity.angle()
	position += velocity * delta
	
func subtract_health():
	if is_in_group("player"):
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	subtract_health()
		
