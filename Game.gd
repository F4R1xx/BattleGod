# Game.gd

extends Node

const Card = preload("res://Card.gd")

var cartas : Array = []
var carta_selecionada : Card = null
var card_display_texture : TextureRect

func _ready():
	card_display_texture = $CardDisplayTexture

	adicionar_carta("Górgonas da Justiça", 700, 500, 1, false, "res://img_inventario/gorgonas_da_justica.png")
	adicionar_carta("Cavalos de Fogo", 600, 600, 1, false, "res://img_inventario/cavalos_de_fogo.png")
	adicionar_carta("Camaleões Diplomáticos", 700, 500, 1, false, "res://img_inventario/camaleoes_diplomaticos.png")
	adicionar_carta("Almas Penadas", 1100, 400, 1, false, "res://img_inventario/almas_penadas.png")
	adicionar_carta("Unicórnios da Beleza", 700, 500, 1, false, "res://img_inventario/unicornios_da_beleza.png")

func adicionar_carta(nome_da_carta, ataque_da_carta, defesa_da_carta, nivel_da_carta, magia_da_carta, imagem_da_carta):
	var nova_carta = Card.new()
	
	nova_carta.configurar_carta(nome_da_carta, ataque_da_carta, defesa_da_carta, nivel_da_carta, magia_da_carta, imagem_da_carta)
	
	cartas.append(nova_carta)
	
	add_child(nova_carta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var space_state = get_tree().direct_space_state
		var ray_result = space_state.intersect_ray(get_viewport().get_mouse_position(), Vector2(), [self])
		
		if ray_result.size() > 0 and ray_result[0].collider is Card:
			carta_selecionada = ray_result[0].collider
			
			# Imprima os detalhes da carta selecionada
			print("Carta selecionada:", carta_selecionada.nome, "-", "Ataque:", carta_selecionada.ataque, "Defesa:", carta_selecionada.defesa, "Nível:", carta_selecionada.nivel, "Magia:", carta_selecionada.magia)
			
			# Mova a carta para o centro do tabuleiro
			var centro_do_tabuleiro = Vector2(get_viewport().get_rect().size.x / 2, get_viewport().get_rect().size.y / 2)
			carta_selecionada.rect_global_position = centro_do_tabuleiro
			
			# Remova a carta do nó Game
			cartas.erase(carta_selecionada)
			

