extends Area2D
var screen_size # Size of the game window.
signal interact_avail

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	$CollisionShape2D.disabled = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.animation = "stand"
	$AnimatedSprite2D.play()
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	print("ready to interact")
	interact_avail.emit()
	pass # Replace with function body.
