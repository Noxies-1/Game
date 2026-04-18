extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D 

var speed := 100
var direction := 1

# batas patroli
var left_limit := -50
var right_limit := 50

func _ready():
	sprite.play("idle")

func _physics_process(delta):
	velocity.x = speed * direction
	move_and_slide()
	
	if position.x > right_limit:
		direction = -1
		flip_sprite()
	elif position.x < left_limit:
		direction = 1
		flip_sprite()

func flip_sprite():
	sprite.flip_h = direction < 0