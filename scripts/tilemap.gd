extends TileMap

var player

func _ready():
  player = get_parent().get_parent().get_node("player")

func get_path_to_player(enemy):
  var path = get_parent().get_simple_path(player.position, enemy.position)
  return path
