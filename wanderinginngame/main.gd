extends Node
#GameState should be 'playable' or 'nonplayable'#
#@export var gameState = 'playable'
signal gameStatus
var sceneNum
signal talking
signal choiceSelection
signal mainMenuStart

@onready var sceneTransition = $sceneTransition/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#gameState = "playable"
	sceneNum = 0
	
	#player settings:
	#$Camera2D.enabled = true
	mainMenuStart.emit()
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

#On new game, load this
func new_game():
	sceneTransition.play("fadeIn")
	$GrassLands.hide()
	$Caves.show()
	$erinSolstice.position.x = 640
	$erinSolstice.position.y = 278
	sceneTransition.play("fadeOut")
	await get_tree().create_timer(.8).timeout
	Global.location = "cave"
	#get_tree().change_scene_to_file("res://caves.tscn")
	sceneNum = 0
	talking.emit(sceneNum)
	pass

func _on_caves_dragon() -> void:
	#Need to give option buttons first!
	if Global.location == "cave":
		print("Hi")
		var choiceArray=["Panic","Don't Panic","Double check",1,2,3]
		choiceSelection.emit(3,choiceArray)
	pass # Replace with function body.

func _on_caves_exit_cave() -> void:
	if Global.location == "cave":
		if sceneNum >= 4:
			sceneTransition.play("fadeIn")
			await get_tree().create_timer(0.5).timeout
	
			$Caves.hide()
			$GrassLands.show()
			sceneTransition.get_parent().get_node("ColorRect").color.a = 255
			await get_tree().create_timer(0.2).timeout
			sceneTransition.play("fadeOut")
			Global.location = "grassland"
	#await get_tree().create_timer(0.5).timeout
	#get_tree().change_scene_to_file("res://grasslands.tscn")
	pass # Replace with function body.


func _on_dialogue_choice_selected() -> void:
	talking.emit(sceneNum)
	pass # Replace with function body.


func _on_menus_game_paused(gameState) -> void:
	gameStatus.emit(gameState)
	pass # Replace with function body.
