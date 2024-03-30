extends CharacterBody2D

var speed = 50
@onready var anims = $AnimatedSprite2D

func _ready():
	pass

func _physics_process(delta):
	move()
	animCtrl()


func move():
	velocity = Input.get_vector("left","right","up","down") * speed
	move_and_slide()

func animCtrl():
	if velocity.length() == 0:
		anims.stop()
	elif velocity.x < 0:
		anims.play("walkL")
	elif velocity.x > 0:
		anims.play("walkR")
	elif velocity.y > 0:
		anims.play("walkD")
	elif velocity.y < 0:
		anims.play("walkU")

