extends KinematicBody2D

export var speed: int
export var mass: int

func _physics_process(delta_time):
  var delta = Vector2()

  if Input.is_action_pressed("move_up"):
    delta.y += -1
  if Input.is_action_pressed("move_down"):
    delta.y += 1
  if Input.is_action_pressed("move_left"):
    delta.x += -1
  if Input.is_action_pressed("move_right"):
    delta.x += 1
  delta = delta.normalized() * speed * delta_time
  move_and_slide(delta)
