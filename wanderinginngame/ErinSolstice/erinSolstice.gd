extends CharacterBody2D

@export var speed = 250 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
signal interact
var characterName = "Erin Solstice"
var playerState = "playable"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	$CollisionShape2D.disabled = false
	var playerState = "playable"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (playerState == "playable"):
		var velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
		
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)
	
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
			$AnimatedSprite2D.flip_h = velocity.x > 0
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "down"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = "up"
	
		move_and_slide()
	pass

#func _on_body_entered(body: Node2D) -> void:
#	print("I've been impaled")
#	pass # Replace with function body.

func _on_main_game_status(gameState) -> void:
	playerState = gameState
	pass # Replace with function body.
