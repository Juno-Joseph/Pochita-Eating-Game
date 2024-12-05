extends Node2D

@onready var pochita_mouth: CollisionShape2D = $CollisionShape2D

var ready_to_eat = false
var selected = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false

func _on_body_entered(body):
	print("You ate an apple")
