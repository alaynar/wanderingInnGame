extends Node
signal passingScriptRef
signal sceneChange
var sceneNum = [1.0,1.1,1.2,2.0,-1]
var currScene = 0

#var script1 = [["?????????", "PlEaSe DoN't HuRt Me", "goblin"], ["Erin Solstice", "I won't hurt you, I promise", "erin"]]

var script1v0 = [
				["??????????", "...", "goblin" ], 
			   	["Erin Solstice", "Uhmmmm... hi?", "erin"],
				["??????????", "leave me alone human", "goblin"],
				["Erin Solstice", "ok... but can I ask you-", "erin"],
				["??????????", "NO", "goblin"],
				["Erin Solsticce", "ok.", "erin"],
				["??????????", "...", "goblin"],
				["Erin Solstice", "...", "erin"],
				["Erin Solstice", "but really where-", "erin"],
				["??????????", "NO. LEAVE. NOW.", "goblin"],
				["Erin Solstice", "OKAY. ALRIGHT. GOING.", "erin"]
				]

var script1v1 = [
				["Erin Solstice", "But can I-", "erin"],
				["??????????", "No.", "goblin"],
				["Erin Solstice", "okayyy..", "erin"]
				]

var script1v2 = [
				["??????????", "Don't bother", "goblin"],
				["Erin Solstice", "Right. Yeah I wasn't going to", "erin"],
				["Erin Solstice", "but I'm LOST", "erin"],
				["??????????", "I can't help you", "goblin"],
				["Erin Solstice", "Of course not", "erin"]
				]
var script2v0 = [
				["Creator", "No other Dialogue. Come back another time", ""],
				]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_talking(varSceneNum) -> void:
	var sceneCalled
	if varSceneNum == 0:
		var length = script1v0.size()
		passingScriptRef.emit(script1v0,length,currScene)
	elif varSceneNum == 1:
		var length = script1v1.size()
		passingScriptRef.emit(script1v1,length,currScene)
	elif varSceneNum == 2:
		var length = script1v2.size()
		passingScriptRef.emit(script1v2,length,currScene)
	elif varSceneNum == 3:
		var length = script2v0.size()
		passingScriptRef.emit(script2v0,length,currScene)
	else:
		print(varSceneNum)

	pass # Replace with function body.

func _on_dialogue_next_message() -> void:
	#Dialog has finished - change scene and emit
	if sceneNum[currScene+1] != -1:
		currScene += 1
	sceneChange.emit(currScene)
	pass # Replace with function body.
