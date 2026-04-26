extends Marker2D

@export var ball_scene: PackedScene  # Drag Ball.tscn here
@export var spawn_input: String = "spawn_ball"  # Map in Project Settings (e.g., Space)
@onready var spawn_timer: Timer = $Timer

#@export var ball_types := [
#	{"scene": preload("res://ball.tscn"), "weight": 70},
#	{"scene": preload("res://ball5.tscn"), "weight": 20},
#	{"scene": preload("res://ball_10.tscn"), "weight": 10}
#]

@export var ball_types: Array[Dictionary] = []

func _on_timer_timeout() -> void:
	print("hello")
	pass # Replace with function body.

func spawn_ball():
	#var ball = ball_scene.instantiate()
	var total_weight = 0
	for balls in ball_types:
		total_weight += balls["weight"]
	
	var roll = randi() % total_weight
	var current = 0
	
	for balls in ball_types:
		current += balls["weight"]
		if roll < current:
			var instance = balls["scene"].instantiate()
			instance.global_position = $Marker2D.global_position
			get_tree().current_scene.add_child(instance)
			break
	
	
	
#	ball.global_position = global_position
#	ball.linear_velocity = Vector2.ZERO  # Or slight upward nudge
#	get_tree().current_scene.add_child(ball)  # Adds to root/table
	
	
	
