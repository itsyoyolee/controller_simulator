extends Node2D

var gameMode=[1,2,3,4,6,7,8,9]
var endPoint=50.0
var anim="mario"
func _ready():
	pass

func Update():
	endPoint=endPoint*0.9
