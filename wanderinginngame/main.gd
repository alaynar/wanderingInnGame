extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goblin_interact_avail(characterName, text) -> void:
	#THIS IS WHERE WE'D CHAT WITH THE CHARACTER
	print("Well hi there")
	$dialogue.char_name(characterName)
	$dialogue.show_message(text)
	
	pass # Replace with function body.
