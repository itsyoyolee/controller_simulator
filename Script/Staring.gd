extends Node2D


func _ready():
	pass

func _process(delta):
	pass

func _on_TextureButton_pressed():
	var world = load("res://scene/main.tscn").instance()
	get_tree().get_root().add_child(world)
	if(get_tree().get_root().get_node("Starting")):get_tree().get_root().get_node("Starting").queue_free()
	pass 
