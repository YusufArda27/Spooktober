extends KinematicBody2D

export (int) var speed = 150
var attacking = false
var target = Vector2()
var velocity = Vector2()
onready var anim = $AnimationPlayer
onready var timer = $Timer
onready var AttackCollision = $AtackArea/CollisionShape2D
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
func _input(event):
	
	if event.is_action_pressed('click'):
		
		anim.play("Yeni Animasyon")
		attacking = true
		AttackCollision.disabled = false;
		
		

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Yeni Animasyon":
		AttackCollision.disabled = true;
		attacking = false# Replace with function body.


