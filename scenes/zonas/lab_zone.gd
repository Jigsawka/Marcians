extends Control

@export var rover_container: GridContainer 
@export var buttons: Array[Button]
var rover_scene: PackedScene = preload("res://scenes/Rover.tscn")
 # Cantidad de rovers que quieres crear

# Datos globales disponibles en el juego
var rovers_cargados = false
func _ready() -> void:
	# Si ya hay datos guardados en el GameManager (porque volviste de otra escena), los cargamos de inmediato
		cargar_o_crear_rovers()

func _on_rovers_pressed() -> void:
	if rovers_cargados:
		return
	rovers_cargados = true
	cargar_o_crear_rovers()

func cargar_o_crear_rovers() -> void:
	# 1. Limpiar rovers anteriores para evitar que se acumulen o dupliquen al presionar el botón
	for child in rover_container.get_children():
		child.queue_free()
		
	# 2. Definir columnas máximas por fila (ej. máximo 3 para que baje ordenadamente)
	rover_container.columns = min(GameState.n_rovers, 3)
	
	for i in range(GameState.n_rovers):
		var new_rover = rover_scene.instantiate()
		rover_container.add_child(new_rover) # El contenedor los acomoda automáticamente



func set_visibility(button:int) -> void:
	for i in range(0,3):
		if button == i:
			buttons[i].visible = true
		else:
			buttons[i].visible = false


func _on_experiments_pressed() -> void:
	for child in rover_container.get_children():
		child.queue_free()
	rovers_cargados = false


#func _on_comunication_pressed() -> void:
	#set_visibility(2)
