extends ColorRect

var enemy_list=[
	preload("res://resources/Shark.tscn")
	]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_SpawnTimer_timeout():
	print("called")
	var enemy_index = randi() % enemy_list.size()
	var enemy_instance = enemy_list[enemy_index].instance()
	var scene = enemy_instance.instance()

	# Get all Position2D nodes in the "spawn" group
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")

	# Select a random Position2D node
	var spawn_node = spawn_nodes[randi() % spawn_nodes.size()]

	# Set the position of the spawned enemy to the position of the selected Position2D node
	scene.position = spawn_node.position

	# Add the enemy to the parent of the Position2D nodes
	spawn_node.get_parent().add_child(scene)


