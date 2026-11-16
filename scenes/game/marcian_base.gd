extends Node2D

@export var timer: Timer
@export var zones: Array[Control]

@export var camera_zoom: Vector2 = Vector2(1, 1)
@export var use_limits: bool = true
@export var limit_left: int = 0
@export var limit_top: int = 0
@export var limit_right: int = 1920
@export var limit_bottom: int = 1080

var zone = 5
var sols = 4
var data = 100
var win = false
func _ready() -> void:
	set_visibility(5)
	
	# 1. Asegurar que el tiempo de espera sea 30 segundos (puedes ajustarlo en el Inspector o aquí)
	timer.wait_time = 30.0
	# 2. Hacer que el timer se repita automáticamente cada vez que termine
	timer.autostart = true 
	# 3. Conectar la señal 'timeout' del timer por código a nuestra función
	#timer.timeout.connect(timeou)
	
	timer.start()

func _process(delta: float) -> void:
	if sols >= 5:
		if data >= 100.0:
			win = true
		else:
			win = false
		
		get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
		$".".queue_free()


func _on_button_ez_pressed() -> void:
	zone = 0
	set_visibility(zone)

func _on_button_op_pressed() -> void:
	zone = 3
	set_visibility(zone)

func _on_button_hp_pressed() -> void:
	zone = 2
	set_visibility(zone)

func _on_button_lab_pressed() -> void:
	zone = 1
	set_visibility(zone)
	
func set_visibility(zone:int) -> void:
	for i in range(0,4):
		if zone == i:
			zones[i].visible = true
		else:
			zones[i].visible = false
