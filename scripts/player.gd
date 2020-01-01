extends KinematicBody2D

export var speed: int
export var slow_down: float

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
  var collision = move_and_collide(delta)
  if collision != null:
    # reflect is a vector that will push you out of the wall and make you slide
    var reflect = collision.remainder.bounce(collision.normal)
    if collision.collider is TileMap:
      move_and_collide(reflect)
    if collision.collider is KinematicBody2D:
      # make other body move in same direction at slower speed
      collision.collider.move_and_collide((delta - delta.slide(collision.normal)) * slow_down)
      # push player out of other object, but not as much, so that you push it along
      move_and_collide(reflect * (1 - slow_down))
