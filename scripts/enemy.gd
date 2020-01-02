extends KinematicBody2D

export var speed = 100
export var debug = false

var level
var path
var direction = Vector2()
var player

func _ready():
  level = get_parent().get_node("Navigation2D/TileMap")
  path = level.get_path_to_player(self)
  player = get_parent().get_node("player")

func _process(delta):
  if debug:
    update()
  if (path.size() > 1):
    var pos_to_move = path[path.size() - 2]
    direction = (pos_to_move - position).normalized()
    var distance = position.distance_to(path[path.size() - 2])
    if (distance > 1):
      #position += SPEED * delta * direction
      move_and_slide(direction * speed)
      #direction = move_and_slide(SPEED * delta * direction)
    else:
      path.remove(len(path) - 1)
  else:
    path = level.get_path_to_player(self)
  #refresh path if player has moved from its previous tile
  if (path.size() > 0 and player.position.distance_to(path[0]) > 17):
    path = level.get_path_to_player(self)

# draws enemy path
func _draw():
  if !debug:
    return
  for i in range(len(path) - 1):
    draw_line(Vector2(path[i].x - position.x,
                      path[i].y - position.y),
              Vector2(path[i + 1].x - position.x,
                      path[i + 1].y - position.y),
              Color(255, 0, 0), 1)