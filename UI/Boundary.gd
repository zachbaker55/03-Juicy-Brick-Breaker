extends StaticBody2D

var Sound_Ball = null

func hit(ball):
	ball.max_speed *= 1.05
	ball.min_speed *= 1.05
	ball.max_speed = clamp(ball.max_speed, ball.max_speed, 1500)
	ball.min_speed = clamp(ball.min_speed, ball.min_speed, ball.max_speed)


func is_wall():
	pass
