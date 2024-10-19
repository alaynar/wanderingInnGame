extends Node
#GameState should be 'playable' or 'nonplayable'#
#@export var gameState = 'playable'
signal gameStatus

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#gameState = "playable"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goblin_interact_avail(characterName, text) -> void:
	#THIS IS WHERE WE'D CHAT WITH THE CHARACTER
	$dialogue._start_dialogue()
	$dialogue.dim_background(true)
	$dialogue.char_name(characterName)
	$dialogue.show_message(text)
	
	pass # Replace with function body.

#func _get_gameState():
#	return gameState
#	pass


func _on_dialogue_status(gameState) -> void:
	gameStatus.emit(gameState)
	pass # Replace with function body.
