extends Node2D

var Ball = null

func _ready():
	Ball = load("res://Ball/Ball.tscn")
	make_ball()

func _physics_process(_delta):
	if get_child_count() == 0:
		var death_audio = get_node_or_null("/root/Game/SE_ooum")
		if death_audio != null:
			death_audio.play()
		Global.update_lives(-1)
		Global.update_fever(-Global.fever)
		var camera = get_node_or_null("/root/Game/Camera")
		if camera != null:
			camera.add_trauma(3.0)
		make_ball()

func make_ball():
	var ball = Ball.instance()
	ball.global_position = Vector2(Global.VP.x/2, Global.VP.y - 110)
	var direction = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball.initial_velocity = direction
	ball.released = false
	add_child(ball)
	

func make_ball_fever():
	var ball = Ball.instance()
	ball.global_position = Vector2(randf() * (Global.VP.x - 50) + 50, Global.VP.y - 110)
	var direction = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball.apply_central_impulse(direction)
	add_child(ball)
