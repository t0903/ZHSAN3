extends Node
class_name Person

var id: int setget forbidden
var scenario

var surname: String setget forbidden
var given_name: String setget forbidden
var courtesy_name: String setget forbidden

var _belonged_architecture setget set_belonged_architecture,get_belonged_architecture

var command: int setget forbidden
var strength: int setget forbidden
var intelligence: int setget forbidden
var politics: int setget forbidden
var glamour: int setget forbidden

func forbidden(x):
	assert(false)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_data(json: Dictionary):
	id = json["_Id"]
	surname = json["Surname"]
	given_name = json["GivenName"]
	courtesy_name = json["CourtesyName"]
	command = json["Command"]
	strength = json["Strength"]
	intelligence = json["Intelligence"]
	politics = json["Politics"]
	glamour = json["Glamour"]

func get_name() -> String:
	return surname + given_name
	
func get_belonged_architecture(): 
	return _belonged_architecture
	
func set_belonged_architecture(arch, force = false):
	_belonged_architecture = arch
	if not force:
		arch.add_person(self, true)
		
func day_event():
	pass
