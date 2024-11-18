extends Resource
class_name gameData

@export var playPosX : float
@export var playPosY : float

@export var location : String
@export var sceneNum : int

func change_player_pos(x : int, y : int):
	playPosX = x
	playPosY = y
	print("player pos: ", playPosX, " ", playPosY)
	pass
	
func change_location(locale : String):
	location = locale
	print("location ", location)
	pass

func change_scene(newScene : int):
	sceneNum = newScene
	print("sceneNum: ", sceneNum)
	pass
