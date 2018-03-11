extends Node2D


func _ready():
	randomize()
	$Label.text = str(global.score)
	var r = randi()%20
	
	if(r < 3):
		$Sprite.frame = 2
	elif(r < 10):
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
	
	$audio.play(18.0)
	pass

func _process(delta):
	if(Input.is_action_pressed("ui_select")):
		playAgain()
	pass
func playAgain():
	get_tree().change_scene("res://scene/Staring.tscn")
	print("hi")
	pass
	