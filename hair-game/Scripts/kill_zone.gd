extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.subtract_health()
		
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_bullet"):
		print("hit")
		get_parent().subtract_health()
