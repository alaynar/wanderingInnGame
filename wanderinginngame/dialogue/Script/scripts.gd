extends Node
signal passingScriptRef

#var script1 = [["?????????", "PlEaSe DoN't HuRt Me", "goblin"], ["Erin Solstice", "I won't hurt you, I promise", "erin"]]

var script1 = 	[
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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goblin_interact_avail(scene) -> void:
	
	if scene == 1:
		#passingScriptRef.emit(script1,2,2)
		var length = script1.size()
		passingScriptRef.emit(script1,length)
	else:
		print(scene)
	pass # Replace with function body.
