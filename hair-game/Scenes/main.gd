extends Node2D

@onready var round_timer: Timer = $RoundTimer
@onready var label: Label = $RoundTimer/Label
@onready var total_time_in_seconds:int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	round_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_round_timer_timeout() -> void:
	print(total_time_in_seconds)
	total_time_in_seconds += 1
	var minutes = int(total_time_in_seconds/60)
	var seconds = total_time_in_seconds - (minutes * 60)
	
	
	
	label.text = '%02d:%02d' % [minutes,seconds]
