extends Control  # Attach to your root Control node

@onready var currency_label: Label = $CurrencyLabel
@onready var score_btn: Button = $VBoxContainer/HBoxContainer1/Button
@onready var ball_btn: Button = $VBoxContainer/HBoxContainer2/Button  
@onready var flick_btn: Button = $VBoxContainer/HBoxContainer3/Button

var points: int = 0:
	set(value):
		points = value
		currency_label.text = "Points: " + str(points)

# Global game effects (singleton or autoload recommended)
var game_effects = {
	"damage_mult": 1.0,
	"income_mult": 1.0,
	"speed_mult": 1.0
}

# Your 3 upgrade paths as data
var paths = {
	"score": [
		{"name": "Damage I", "cost": 10, "effect": {"damage_mult": 1.5}},
		{"name": "Damage II", "cost": 25, "effect": {"damage_mult": 2.0}},
		{"name": "Damage MAX", "cost": 50, "effect": {"damage_mult": 3.0}}
	],
	"ball": [
		{"name": "Income I", "cost": 15, "effect": {"income_mult": 1.3}},
		{"name": "Income II", "cost": 35, "effect": {"income_mult": 1.8}}
	],
	"flick": [
		{"name": "Speed I", "cost": 12, "effect": {"speed_mult": 1.2}}
	]
}

var path_indices = {"score": 0, "ball": 0, "flick": 0}

func _ready():
	score_btn.pressed.connect(_buy_score)
	ball_btn.pressed.connect(_buy_ball)
	flick_btn.pressed.connect(_buy_flick)
	update_slots()

func update_slots():
	update_slot(score_btn, "score")
	update_slot(ball_btn, "ball")
	update_slot(flick_btn, "flick")

func update_slot(btn: Button, path: String):
	var idx = path_indices[path]
	if idx >= paths[path].size():
		btn.disabled = true
		btn.text = paths[path].back()["name"] + "\n[MAXED]"
		return
	
	var upgrade = paths[path][idx]
	btn.disabled = points < upgrade.cost
	btn.text = "%s\nCost: %d" % [upgrade.name, upgrade.cost]

func _buy_score(): buy_upgrade("score")
func _buy_ball(): buy_upgrade("ball")  
func _buy_flick(): buy_upgrade("flick")

func buy_upgrade(path: String):
	var idx = path_indices[path]
	if idx >= paths[path].size() or points < paths[path][idx].cost:
		return
	
	var upgrade = paths[path][idx]
	points -= upgrade.cost
	#apply_effect(upgrade.effect)
	path_indices[path] += 1
	update_slots()
