extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dropscene
var timeDelta = 0
var randy = RandomNumberGenerator.new()

var selectedCup
var levels = ["level1", "level2", "level3", "level4"]
var curLevel = 0

func playSound():
	$Sound.play()

func stopSound():
	$Sound.stop()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	dropscene = load("res://Drop.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeDelta = timeDelta + delta
	if timeDelta > 0.01:
		timeDelta = 0
		var drop = dropscene.instance()
		var xSpeed = randy.randf_range(-1,1)
		add_child(drop)
		drop.position = Vector2(xSpeed, 0)
