extends Area2D

var player: CharacterBody2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.add_health()
		#removes scene from Main
		queue_free()
