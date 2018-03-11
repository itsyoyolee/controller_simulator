extends Node2D

var gameList = []
var playingGame = "NULL"
var preGame = "NULL"

func _ready():
	randomize()
	#add all game int scene to gameList
	for index in (get_child_count()-1) :
		gameList.append(get_node("Game"+str(index)))
	playingGame=gameList[randi()%gameList.size()]
	preGame=playingGame
	pass


func ChooseGame(var isSuccessful):
	randomize()
	if(isSuccessful):
		playingGame.Update()
	preGame = playingGame
	playingGame = gameList[randi()%gameList.size()]
	while preGame == playingGame:
		playingGame = gameList[randi()%gameList.size()]
	return playingGame
	pass
