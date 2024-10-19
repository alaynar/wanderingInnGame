extends CanvasLayer
signal next_message


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Message.hide()
	$Character.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	pass
	
func char_name(characterName):
	$Character.text = characterName
	$Character.show()
	pass
