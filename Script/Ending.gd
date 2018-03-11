extends Node2D


func _ready():
	$Label.text = str(global.score)
	$Sprite.frame=randi()%3
	pass

