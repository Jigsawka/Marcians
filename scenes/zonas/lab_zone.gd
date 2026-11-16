extends Control

@export var rover_container: GridContainer 
@export var buttons: Array[Button]
var rover_scene: PackedScene = preload("res://scenes/Rover.tscn")
var n_rovers: int = 3 # Cantidad de rovers que quieres crear

# Datos globales disponibles en el juego
var all_astronauts: Array = ["Cmd. Alex", "Ing. María", "Sci. Carlos", "Piloto Sofía"]
var rover_functions: Array = ["Exploración", "Minería", "Investigación", "Reparación"]
var rovers_cargados = false
func _ready() -> void:
	# Si ya hay datos guardados en el GameManager (porque volviste de otra escena), los cargamos de inmediato
	if GameManager.is_initialized:
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
	rover_container.columns = min(n_rovers, 3)
	
	for i in range(n_rovers):
		var new_rover = rover_scene.instantiate()
		rover_container.add_child(new_rover) # El contenedor los acomoda automáticamente

# 5. Guardar automáticamente el estado de los rovers antes de salir de esta escena (al cambiar de escena)
func _exit_tree() -> void:
	GameManager.saved_rovers_data.clear()
	for rover in rover_container.get_children():
		if rover.has_method("get_rover_state"):
			GameManager.saved_rovers_data.append(rover.get_rover_state())

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
