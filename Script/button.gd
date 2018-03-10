extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var buttonType = "int"
var timer = 0
var enable = true
var dir = "" #L R U D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	pressDetect()
	#是否被人類按下去 開始計時&特效
	if(enable):
		timer += 1
		$Sprite.offset.y = 10
		$anim.scale *= Vector2(1.1, 1.1)
		$anim.modulate.a *=0.85
	else:
		$Sprite.offset.y = 0
		timer = 0
		$anim.scale = Vector2(1, 1)
		$anim.modulate.a = 1
	pass

func pressDetect(): #是否被小精靈推回去
	if(buttonType == "normal"):
		if($area.overlaps_body(get_node("../player/body"))):
			if(Input.is_action_pressed("ui_select")):
				enable = false
	elif(buttonType == "mushroom"):
		if($area.overlaps_body(get_node("../player/body"))):
			if(get_node("../player").catch(dir)):
				enable = false
	pass

func EnableButton(): #被人類按下按鍵
	enable = true
	pass
