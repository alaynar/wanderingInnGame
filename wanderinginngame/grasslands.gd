extends TileMapLayer

var inDoorWay 
signal enterWanderingInn

func _ready() -> void:
	$TheInn/innImage.hide()
	$Rain.stop()
	pass
	
func _process(delta: float) -> void:
	
	#We've tried to enter the Inn
	if inDoorWay == true && Input.is_action_pressed("interact"):
		inDoorWay = false
		enterWanderingInn.emit()
		$TheInn/innImage.show()
		$Rain.play()
	
	pass

func _on_door_way_body_entered(body: Node2D) -> void:
	inDoorWay = true
	$ShowInteractButton.text = "Open Door (e)"
	$ShowInteractButton.show()
	pass # Replace with function body.



func _on_door_way_body_exited(body: Node2D) -> void:
	inDoorWay = false
	$ShowInteractButton.hide()
	pass # Replace with function body.
