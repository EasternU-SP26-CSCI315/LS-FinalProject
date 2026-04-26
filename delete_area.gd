extends Area2D

func _ready():
	# Connect body_entered signal
	body_entered.connect(_on_body_entered)
	# Enable monitoring (required for detection)
	monitoring = true

func _on_body_entered(body: Node2D):
	if body is RigidBody2D:  # Only RigidBody2D balls
		#print("Ball drained: ", body.name)
		body.queue_free()  # Delete instantly
