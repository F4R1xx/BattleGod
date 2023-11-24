extends Node2D

func _on_button_configuracao_pressed():
	print('ir para configuração')
	get_parent().mudar_cena(self, get_parent().get_node("Configuração"))



