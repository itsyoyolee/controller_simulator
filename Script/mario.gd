extends Node2D

var gameMode=[1,2,3,4,8,9]
var endPoint=100.0
var anim="mario"
func _ready():
	pass

func Update():
	endPoint=endPoint*0.9
