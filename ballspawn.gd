extends Marker2D

@export var ball_types := [
	{"scene": preload("res://ball.tscn"), "weight": 70},
	{"scene": preload("res://ball5.tscn"), "weight": 20},
	{"scene": preload("res://ball_10.tscn"), "weight": 10}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timer_timeout() -> void:
	#print("hello")
	var total_weight = 0
	for balls in ball_types:
		total_weight += balls["weight"]
	
	var roll = randi() % total_weight
	var current = 0
	
	for balls in ball_types:
		current += balls["weight"]
		if roll < current:
			var instance = balls["scene"].instantiate()
			instance.global_position = global_position

			get_tree().current_scene.add_child(instance)
			break
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
