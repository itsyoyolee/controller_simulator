extends Node2D

var isShake=false #判斷是否要震動
var jitterTime	#存取震動的時間
var originPos	#存取震動前的位置

func _ready():
	pass

func _process(delta):
	if(isShake):
		Jitter()
	pass

#當main scene呼叫這個函式 將shake的資訊初始化
func Shake(var time):
	isShake=true
	jitterTime=time
	originPos=$RigidBody2D.position
	pass
	
#當isShake==true 就震動
func Jitter():
	jitterTime-=get_process_delta_time()
	$RigidBody2D.position=originPos+Vector2(rand_range(1,5),rand_range(1,5))
	#如果震動時間小於零 就結束震動
	if(jitterTime<=0):
		$RigidBody2D.position=originPos
		isShake=false
	pass
	
	
