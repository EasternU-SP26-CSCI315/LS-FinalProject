extends Area2D

@export var score_value: int = 1
@export var score_value5: int = 5
@export var score_value10: int = 10

@onready var score_label: Label = $/root/Node2D/scoreLabel/CurrencyLabel
@onready var upButton: Control = $/root/Node2D/upgrade

func _ready():
	body_entered.connect(_on_body_entered)
	upButton.pressed.connect(upgradeUpdate)

func _on_body_entered(body):
	print("Entered: ", body.name)
	print("Groups: ", body.get_groups())
	print("Current score before: ", ScoreManager.gScore)

	if body.is_in_group("ball"):
		ScoreManager.gScore += score_value
		print("Added score, new score: ", ScoreManager.gScore)
		score_label.text = "Score: " + str(ScoreManager.gScore)
	if body.is_in_group("balls5"):
		ScoreManager.gScore += score_value5
		print("Added score, new score: ", ScoreManager.gScore)
		score_label.text = "Score: " + str(ScoreManager.gScore)
	if body.is_in_group("balls10"):
		ScoreManager.gScore += score_value10
		print("Added score, new score: ", ScoreManager.gScore)
		score_label.text = "Score: " + str(ScoreManager.gScore)

func upgradeUpdate(): 
	score_value = score_value + 1
	score_value5 = score_value + 5
	score_value10 = score_value10 + 10
	#ScoreManager.gScore = ScoreManager.gScore - 100
	ScoreManager.add_score(-25)
