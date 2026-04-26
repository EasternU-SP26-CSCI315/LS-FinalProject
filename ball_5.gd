extends RigidBody2D

@export var bounce_min := 0.8
@export var bounce_max := 1.5
@export var bounce_cooldown := 0.01

var can_bounce := true
var cooldown_timer := 0.0

func _ready() -> void:
	randomize()
	contact_monitor = true
	max_contacts_reported = 4

func _physics_process(delta: float) -> void:
	if not can_bounce:
		cooldown_timer -= delta
		if cooldown_timer <= 0.0:
			can_bounce = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if not can_bounce:
		return

	if state.get_contact_count() > 0:
		var normal := state.get_contact_local_normal(0)
		var bounce_strength := randf_range(bounce_min, bounce_max)
		linear_velocity = linear_velocity.bounce(normal) * bounce_strength
		can_bounce = false
		cooldown_timer = bounce_cooldown
