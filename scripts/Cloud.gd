extends Node2D

var timeout = false


func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
		
func fire():
	if !timeout:
		$Sprite/RayCast2D.add_child(load("res://scenes/NPCS/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true

func _on_Timer_timeout():
	timeout = false
