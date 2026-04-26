extends Control

func resume():
	get_tree().paused = false
	hide()
	$AnimationPlayer.play_backwards("blur_anim")
func pause():
	get_tree().paused = true
	show()
	$AnimationPlayer.play("blur_anim")
#func testEsc():
#	if Input.is_action_pressed("escape") and get_tree().paused == false:
#		pause()
#		print("paused")
#	elif Input.is_action_pressed("escape") and get_tree().paused == true:
#		resume()
#		print("unpaused")

func _input(event):
	if event.is_action_pressed("escape"):  # "escape" action must exist in Project Settings > Input Map
		if get_tree().paused:
			resume()
		else:
			pause()
		get_viewport().set_input_as_handled()
		print("ESC pressed")  

func _input_test(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		print("esc pressed")

func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	get_tree().paused = false 
	get_tree().reload_current_scene()
	ScoreManager.gScore = 0
	


func _on_quit_pressed() -> void:
	get_tree().quit()
