extends Control

@export var textRect: TextureRect
@export var status_label: Label      # Label para mostrar el estado actual
@export var battery_label: Label     # Label para mostrar el nivel de la batería

# ops[0] -> OptionButton de Astronautas
# ops[1] -> OptionButton de Funciones/Roles
@export var ops: Array[OptionButton] 

# Función para rellenar los desplegables con datos iniciales
func setup_rover_options(astronauts_list: Array, functions_list: Array) -> void:
	# Configurar OptionButton de astronautas
	if ops.size() > 0 and ops[0]:
		ops[0].clear()
		for astronaut in astronauts_list:
			ops[0].add_item(str(astronaut))
			
	# Configurar OptionButton de funciones
	if ops.size() > 1 and ops[1]:
		ops[1].clear()
		for func_name in functions_list:
			ops[1].add_item(str(func_name))

# Función para actualizar los textos de estado y batería en tiempo real
func update_status_and_battery(new_status: String, battery_percentage: float) -> void:
	if status_label:
		status_label.text = "Estado: " + new_status
	if battery_label:
		battery_label.text = "Batería: " + str(battery_percentage) + "%"
		
func get_rover_state() -> Dictionary:
	return {
		"selected_astronaut": ops[0].selected if ops.size() > 0 and ops[0] else 0,
		"selected_function": ops[1].selected if ops.size() > 1 and ops[1] else 0,
		"status": status_label.text if status_label else "",
		"battery": battery_label.text if battery_label else ""
	}

func load_rover_state(data: Dictionary) -> void:
	if ops.size() > 0 and ops[0]:
		ops[0].select(data.get("selected_astronaut", 0))
	if ops.size() > 1 and ops[1]:
		ops[1].select(data.get("selected_function", 0))
	if status_label:
		status_label.text = data.get("status", "En ruta")
	if battery_label:
		battery_label.text = data.get("battery", "100%")
