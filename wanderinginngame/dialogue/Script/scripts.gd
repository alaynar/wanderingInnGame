extends Node
signal passingScriptRef
signal sceneChange
signal choiceSelection
var isNextDialChoice
var sceneNum = [0.4,0.5,0.6,0.0,0.1,0.2,0.3,1.0,1.1,1.2,1.3,2.0,1.4,-1]
var currScene = 0

var scriptRoom0v4 = [
				["Erin Solstice", "Ahhhh what a good game.", "erin", -2],
				["Erin Solstice", "how long have I been playing or should I say winning at chess?", "erin", -2],
				["Erin Solstice", "...", "erin", -2],
				["Erin Solstice", "8 hours?!", "erin", -2],
				["Erin Solstice", "I should probably take a break..", "erin", 2],
				]

#One more game
var scriptRoomOpt0v5 = [
				["Erin Solstice", "well..", "erin", -2],
				["Erin Solstice", "one more game couldn't hurt..", "erin", -2],
				["", "1 hour later", "", -2],
				["Erin Solstice", "Another Victory!! Easy as pie", "erin", -2],
				["Erin Solstice", "Okay, now I should seriously take a break", "erin", 2],
				["Erin Solstice", "and use the bathroom while I'm at it", "erin", -2],
				["", "Erin walks the long hallway to the bathroom when everything fades to black", "", -2],
				["Erin Solstice", "oh great, who turned out the lights", "erin", -2],
				["", "In the blink of an eye, the world reappears", "", 3]
				]

#Take a break
var scriptRoomOpt0v6 = [
				["Erin Solstice", "Maybe I should use the bathroom while I'm at it", "erin", -2],
				["", "Erin walks the long hallway to the bathroom when everything fades to black", "", -2],
				["Erin Solstice", "oh great, who turned out the lights", "erin", -2],
				["", "In the blink of an eye, the world reappears", "", 3]
]

var scriptCave0v0 = [
				["Erin Solstice", "Huh?", "erin", -2],
				["Erin Solstice", "where am I?", "erin", -2],
				["Erin Solstice", "I must've taken a wrong turn, a VERY wrong turn. Where's the bathroom?", "erin", -2],
				]

#SCREAMING OPTION
var scriptCaveOpt0v1 = [
				["Erin Solstice", "aaaaaAAAAAAAAAAAAHHHHHHHHHHHHHHHHHH", "erin", -2],
				["", "RUN", "", 7],
				]
#FREEZE OPTION
var scriptCaveOpt0v2 = [
				["Erin Solstice", "th-that's a dragon... i'm just gonna...", "erin", -2],
				["", "RUN", "", 7],
				]
#Rub Eyes OPTION
var scriptCaveOpt0v3 = [
				["Erin Solstice", "*Rubs eyes*", "erin", -2],
				["Erin Solstice", "theres no way that's real right?", "erin", -2],
				["","the dragons eyes blink open", "", -2],
				["Erin Solstice", "NOPE", "erin", -2],
				["", "RUN", "", 7],
				]

var scriptWild1v0 = [
				["Erin Solstice", "oh..*inhale*", "erin", -2],
				["Erin Solstice", "my..*inhale*", "erin", -2],
				["Erin Solstice", "stars..*inhale*", "erin", -2],
				["Erin Solstice", "That was real, much too real", "erin", -2],
				["Erin Solstice", "Where am I now?", "erin", -2],
				]
#Scream for help
var scriptWildOpt1v1 = [
				["Erin Solstice", "HELLO??", "erin", -2],
				["Erin Solstice", "IS ANYONE THERE?!", "erin", 11],
				]
#Stay and rest
var scriptWildOpt1v2 = [
				["Erin Solstice", "Let me *inhale* just *inhale* catch my breath", "erin", -2],
				["Erin Solstice", "OW, how'd I get singed?!", "erin", 11]
]
#Wander
var scriptWildOpt1v3 = [
				["Erin Solstice", "Welp, I can't stay here. What if the dragon comes out", "erin", 11],
]
#Wander
var scriptWild1v4 = [
				["Creator", "Come back for more story next time!", "", -2],
]

var scriptInn2v0 = [
				["Erin Solstice", "hello??", "erin", -2],
				["Erin Solstice", "Is anyone here??", "erin", -2],
				["", "The building is worn down, and covered in a thick layer of dust","",-2],
				["Erin Solstice", "ugh, *cough* it's disgusting", "erin", -2],
				["Erin Solstice", "I'll go back outside", "erin", -2],
				["Erin Solstice", "...", "erin", -2],
				["Erin Solstice", "It's raining", "erin", -2],
				["Erin Solstice", "I guess I'll be stuck in here for a while", "erin", -2],
				["Erin Solstice", "...", "erin", -2],
				["Erin Solstice", "Ouch!", "erin", -2],
				["Erin Solstice", "That dragon really burnt my arm", "erin", -2],
				["", "Although the dragon had barly breathed, Erins arm was singed black","",-2],
				["Erin Solstice", "whats going to happen to me now..", "erin", -2],
				["Creator", "Thank you for playing the tutorial of 'The Wandering Inn: The Game!'", "", -2],
				["Creator", "While this story is over, you can read the rest online!","",-2],
				["Creator", "Thank you Pirateaba for these amazing books", "", -2],
				]
				
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_talking(varSceneNum) -> void:
	print(varSceneNum)
	if sceneNum[varSceneNum] == 0.4:
		var length = scriptRoom0v4.size()
		passingScriptRef.emit(scriptRoom0v4,length,currScene)
		isNextDialChoice = true
	if sceneNum[varSceneNum] == 0.5:
		var length = scriptRoomOpt0v5.size()
		passingScriptRef.emit(scriptRoomOpt0v5,length,currScene)
	if sceneNum[varSceneNum] == 0.6:
		var length = scriptRoomOpt0v6.size()
		passingScriptRef.emit(scriptRoomOpt0v6,length,currScene)
	if sceneNum[varSceneNum] == 0.0:
		var length = scriptCave0v0.size()
		passingScriptRef.emit(scriptCave0v0,length,currScene)
	elif sceneNum[varSceneNum] == 0.1:
		var length = scriptCaveOpt0v1.size()
		passingScriptRef.emit(scriptCaveOpt0v1,length,currScene)
	elif sceneNum[varSceneNum] == 0.2:
		var length = scriptCaveOpt0v2.size()
		passingScriptRef.emit(scriptCaveOpt0v2,length,currScene)
	elif sceneNum[varSceneNum] == 0.3:
		var length = scriptCaveOpt0v3.size()
		passingScriptRef.emit(scriptCaveOpt0v3,length,currScene)
	elif sceneNum[varSceneNum] == 1.0:
		var length = scriptWild1v0.size()
		passingScriptRef.emit(scriptWild1v0,length,currScene)
		isNextDialChoice = true
	elif sceneNum[varSceneNum] == 1.1:
		var length = scriptWildOpt1v1.size()
		passingScriptRef.emit(scriptWildOpt1v1,length,currScene)
	elif sceneNum[varSceneNum] == 1.2:
		var length = scriptWildOpt1v2.size()
		passingScriptRef.emit(scriptWildOpt1v2,length,currScene)
	elif sceneNum[varSceneNum] == 1.3:
		var length = scriptWildOpt1v3.size()
		passingScriptRef.emit(scriptWildOpt1v3,length,currScene)
	elif sceneNum[varSceneNum] == 2.0:
		var length = scriptInn2v0.size()
		passingScriptRef.emit(scriptInn2v0,length,currScene)
	elif sceneNum[varSceneNum] == 1.4:
		var length = scriptWild1v4.size()
		passingScriptRef.emit(scriptWild1v4,length,currScene)
	else:
		print(varSceneNum)

	pass # Replace with function body.

func _on_dialogue_next_message(choice) -> void:
	#Dialog has finished - change scene and emit
	if choice != -2:
		if sceneNum.size() > choice:
			currScene = choice
		else:
			currScene = sceneNum[sceneNum.size() -1]
	elif choice == -2 && sceneNum[currScene+1] != -1:
		currScene += 1
	sceneChange.emit(currScene)
	pass # Replace with function body.

func _on_dialogue_status(passedDialState) -> void:
	if passedDialState == 'playable' && isNextDialChoice:
		if currScene == 0:
			var choiceArray=["Play 1 more","Take a break",1,2]
			choiceSelection.emit(2,choiceArray)
		if currScene == 7:
			var choiceArray=["Scream","Stay","Wander",8,9,10]
			choiceSelection.emit(3,choiceArray)
	pass # Replace with function body.
