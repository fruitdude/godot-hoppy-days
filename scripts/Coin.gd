extends Node2D

var is_coin_taken = false


func _on_Area2D_body_entered(body):
	if not is_coin_taken:
		is_coin_taken = true
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()
		get_tree().call_group("Gamestate", "coin_up")
	
	
func die():
	queue_free()
