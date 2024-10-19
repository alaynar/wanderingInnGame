extends Sprite2D
var screen_size # Size of the game window.
signal interact_avail
var characterName = "Goblin"
var inGoblinArea 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#$CollisionShape2D.disabled = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$AnimatedSprite2D.animation = "stand"
	#$AnimatedSprite2D.play()
	pass


func _on_interaction_area_body_entered(body: CharacterBody2D) -> void:
	var interactButton = "'e' to interact"
	inGoblinArea = true
	$ShowInteractButton.text = interactButton
	$ShowInteractButton.show()
	
	if inGoblinArea &&  Input.is_action_pressed("interact"):
		var text = "Please don't kill me"
		interact_avail.emit(characterName, text)
	pass # Replace with function body.

func _on_interaction_area_body_exited(body: Node2D) -> void:
	inGoblinArea = false
	$ShowInteractButton.hide()
	pass # Replace with function body.
