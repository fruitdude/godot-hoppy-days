extends Control

onready var sceneChanger = get_node("/root/SceneChanger")
onready var buttonList = $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer.get_children()

func _ready():
	$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/StartButton.grab_focus()
	
	for button in buttonList:
		button.connect("mouse_entered", self, "_play_sound_on_button_mouse_entered", [button])
		
	for button in buttonList:
		button.connect("focus_entered", self, "_play_sound_on_button_focus_entered", [button])
		
		
func _play_sound_on_button_mouse_entered(button):
	if button:
		$MenuButtonSound.play()
		

func _play_sound_on_button_focus_entered(button):
	if button:
		$MenuButtonSound.play()
	

func _on_StartButton_pressed():
	sceneChanger.change_scene("res://scenes/Level/Level1.tscn")


func _on_QuitButton_pressed():
	sceneChanger.quit_game()