extends Area2D

var speed = 1000
var velocity = Vector2.ZERO
@onready var health_pickup = "res://Scenes/health.tscn"
func _process(delta: float) -> void:
	rotation = velocity.angle()
	position += velocity * delta


func _on_area_entered(area: Area2D) -> void:
	if !health_pickup:
		queue_free()
