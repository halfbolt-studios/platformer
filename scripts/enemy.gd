extends KinematicBody2D
#extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var level = get_parent().get_node("Navigation2D/TileMap")
var path = []
const SPEED = 100
var direction = Vector2(0,0)

"""
	#very basic enemy AI, we need to use a better one
	if position.y < player.get_pos().y:
        direction.y += SPEED
	if position.y > player.get_pos().y:
        direction.y += -SPEED
	if position.x > player.get_pos().x:
        direction.x += -SPEED
	if position.x < player.get_pos().x:
        direction.x += SPEED
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	path = level.get_path_to_player(self)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	var player = get_parent().get_node("player")
	if (path.size() > 1):
		var pos_to_move = path[path.size() - 2]
		direction = (pos_to_move - position).normalized()
		var distance = position.distance_to(path[path.size() - 2])
		if (distance > 1):
			#position += SPEED * delta * direction
			move_and_slide(direction * SPEED)
			#direction = move_and_slide(SPEED * delta * direction)
		else:
			path.remove(len(path) - 1)
	else:
		path = level.get_path_to_player(self)
	#refresh path if player has moved from its previous tile
	if (player.position.distance_to(path[0]) > 16):
		path = level.get_path_to_player(self)
	pass

#draws enemy path
func _draw():
	for index in range(len(path) - 1):
		draw_line(Vector2(path[index].x - position.x, path[index].y - position.y), Vector2(path[index + 1].x - position.x, path[index + 1].y - position.y), Color(255, 0, 0), 1)
	