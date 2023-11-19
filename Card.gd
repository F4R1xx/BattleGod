# Card.gd

# Atributos da carta
var nome : String
var ataque : int
var defesa : int
var nivel : int
var magia : bool

# Função para configurar a carta com base nos atributos
func configurar_carta(nome_da_carta, ataque_da_carta, defesa_da_carta, nivel_da_carta, magia_da_carta, imagem_da_carta):
	nome = nome_da_carta
	ataque = ataque_da_carta
	defesa = defesa_da_carta
	nivel = nivel_da_carta
	magia = magia_da_carta
	
	var texture = ResourceLoader.load(imagem_da_carta)
	
	
