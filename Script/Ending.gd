extends Node2D


func _ready():
	get_node("Score").text = str(global.score)
	pass

func _process(delta):

	pass
