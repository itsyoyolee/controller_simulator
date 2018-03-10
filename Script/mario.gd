extends Node2D

var gameMode
var endPoint

func _ready():
	gameMode=[1,2,3,4]
	endPoint=50.0
	pass

func Update():
	endPoint=endPoint*0.9
