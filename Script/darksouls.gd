extends Node2D

var gameMode
var endPoint

func _ready():
	gameMode=[5,6,7,8]
	endPoint=50.0
	pass

func Update():
	endPoint=endPoint*0.9
