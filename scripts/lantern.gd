extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var targetPosition = get_parent().get_node("player").position
const SPEED = 200
var direction = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("ui_select")):
		targetPosition = get_global_mouse_position()
	direction = (targetPosition - position).normalized()
	if (position.distance_to(targetPosition) > 10):
		#move_and_slide(direction * SPEED)
		apply_impulse(Vector2(), direction * SPEED)
	pass
	