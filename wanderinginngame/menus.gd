extends CanvasLayer

#Signals
signal newGameStart
signal saveGame
signal loadGame
signal credits
signal gamePaused

##################### MAIN MENU #######################
func show_main_menu():
	$WanderingInnImage.show()
	$WanderingInnImage/Author.text = "[center]Created by:\nAlayna Montoya[/center]"
	$WanderingInnImage/Title.text = "[center]Wandering Inn:\nThe Game[/center]"
	hide_pause_menu()
	$CanvasLayer/PauseButton.hide()
	gamePaused.emit("nonplayable")
	pass
	

func hide_main_menu():
	$WanderingInnImage.hide()
	$CanvasLayer/PauseButton.show()
	gamePaused.emit("playable")
	pass

#################### PAUSE MENU #######################

func show_pause_menu():
	$PauseMenu.show()
	$PauseMenu/Pause.text = "[center]Game Paused[/center]"
	hide_main_menu()
	gamePaused.emit("nonplayable")
	pass

func hide_pause_menu():
	$PauseMenu.hide()
	gamePaused.emit("playable")
	pass

################### Button Pressed ####################

func _on_new_game_button_pressed() -> void:
	hide_main_menu()
	newGameStart.emit()
	pass # Replace with function body.


func _on_load_game_button_pressed() -> void:
	pass # Replace with function body.


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.

func _on_save_game_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	hide_pause_menu()
	show_main_menu()
	pass # Replace with function body.

func _on_pause_button_pressed() -> void:
	
	if $PauseMenu.visible:
		hide_pause_menu()
	else:
		show_pause_menu()
	pass # Replace with function body.
