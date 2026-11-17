extends Control

@onready var audio_player: AudioStreamPlayer2D = $main_music
@onready var panel_opciones = $Panel

const PREGAME_SCENE := "res://scenes/pregame/pregame.tscn"
const SETTINGS_SCENE := "res://scenes/settings/settings.tscn"

func _ready() -> void:
	var music = load("res://music/main_music.ogg")
	music.loop = true
	
	audio_player.stream = music
	audio_player.play()

func _on_new_game_pressed() -> void:
	GameSetup.reset_selection()
	get_tree().change_scene_to_file(PREGAME_SCENE)

func _on_options_pressed() -> void:
	panel_opciones.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_back_main_menu() -> void:
	panel_opciones.visible = false
