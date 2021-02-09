extends Control

onready var sceneChanger = get_node("/root/SceneChanger")
onready var buttonContainerChildren = $TextureRect/CenterContainer/VBoxContainer/HBoxContainer/ButtonContainer.get_children()


func _ready():
	for button in buttonContainerChildren:
		button.connect("mouse_entered", self, "_on_ButtonContainer_mouse_entered", [button])
		
		
func _on_ButtonContainer_mouse_entered(button):
	if button:
		$Menu.play()
		
		
func _on_ButtonContainer_focus_entered(button):
	print("working")
	if button:
		$Menu.play()


func _on_TryAgain_pressed():
	sceneChanger.change_scene("res://scenes/Level/Level1.tscn")


func _on_TitleScreenButton_pressed():
	sceneChanger.change_scene("res://scenes/Level/TitleScreen.tscn")


func _on_Button_pressed():
	sceneChanger.quit_game()
	
	
#func _input(event):
#	if event.is_action_pressed("ui_up"):
		
#		$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Start.grab_focus()
#		$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Quit.release_focus()
#	elif event.is_action_pressed("ui_down"):
#		$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Start.release_focus()
#		$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Quit.grab_focus()