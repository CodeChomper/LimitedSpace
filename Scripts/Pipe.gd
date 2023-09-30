extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int, 1, 60) var width = 1 setget _width_set
export(int, 1, 60) var height = 1 setget _height_set


func _width_set(value):
	width = value
	self.scale.x = value

func _height_set(value):
	height = value
	self.scale.y = value


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
