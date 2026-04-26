extends Button


@export var flick_interval: float = 3.0  # Flick every 0.3s
@export var flip_speed: float = 900.0  # Flick strength
@onready var fTimer = $Timer




var flick_timer: Timer
var auto_mode: bool = false

func _ready():
	
	
	pressed.connect(_toggle_auto)
	

func _toggle_auto():
	auto_mode = !auto_mode
	if auto_mode:
		text = "Auto ON"
		fTimer.start()
	else:
		text = "Auto OFF"
		fTimer.stop()
		Input.action_release("flipper_left")  # Force release
		Input.action_release("flipper_right")

func _on_timer_timeout() -> void:
	if not auto_mode: return
	#print("flicking")
	Input.action_press("flipper_left")
	Input.action_press("flipper_right")
	
	get_tree().create_timer(0.1).timeout.connect(func():
		Input.action_release("flipper_left")
		Input.action_release("flipper_right")
	)
	#Input.action_release("flipper_left")
	#Input.action_release("flipper_right")
	
