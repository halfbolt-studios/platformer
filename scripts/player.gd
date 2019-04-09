extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_down"):
        direction.y += SPEED
	if Input.is_action_pressed("ui_up"):
        direction.y += -SPEED
	if Input.is_action_pressed("ui_left"):
        direction.x += -SPEED
	if Input.is_action_pressed("ui_right"):
        direction.x += SPEED
	#print("x: " + str(direction.x) + ", y: " + str(direction.y))
	#set_pos(get_pos() + direction.normalized() * SPEED * delta)
	#direction = move_and_slide(direction)
	direction = move_and_slide(direction)
	pass
	
func get_pos():
	return position	
