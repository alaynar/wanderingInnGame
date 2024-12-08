extends CanvasLayer
signal next_message
signal status
signal choiceSelected
signal roomchange
var dialogueState
var stillSpeaking = false
var currScriptVar
var sizeX #size of the number of lines
var sizeY #size of columns (1 is char, 2 is text, 3 is char image)
var currX #Current x
var currSceneNum
var sceneStatus
var numChoices #2 or 3 buttons
#var currY #current y

#Buttons
var choiceAnum
var choiceBnum
var choiceCnum
var choiceDnum
var choiceEnum

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogueState = 'playable'
	$Message.hide()
	dim_background(dialogueState)
	$Character.hide()
	$ErinDialogue.hide()
	$goblinDialogue.hide()
	$ContinueOptions.hide()
	$Escape.hide()
	
	$Options3.hide()
	$Options2.hide()
	
	currX = 0
	currSceneNum = 0
	sceneStatus = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialogueState == 'choosing':
		dialogueState = 'choosing'
	else:
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
		elif Input.is_action_just_released("continue") && dialogueState != 'playable':
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
	$Escape.show()
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
	$Escape.hide()
	$typewriterEffect.seek(1.5, true)
	$fadeText.seek(1.5,true)
	dim_background(dialogueState)
	status.emit(dialogueState)
	
	if currSceneNum == 2 || currSceneNum == 1:
		roomchange.emit()
		
	if sceneStatus:
		next_message.emit(-2)
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
	if dialogueState != 'playable':
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

################## BUTTONS AND CHOICES ############################

#If there is a choice that will have to be made
func _on_scripts_choice_selection(choiceNum, choiceArr) -> void:
	
	dialogueState = 'choosing'
	#print("Dialogue State: ", dialogueState)
	status.emit(dialogueState)
	dim_background(dialogueState)
	$Escape.show()
	numChoices = choiceNum
	
	if choiceNum == 2:
		$Options2/OptionD.text = choiceArr[0]
		$Options2/OptionE.text = choiceArr[1]
		choiceDnum = choiceArr[2]
		choiceEnum = choiceArr[3]
		#$Options2/OptionD.show()
		#$Options2/OptionE.show()
	elif choiceNum == 3:
		print(choiceArr[0]," ",choiceArr[1]," ",choiceArr[2])
		$Options3/OptionA.text = choiceArr[0]
		$Options3/OptionB.text = choiceArr[1]
		$Options3/OptionC.text = choiceArr[2]
		choiceAnum = choiceArr[3]
		choiceBnum = choiceArr[4]
		choiceCnum = choiceArr[5]
		#$Options3/OptionA.show()
		#$Options3/OptionB.show()
		#$Options3/OptionC.show()
	
	_choice_start()
	
	pass # Replace with function body.

func _on_main_choice_selection(choiceNum, choiceArr) -> void:
	dialogueState = 'choosing'
	numChoices = choiceNum
	
	#print("Dialogue State: ", dialogueState)
	status.emit(dialogueState)
	dim_background(dialogueState)
	$Escape.show()
	
	if choiceNum == 2:
		$Options2/OptionD.text = choiceArr[0]
		$Options2/OptionE.text = choiceArr[1]
		choiceDnum = choiceArr[2]
		choiceEnum = choiceArr[3]
		#$Options2/OptionD.show()
		#$Options2/OptionE.show()
	elif choiceNum == 3:
		print(choiceArr[0]," ",choiceArr[1]," ",choiceArr[2])
		$Options3/OptionA.text = choiceArr[0]
		$Options3/OptionB.text = choiceArr[1]
		$Options3/OptionC.text = choiceArr[2]
		choiceAnum = choiceArr[3]
		choiceBnum = choiceArr[4]
		choiceCnum = choiceArr[5]
		#$Options3/OptionA.show()
		#$Options3/OptionB.show()
		#$Options3/OptionC.show()
	
	_choice_start()
	
	pass # Replace with function body.

func _choice_start() -> void:
	if numChoices == 2:
		$Options2.show()
		$Options2/OptionD.show()
		$Options2/OptionE.show()
		print("here")
		
	elif numChoices == 3:
		$Options3.show()
		$Options3/OptionA.show()
		$Options3/OptionB.show()
		$Options3/OptionC.show()
		print("Here")
	
	pass

func _choice_stop() -> void:
	dialogueState = 'nonplayable'
	
	if numChoices == 2:
		$Options2/OptionD.hide()
		$Options2/OptionE.hide()
	elif numChoices == 3:
		$Options3/OptionA.hide()
		$Options3/OptionB.hide()
		$Options3/OptionC.hide()
	pass

func _on_option_a_pressed() -> void:
	print("a pressed")
	currSceneNum = choiceAnum
	_choice_stop()
	next_message.emit(choiceAnum)
	choiceSelected.emit()
	next_message.emit(choiceAnum+2)
	pass # Replace with function body.

func _on_option_b_pressed() -> void:
	print("b pressed")
	currSceneNum = choiceBnum
	_choice_stop()
	next_message.emit(choiceBnum)
	choiceSelected.emit()
	next_message.emit(choiceBnum+1)
	pass # Replace with function body.
	
func _on_option_c_pressed() -> void:
	print("c pressed")
	currSceneNum = choiceCnum
	_choice_stop()
	next_message.emit(choiceCnum)
	choiceSelected.emit()
	next_message.emit(choiceCnum+0)
	pass # Replace with function body.
	
func _on_option_d_pressed() -> void:
	print("d pressed")
	currSceneNum = choiceDnum
	_choice_stop()
	next_message.emit(choiceDnum)
	choiceSelected.emit()
	next_message.emit(choiceDnum+1)
	pass # Replace with function body.
	
func _on_option_e_pressed() -> void:
	print("e pressed")
	currSceneNum = choiceEnum
	_choice_stop()
	next_message.emit(choiceEnum)
	choiceSelected.emit()
	next_message.emit(choiceEnum+0)
	pass # Replace with function body.
