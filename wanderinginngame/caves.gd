extends TileMapLayer
signal dragon
signal exitCave
signal deathFlag
var stillInCave = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/dragonTimer.hide()
	$EscDragon.stop()
	$CanvasLayer/black.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if !$EscDragon.is_stopped():
		$CanvasLayer/dragonTimer.show()
		stillInCave = true
	elif $EscDragon.is_stopped() && stillInCave:
		$CanvasLayer/dragonTimer.hide()
		stillInCave = false
		$EscDragon.stop()
		deathFlag.emit()
	
	if stillInCave:
		#$CanvasLayer/Timetoescape.text("")
		$CanvasLayer/dragonTimer.set_text("Time to escape:\n" + str(int(str($EscDragon.get_time_left()))))
	else:
		stillInCave = false
		$EscDragon.stop()
		$CanvasLayer/dragonTimer.hide()
	pass

#Player got too close to the dragon - we should start next dialogue
func _on_dragon_line_body_entered(body: Node2D) -> void:
	dragon.emit()
	pass # Replace with function body.

#Player got to the exit - exit
func _on_edge_of_cave_body_entered(body: Node2D) -> void:
	exitCave.emit()
	pass # Replace with function body.

func _not_in_Cave() -> void:
	stillInCave = false
	$EscDragon.stop()
	pass
