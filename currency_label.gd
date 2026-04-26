extends Label

@onready var score_label: Label = $/root/Node2D/scoreLabel/CurrencyLabel

func _ready():
	ScoreManager.score_changed.connect(_on_score_changed)
	_on_score_changed(ScoreManager.gScore)

func _on_score_changed(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
	
