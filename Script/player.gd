extends Node2D
const SPEED=200.0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	Move()
	pass

func Move():
	if(Input.is_action_pressed("ui_left")):
		$body.move_and_slide(Vector2(-1,0)*SPEED)
	elif(Input.is_action_pressed("ui_right")):
		$body.move_and_slide(Vector2(1,0)*SPEED)
	elif(Input.is_action_pressed("ui_up")):
		$body.move_and_slide(Vector2(0,-1)*SPEED)
	elif(Input.is_action_pressed("ui_down")):
		$body.move_and_slide(Vector2(0,1)*SPEED)
	pass
	
#得到 蘑菇頭的方向 並判斷使用者的輸入 並回傳結果
func Catch(var dir):
	if(Input.is_action_pressed("ui_select")):
		if(Input.is_action_pressed(dir)):
			return true
		else:
			return false	
	pass