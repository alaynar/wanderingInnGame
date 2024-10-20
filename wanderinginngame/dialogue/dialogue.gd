extends CanvasLayer
signal next_message
signal status
var dialogueState
var stillSpeaking = false
var currScriptVar
var sizeX #size of the number of lines
var sizeY #size of columns (1 is char, 2 is text, 3 is char image)
var currX #Current x
#var currY #current y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Message.hide()
	$Character.hide()
	$ErinDialogue.hide()
	dialogueState = 'playable'
	
	currX = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	if (stillSpeaking):
		if currX == sizeX:
			currX = 0
			#Done with dialogue
			stillSpeaking = false
			dialogueState = "playable"
			$Character.hide()
			$Message.hide()
			$ErinDialogue.hide()
			status.emit(dialogueState)
		elif currX < sizeX:
			char_name(currScriptVar[currX][0])
			show_message(currScriptVar[currX][1])
			char_image(currScriptVar[currX][2])
			#char_image = scriptVar[currX][2]
			stillSpeaking = false
			currX += 1
		
	if Input.is_action_just_released("continue") && dialogueState == 'nonplayable':
		stillSpeaking = true
		
	pass

func _start_dialogue() -> void:
	dialogueState = "nonplayable"
	print("Dialogue State: ", dialogueState)
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

func char_image(characterImage):
	if characterImage == 'erin':
		$ErinDialogue.show()
	pass
	
func dim_background(status):
	if status:
		$CanvasModulate.show()
	else:
		$CanvasModulate.hide()
	pass


func _on_scripts_passing_script_ref(scriptVar,x) -> void:
#func _on_scripts_passing_script_ref(scriptVar,x,y) -> void:
	_start_dialogue()
	stillSpeaking = true
	currScriptVar = scriptVar
	sizeX = x
	#currY = y
	pass # Replace with function body.
