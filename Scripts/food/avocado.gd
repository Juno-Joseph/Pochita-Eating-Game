extends CharacterBody2D

var death = preload("res://Scenes/Cut Scenes/death.tscn")
@onready var transition = $"../Transition"

var avo_pts = -5
var SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var left_right = Input.get_axis("left", "right")
	var up_down = Input.get_axis("up", "down")
	if left_right:
		velocity.x = left_right * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if up_down:
		velocity.y = up_down * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	

	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Pochita"):
		global.points += avo_pts
		print(global.points)
		print("collision")
		transition.play("dark_fade_out")
		SPEED = 0
		#queue_free()

func _on_transition_animation_finished(anim_name):
	if global.points == avo_pts:
		get_tree().change_scene_to_packed(death)
	else:
		pass
