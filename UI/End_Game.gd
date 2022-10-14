extends Control

var timer = 0.0;
var call = 0;



func _ready():
	$SE_explosion.play()
	
func _physics_process(delta):
	if call != 3:
		timer += (1.0 * delta)
	if (timer >= 0.5 and call == 0):
		$SE_game.play()
		call = 1;
	if (timer >= 2.0 and call == 1):
		$SE_gameover.play()
		call = 2;
	if (timer >= 4.0 and call == 2):
		$SE_tryagain.play()
		$Label.visible = true
		$Restart.visible = true
		$Quit.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		call = 3
		
		
	
	


func _on_Restart_pressed():
	get_tree().paused = false
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
