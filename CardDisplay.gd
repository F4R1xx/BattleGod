# CardDisplay.gd

extends Control

var imagem_carta : TextureRect

func _ready():
	imagem_carta = $TextureRect

func _process(delta):
	if $Game.carta_selecionada:
		imagem_carta.texture = $Game.carta_selecionada.texture
	else:
		imagem_carta.texture = null
