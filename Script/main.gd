extends Node2D
var INPUT_OFFSET = 3		#下次點擊的時間間隔
var input_pass = 0			#上次點擊後經過時間
var button_list = []		#button列表
var controller 				#場景ref
var playing_game			#正在遊玩的遊戲
var controller_health = 100	#玩家總血量
var REACT_TIME = 1			#單一按鍵失敗時間判定
var fail_time				#反應總時間
var score = 0				#分數(存活時間相關)
var Button_Num = 10			#按鍵總數
var survive_time 			#存活時間
var music
var v = 1

func _ready():
	playing_game = get_node("Game").ChooseGame(false)
	playing_game.get_node("../Anim").play(playing_game.anim)
	Init_Btn()
	fail_time = playing_game.endPoint
	survive_time = playing_game.endPoint*0.7
	$Anim.play("handMove")
	randomize()
	if(randi()%2):
		music = load("res://sound/Opus_One.ogg")
		print("load m1")
	else:
		music = load("res://sound/The_Angels_Weep.ogg")
		print("load m2")
	playMusic()
	pass

func _process(delta):
	
	if (controller_health >= 0):
		score+=delta
		if (survive_time >= 0):# 計算存活
			survive_time -= delta
		else:# COMPLETE !
			playing_game = get_node("Game").ChooseGame(true)
			get_node("HUD2").play("NB")
			playing_game.get_node("../Anim").play(playing_game.anim)
			fail_time = playing_game.endPoint
			survive_time = fail_time*0.7
		if (fail_time >= 0):# 按鍵設定及判定
			#決定隨機點擊
			Btn_Decide(delta)
			#如果按鈕沒點擊count fail_time
			Btn_Update(delta)
		else:# GAME CHANGE!
			controller_health -= 50
			v+=1
			print(v)
			if v < 4: get_node("Controller").get_node("preview").texture = load("res://Img/background_final2-"+str(v)+".png")
			get_node("HUD").play("Shake")
			get_node("HUD2").play("CNS")
			playing_game = get_node("Game").ChooseGame(false)
			$Anim.play("handBreak")
			fail_time = playing_game.endPoint
			playing_game.get_node("../Anim").play(playing_game.anim)
			survive_time = fail_time*0.7
	else:
		Game_Over()
	pass
	
func Btn_Decide(delta):
	if (input_pass <=0):
		randomize()
		var input_btn = playing_game.gameMode[randi()%playing_game.gameMode.size()]#抓kind
		
		if !(button_list[input_btn].enable):
			if(button_list[input_btn].buttonType == "mushroom"):
				randomize()
				button_list[input_btn].EnableButton(randi()%4)
			else:
				button_list[input_btn].EnableButton(0)
			input_pass = INPUT_OFFSET - ((randi()%29)/10)
	else: input_pass -= delta
	pass

func Btn_Update(delta):
	for index in button_list.size():
		if (button_list[index].enable == true):
			if (button_list[index].timer - REACT_TIME > 0):
				fail_time -= delta
	pass

func Game_Over():
	if v <= 4:
		v+=1
		get_node("HUD").play("Shake")
		$Anim.play("handBreak")
		global.score = score
	pass

func Init_Btn():
	for index in Button_Num:
		button_list.append(get_node("Controller").get_node(str(index)))
	pass
	
func playMusic():
	$audio.stream = music
	$audio.playing = true
	pass


func _on_HUD_animation_finished(anim_name):
	if(anim_name == "Shake") and v >= 4:
		var world = load("res://scene/Ending.tscn").instance()
		get_tree().get_root().add_child(world)
		if(get_tree().get_root().get_node("main")):get_tree().get_root().get_node("main").queue_free()
	pass # replace with function body
