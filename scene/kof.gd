extends Node2D

var gameMode=[0,1,2,3,4,5,6,7,8,9]
var endPoint=150.0
var anim="kof"
func _ready():
	pass

func Update():
	endPoint=endPoint*0.9