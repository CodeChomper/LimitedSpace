extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cur_level = 1
var max_level = 5

func next_level():
	cur_level += 1
	if cur_level <= max_level:
		get_tree().change_scene("res://level" + str(cur_level) + ".tscn")
	else:
		get_tree().change_scene("res://finish.tscn")

func game_over():
	get_tree().change_scene("res://gameover.tscn")

func start_over():
	cur_level = 1
	get_tree().change_scene("res://level1.tscn")

func try_again():
	get_tree().change_scene("res://level" + str(cur_level) + ".tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
