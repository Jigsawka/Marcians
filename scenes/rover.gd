extends Control

@export var textRect: TextureRect
@export var status_label: Label      # Label para mostrar el estado actual
@export var battery_label: Label     # Label para mostrar el nivel de la batería

# ops[0] -> OptionButton de Astronautas
# ops[1] -> OptionButton de Funciones/Roles
@export var marcian_button: OptionButton
@export var function_button: OptionButton

func set_status(status : Label):
	status_label = status

func get_status() -> String:
	return status_label.text
	
func set_battery(battery : String):
	battery_label.text = battery

func get_battery() -> String:
	return battery_label.text
	
func set_buttonMarcian(marcians : Array,n_marcians : int):
	for i in range(0,n_marcians):
		marcian_button.add_item(marcians[i])
