extends CanvasLayer
signal next_message
signal status
var dialogueState
var stillSpeaking = false
var currScriptVar
var sizeX #size of the number of lines
var sizeY #size of columns (1 is char, 2 is text, 3 is char image)
var currX #Current x
var currSceneNum
var sceneStatus
#var currY #current y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogueState = 'playable'
	$Message.hide()
	dim_background(dialogueState)
	$Character.hide()
	$ErinDialogue.hide()
	$goblinDialogue.hide()
	$ContinueOptions.hide()
	
	currX = 0
	currSceneNum = 0
	sceneStatus = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	if (stillSpeaking):
		if currX == sizeX:
			sceneStatus = true
			_stop_dialogue()
		elif currX < sizeX:
			
			hide_other_char()
			char_name(currScriptVar[currX][0])
			show_message(currScriptVar[currX][1])
			char_image(currScriptVar[currX][2])
			#char_image = scriptVar[currX][2]
			
			stillSpeaking = false
			currX += 1
	if Input.is_action_pressed("exit_dialogue"):
		sceneStatus = false
		_stop_dialogue()
	
	if 	Input.is_action_just_released("continue") && $typewriterEffect.is_playing():
		$typewriterEffect.seek(1.5, true)
	elif Input.is_action_just_released("continue") && dialogueState == 'nonplayable':
		stillSpeaking = true
	pass

func hide_other_char():
	if $goblinDialogue.visible:
		$goblinDialogue.hide()
	elif $ErinDialogue.visible:
		$ErinDialogue.hide()
	pass
func _start_dialogue() -> void:
	dialogueState = "nonplayable"
	#print("Dialogue State: ", dialogueState)
	status.emit(dialogueState)
	dim_background(dialogueState)
	pass

func _stop_dialogue() -> void:
	currX = 0
	#Done with dialogue
	stillSpeaking = false
	dialogueState = "playable"
	$Character.hide()
	$Message.hide()
	$ErinDialogue.hide()
	$goblinDialogue.hide()
	$ContinueOptions.hide()
	$typewriterEffect.seek(1.5, true)
	$fadeText.seek(1.5,true)
	dim_background(dialogueState)
	status.emit(dialogueState)
	
	if sceneStatus:
		next_message.emit()
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$typewriterEffect.play("typewriterEffect")
	$ContinueOptions.show()
	$fadeText.play("fadeText")
	pass
	
func char_name(characterName):
	$Character.text = characterName
	$Character.show()
	pass

func char_image(characterImage):
	if characterImage == 'erin':
		$ErinDialogue.show()
	elif  characterImage == 'goblin':
		$goblinDialogue.show()
	pass
	
func dim_background(dialogueState):
	if dialogueState == 'nonplayable':
		$CanvasModulate.show()
	else:
		$CanvasModulate.hide()
	pass


func _on_scripts_passing_script_ref(scriptVar,x,sceneNum) -> void:
#func _on_scripts_passing_script_ref(scriptVar,x,y) -> void:
	_start_dialogue()
	stillSpeaking = true
	currScriptVar = scriptVar
	sizeX = x
	currSceneNum = sceneNum
	#currY = y
	pass # Replace with function body.

#If there is a choice that will have to be made
func _on_scripts_choice_selection(choiceNum, choiceArr) -> void:
	
	
	pass # Replace with function body.
