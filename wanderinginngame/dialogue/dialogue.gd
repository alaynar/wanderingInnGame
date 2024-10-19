extends CanvasLayer
signal next_message
signal status
var dialogueState


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Message.hide()
	$Character.hide()
	dialogueState = 'playable'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("continue"):
		$Message.hide()
		$Character.hide()
		dialogueState = 'playable'
		status.emit(dialogueState)
	pass

func _start_dialogue() -> void:
	dialogueState = 'nonplayable'
	status.emit(dialogueState)
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	pass
	
func char_name(characterName):
	$Character.text = characterName
	$Character.show()
	pass

func dim_background(status):
	if status:
		$CanvasModulate.show()
	else:
		$CanvasModulate.hide()
	pass
