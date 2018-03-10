extends Node2D
var INPUT_OFFSET = 3		#下次點擊的時間間隔
var input_pass				#上次點擊後經過時間
var button_list = []		#button列表
var controller 				#場景ref
var game_list = []			#遊戲列表
var playing_game			#正在遊玩的遊戲
var controller_health = 100	#玩家總血量
var REACT_TIME = 5			#單一按鍵失敗時間判定
var fail_time 			#反應總時間
var score = 0				#分數(存活時間相關)

func _ready():
	Init_Btn()
	fail_time = playing_game.endPoint
	pass

func _process(delta):
	if (controller_health >= 0):
		if (fail_time >= 0):#按鍵設定及判定
			#決定隨機點擊
			Btn_Decide(delta)
			#如果按鈕沒點擊count fail_time
			Btn_Update(delta)
			pass
		else:
			Game_Change()
			fail_time = playing_game.endPoint
	else:
		Game_Over()
	pass
	
func Btn_Decide(delta):
	if (input_pass <=0):
		randomize()
		var input_btn = get_node("playing_game").btn_list[randi()%get_node("playing_game").btn_list.size()]#抓kind
		if ! button_list[input_btn].enable:
			button_list[input_btn].EnableButton()
			input_pass = INPUT_OFFSET - ((randi()%29)/10)
	else: input_pass -= delta
	pass
func Btn_Update(delta):
	for index in button_list:
		if button_list[index].enable == 1:
			fail_time -= delta
	pass
func Game_Change():

	pass
func Game_Over():
	pass
