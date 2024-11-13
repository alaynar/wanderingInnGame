extends Node
#GameState should be 'playable' or 'nonplayable'#
#@export var gameState = 'playable'
signal gameStatus
var sceneNum
signal talking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#gameState = "playable"
	sceneNum = 0
	new_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dialogue_status(gameState) -> void:
	gameStatus.emit(gameState)
	#print("Game state is: ", gameState)
	pass # Replace with function body.

func _on_goblin_interact_avail() -> void:
	talking.emit(sceneNum)
	pass # Replace with function body.

func _on_scripts_scene_change(nextSceneNum) -> void:
	sceneNum = nextSceneNum
	pass # Replace with function body.

func new_game():
	$GrassLands.hide()
	$Caves.show()
	pass
