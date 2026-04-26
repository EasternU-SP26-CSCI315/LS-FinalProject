extends Node
var gScore: int = 0
signal score_changed(new_score)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add_score(amount: int) -> void:
	ScoreManager.gScore += amount
	score_changed.emit(ScoreManager.gScore)

func reset_score() -> void:
	ScoreManager.gScore = 0
