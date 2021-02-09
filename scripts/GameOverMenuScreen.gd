extends Control

onready var sceneChanger = get_node("/root/SceneChanger")
onready var buttonContainerChildren = $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer.get_children()


func _ready():
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/TryAgainButton.grab_focus()
	
	for button in buttonContainerChildren:
		button.connect("mouse_entered", self, "_on_ButtonContainer_mouse_entered", [button])
		
		
func _on_ButtonContainer_mouse_entered(button):
	if button:
		$MenuButtonSound.play()
		
		
func _on_ButtonContainer_focus_entered(button):
	print("working")
	if button:
		$MenuButtonSound.play()


func _on_TryAgainButton_pressed():
	sceneChanger.change_scene("res://scenes/Level/Level1.tscn")


func _on_TitleScreenButton_pressed():
	sceneChanger.change_scene("res://scenes/Menus/TitleMenuScreen.tscn")
	

func _on_QuitButton_pressed():
	sceneChanger.quit_game()
