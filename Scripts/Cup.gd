extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var faucet
var drop_count = 0
var LevelManager
var win = false

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelManager = get_tree().get_root().find_node("LevelManager", true, false)
	faucet = get_tree().get_root().find_node("FaucetNode", true, false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(1) and faucet.selectedCup == null:
			faucet.set_process(true)
			faucet.selectedCup = self
			faucet.playSound()
			print("Clicked")
			# Send Start Signal
	pass # Replace with function body.


func _on_FillLine_body_entered(body):
	if $SwitchLevel.is_stopped():
		drop_count += 1
		if drop_count > 50:
			$SwitchLevel.start()
			faucet.set_process(false)
			faucet.stopSound()
			if faucet.selectedCup == self:
				win = true
			else:
				win = false
	pass # Replace with function body.


func _on_FillLine_body_exited(body):
	drop_count -= 1
	pass # Replace with function body.


func _on_SwitchLevel_timeout():
	if win:
		LevelManager.next_level()
	else:
		LevelManager.game_over()
	pass # Replace with function body.
