extends KinematicBody2D

export var speed = 200

var target_position
var direction = Vector2()

func _ready():
  target_position = get_parent().get_node("player").position

func _physics_process(delta):
  if Input.is_action_just_pressed("move_lantern"):
    var mouse_position = get_node("/root").get_mouse_position()
    target_position = get_node("/root/container/viewport").get_canvas_transform().inverse() * mouse_position
  direction = (target_position - position).normalized()
  if position.distance_to(target_position) > 10:
    move_and_slide(direction * speed)
