extends Node
signal passingScriptRef
signal sceneChange
signal choiceSelection
var sceneNum = [0.0,0.1,0.2,0.3,1.0,1.1,1.2,1.3,-1]
var currScene = 0

var scriptCave0v0 = [
				["Erin Solstice", "Hmmmm mmmmHmmm mhmmmm hmmmm", "erin", -2],
				["Erin Solstice", "Huh?", "erin", -2],
				["Erin Solstice", "where am i?", "erin", -2],
				["Erin Solstice", "I must've taken a wrong turn, a VERY wrong turn. Where's the bathroom?", "erin", -2],
				]

#SCREAMING OPTION
var scriptCaveOpt0v1 = [
				["Erin Solstice", "aaaaaAAAAAAAAAAAAHHHHHHHHHHHHHHHHHH", "erin", -2],
				["", "RUN", "", 4],
				]
#FREEZE OPTION
var scriptCaveOpt0v2 = [
				["Erin Solstice", "th-that's a dragon... i'm just gonna...", "erin", -2],
				["", "RUN", "", 4],
				]
#Rub Eyes OPTION
var scriptCaveOpt0v3 = [
				["Erin Solstice", "*Rubs eyes*", "erin", -2],
				["Erin Solstice", "theres no way that's real right?", "erin", -2],
				["","the dragons eyes blink open", "", -2],
				["Erin Solstice", "NOPE", "erin", -2],
				["", "RUN", "", 4],
				]

var scriptWild1v0 = [
				["Erin Solstice", "oh..*inhale*", "erin", -2],
				["Erin Solstice", "my..*inhale*", "erin", -2],
				["Erin Solstice", "chess..*inhale*", "erin", -2],
				["Erin Solstice", "That was real, much too real", "erin", -2],
				["Erin Solstice", "Where am I now?", "erin", -2],
				]
#Scream for help
var scriptWildOpt1v1 = [
				["Erin Solstice", "HELLO??", "erin", -2],
				["Erin Solstice", "IS ANYONE THERE?!", "erin", 8],
				]
#Stay and rest
var scriptWildOpt1v2 = [
				["Erin Solstice", "Let me *inhale* just *inhale* catch my breath", "erin", -2],
				["Erin Solstice", "OW, how'd I get singed?!", "erin", 8]
]
#Wander
var scriptWildOpt1v3 = [
				["Erin Solstice", "Welp, I can't stay here. What if the dragon comes out", "erin", 8],
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_talking(varSceneNum) -> void:
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
		var choiceArray=["Scream","Stay","Wander"]
		choiceSelection.emit(3,choiceArray)
	elif sceneNum[varSceneNum] == 1.1:
		var length = scriptWildOpt1v1.size()
		passingScriptRef.emit(scriptWildOpt1v1,length,currScene)
	elif sceneNum[varSceneNum] == 1.2:
		var length = scriptWildOpt1v2.size()
		passingScriptRef.emit(scriptWildOpt1v2,length,currScene)
	elif sceneNum[varSceneNum] == 1.3:
		var length = scriptWildOpt1v3.size()
		passingScriptRef.emit(scriptWildOpt1v3,length,currScene)
	else:
		print(varSceneNum)

	pass # Replace with function body.

func _on_dialogue_next_message() -> void:
	#Dialog has finished - change scene and emit
	if sceneNum[currScene+1] != -1:
		currScene += 1
	sceneChange.emit(currScene)
	pass # Replace with function body.
