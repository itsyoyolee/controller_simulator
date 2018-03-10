extends Node2D

var dir
var isShake=false
var jitterTime
var originPos

func _ready():
	pass

func _process(delta):
	if(isShake):
		Jitter()
	pass

func Shake(var time):
	isShake=true
	jitterTime=time
	originPos=$".".global_position
	pass
	
func Jitter():
	jitterTime-=get_process_delta_time()
	global_position=originPos+Vector2(rand_range(1,5),rand_range(1,5))
	if(jitterTime<=0):
		global_position=originPos
		isShake=false
	pass
	
