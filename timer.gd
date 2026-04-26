extends Timer

@export var ball_scene: PackedScene
@onready var spawn_timer: Timer = $Timer



#func spawn_ball():
#	if ball_scene:
#		var ball = ball_scene.instantiate() as RigidBody2D
#		ball.global_position = global_position
#		ball.linear_velocity = Vector2.ZERO
#		get_tree().current_scene.add_child(ball)
#		ball.add_to_group("balls")
