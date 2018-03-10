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

func _ready():
	playing_game = get_node("Game").ChooseGame(false)
	Init_Btn()
	fail_time = playing_game.endPoint
	survive_time = playing_game.endPoint
	pass

func _process(delta):
	if (controller_health >= 0):
		if (survive_time >= 0):# 計算存活
			survive_time -= delta
		else:# COMPLETE !
			print("WIN!")
			playing_game = get_node("Game").ChooseGame(true)
			fail_time = playing_game.endPoint
		if (fail_time >= 0):# 按鍵設定及判定
			#決定隨機點擊
			Btn_Decide(delta)
			#如果按鈕沒點擊count fail_time
			Btn_Update(delta)
		else:# GAME CHANGE!
			print("CHANGE!")
			playing_game = get_node("Game").ChooseGame(false)
			fail_time = playing_game.endPoint
	else:
		Game_Over()
	pass
	
func Btn_Decide(delta):
	if (input_pass <=0):
		randomize()
		var input_btn = playing_game.gameMode[randi()%playing_game.gameMode.size()]#抓kind
		if (input_btn.enable): pass
		else:
			input_btn.EnableButton()
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
	print("OVER")
	pass

func Init_Btn():
	print("INIT")
	for index in Button_Num:
		button_list.append(get_node("button"+str(index)))
	pass
