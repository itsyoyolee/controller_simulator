extends Node2D

var gameList
var playingGame
var preGame
func _ready():
	for index in get_child_count() :
		gameList.append(Game())
	playingGame=gameList[rand_range(0,gameList.size)]
	preGame=playingGame
	pass


func ChooseGame(var isSuccessful):
	if(isSuccessful):
		playingGame.Update()
	preGame=playingGame
	playingGame = gameList[rand_range(0,gameList.size)]
	while preGame==playingGame:
		playingGame = gameList[rand_range(0,gameList.size)]
	return playingGame
	pass
