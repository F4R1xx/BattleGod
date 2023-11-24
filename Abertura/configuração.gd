extends Node2D

func _on_button_pressed():
	print('cliquei no botão de voltar')
	get_parent().mudar_cena(self, get_parent().get_node("Abertura"))

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_button_2_pressed():
	if $Panel/AudioStreamPlayer.playing:
		$Panel/AudioStreamPlayer.stop()
	else:
		$Panel/AudioStreamPlayer.play()
