extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_parent().get_node("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_path_to_player(enemy):
	var path = get_parent().get_simple_path(player.position, enemy.position)
	return path
