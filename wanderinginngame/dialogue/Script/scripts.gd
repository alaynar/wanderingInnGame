extends Node
signal passingScriptRef

var script1 = [["?????????", "PlEaSe DoN't HuRt Me", "goblin"], ["Erin Solstice", "I won't hurt you, I promise", "erin"]]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goblin_interact_avail(scene) -> void:
	
	if scene == 1:
		#passingScriptRef.emit(script1,2,2)
		passingScriptRef.emit(script1,2)
	else:
		print(scene)
	pass # Replace with function body.
