extends Node
class_name Main

signal all_loaded

# Called when the node enters the scene tree for the first time.
func _ready():
	$Scenario/MainCamera.bottom_ui_margin = ($UICanvas/UIMain/Toolbar as Panel).rect_size.y
	
	$Scenario.connect("current_faction_set", $UICanvas/UIMain/ScreenBlind, "show_current_faction")
	
	_register_date_runner()
	_register_architecture_ui()
	_register_person_list()
	_register_save_load_list()
	
	_all_loaded()

func _register_architecture_ui():
	$Scenario.connect("architecture_clicked", $UICanvas/UIMain/ArchitectureSurvey, "show_data")
	$Scenario.connect("architecture_survey_updated", $UICanvas/UIMain/ArchitectureSurvey, "update_data")
	$Scenario.connect("architecture_clicked", $UICanvas/UIMain/ArchitectureMenu, "show_menu")

func _register_date_runner():
	$Scenario/DateRunner.connect("date_updated", $UICanvas/UIMain/ScreenBlind, "show_date")
	$UICanvas/UIMain/Toolbar.connect("start_date_runner", $Scenario/DateRunner, "_on_start_date_runner")
	$UICanvas/UIMain/Toolbar.connect("stop_date_runner", $Scenario/DateRunner, "_on_stop_date_runner")
	$Scenario/DateRunner.connect("day_passed", $UICanvas/UIMain/Toolbar, "_on_day_passed")
	
func _register_person_list():
	$UICanvas/UIMain/PersonList.connect("person_selected", $Scenario, "_on_person_selected")
	$UICanvas/UIMain/ArchitectureList.connect("architecture_selected", $Scenario, "_on_architecture_selected")
	
func _register_save_load_list():
	$Scenario.connect("current_faction_set", $UICanvas/UIMain/SaveLoadMenu, "_on_faction_updated")
	$UICanvas/UIMain/SaveLoadMenu.connect("file_slot_clicked", $Scenario, "_on_file_slot_clicked")

func _all_loaded():
	connect("all_loaded", $Scenario, "_on_all_loaded")
	connect("all_loaded", $Scenario/DateRunner, "_on_all_loaded")
	
	emit_signal("all_loaded")
