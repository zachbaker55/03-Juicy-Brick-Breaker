extends Control


func play_sound(random_sound):
	if (random_sound == 0):
		$SE_Container/se_coolbeans.play()
	elif (random_sound == 1):
		$SE_Container/se_dang.play()
	elif (random_sound == 2):
		$SE_Container/se_nice.play()
	elif (random_sound == 3):
		$SE_Container/se_incredible.play()
	elif (random_sound == 4):
		$SE_Container/se_exuberant.play()
	elif (random_sound == 5):
		$SE_Container/se_ohmy.play()
	elif (random_sound == 6):
		$SE_Container/se_wow.play()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	


func _on_Restart_pressed():
	get_tree().paused = false
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Timer_timeout():
	randomize()
	play_sound(randi() % 7)
