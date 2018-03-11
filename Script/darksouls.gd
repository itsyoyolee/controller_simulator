extends Node2D

var gameMode=[5,6,7,8]
var endPoint=50.0
var anim="darksouls"
func _ready():
	pass

func Update():
	endPoint=endPoint*0.9
