extends Button
@onready var enuff_monee = $/root/Node2D/upgrade
#@onready var upButton: Button = $/root/Node2d/upgrade/VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enuff_monee.disabled = ScoreManager.gScore < 100
