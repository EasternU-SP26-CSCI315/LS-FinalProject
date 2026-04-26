extends RigidBody2D

@export var input_action := "flipper_right"
@export var rest_angle_deg := -20.0
@export var flipped_angle_deg := 45.0
@export var flip_speed := 800.0

var target_angle_deg := 0.0

func _ready() -> void:
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	freeze = true
	rotation_degrees = rest_angle_deg
	target_angle_deg = rest_angle_deg

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(input_action):
		target_angle_deg = flipped_angle_deg
		#print("r flick!")

	else:
		target_angle_deg = rest_angle_deg

	var diff := target_angle_deg - rotation_degrees
	var max_step := flip_speed * delta
	rotation_degrees += clamp(diff, -max_step, max_step)              
