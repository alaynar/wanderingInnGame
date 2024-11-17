extends TileMapLayer
signal dragon
signal exitCave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Player got too close to the dragon - we should start next dialogue
func _on_dragon_line_body_entered(body: Node2D) -> void:
	dragon.emit()
	pass # Replace with function body.

#Player got to the exit - exit
func _on_edge_of_cave_body_entered(body: Node2D) -> void:
	exitCave.emit()
	pass # Replace with function body.
