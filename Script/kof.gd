extends Node2D

var gameMode=[1,2,3,4]
var endPoint=50.0
var anim="kof"
func _ready():
	pass

func Update():
	endPoint=endPoint*0.9
