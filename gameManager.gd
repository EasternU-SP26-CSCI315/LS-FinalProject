extends Node

var score: int = 0

signal score_changed(new_score: int)

func add_score(amount: int):
	score += amount
	score_changed.emit(score)
