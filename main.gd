extends Spatial

var score = 0

var started = false
var game_already_over = false

func _process(delta):
	$TimerLabel.text = "Time: " + str(stepify($Timer.time_left, 0.01))
	$Arnold.rect_rotation = sin($Timer.time_left * PI * 166 / 60) * 10


func _physics_process(delta):
	if $ClickableCookie.translation.y < -1:
		game_over()


func game_over():
	if game_already_over:
		return
	game_already_over = true
	$GameOverLabel.show()
	$RetryButton.show()
	$Timer.paused = true
	$ClickableCookie.hide()
	$AudioStreamPlayer.playing = false
#	$AudioStreamPlayer.seek(69.2)


func start():
	started = true
	$Timer.start()
	$AudioStreamPlayer.play()

func _on_ClickableCookie_cookie_clicked():
	if not started:
		start()
	score += 1
	$ScoreLabel.text = "Score: " + str(score)

func _on_RetryButton_pressed():
	get_tree().reload_current_scene()

func _on_Timer_timeout():
	$ClickableCookie.translation.y = -100
