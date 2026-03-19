extends Area2D

@onready var player: CharacterBody2D = %Player


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.add_health()
		#removes scene from Main
		queue_free()
