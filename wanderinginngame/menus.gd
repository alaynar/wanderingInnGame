extends CanvasLayer

#Signals
signal newGameStart
signal saveGame
signal loadGame
signal credits
signal gamePaused
signal quit

##################### MAIN MENU #######################
func show_main_menu():
	$WanderingInnImage.show()
	$WanderingInnImage/Author.text = "[center]Created by:\nAlayna Montoya[/center]"
	$WanderingInnImage/Title.text = "[center]Wandering Inn:\nThe Game[/center]"
	hide_pause_menu()
	hide_death_menu()
	hide_credits()
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
	hide_death_menu()
	hide_credits()
	gamePaused.emit("nonplayable")
	pass

func hide_pause_menu():
	$PauseMenu.hide()
	gamePaused.emit("playable")
	pass
	
####################  Credits  ########################

func show_credits():
	$CreditMenu.show()
	$CreditMenu/credits.text = "[center]Wandering Inn:\nThe Game[/center]"
	#gamePaused.emit("nonplayable")
	pass
	
func hide_credits():
	$CreditMenu.hide()
	#show_main_menu()
	#gamePaused.emit("playable")
	pass

####################  DEATH MENU  #####################

func show_death_menu():
	$DeathMenu.show()
	$DeathMenu/Dead.text = "[center]You Died..[/center]"
	hide_main_menu()
	hide_pause_menu()
	hide_credits()
	$CanvasLayer.hide()
	gamePaused.emit("nonplayable")
	pass

func hide_death_menu():
	$DeathMenu.hide()
	gamePaused.emit("playable")
	pass

################### Button Pressed ####################

func _on_new_game_button_pressed() -> void:
	hide_main_menu()
	hide_death_menu()
	hide_credits()
	newGameStart.emit()
	pass # Replace with function body.


func _on_load_game_button_pressed() -> void:
	loadGame.emit()
	hide_main_menu()
	hide_pause_menu()
	hide_death_menu()
	hide_credits()
	pass # Replace with function body.


func _on_credits_button_pressed() -> void:
	show_credits()
	hide_main_menu()
	hide_pause_menu()
	hide_death_menu()
	pass # Replace with function body.

func _on_save_game_button_pressed() -> void:
	saveGame.emit()
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	hide_pause_menu()
	show_main_menu()
	hide_death_menu()
	hide_credits()
	quit.emit()
	pass # Replace with function body.

func _on_pause_button_pressed() -> void:
	
	if $PauseMenu.visible:
		hide_pause_menu()
	else:
		show_pause_menu()
	pass # Replace with function body.

func _on_back_pressed() -> void:
	hide_credits()
	show_main_menu()
	pass # Replace with function body.
