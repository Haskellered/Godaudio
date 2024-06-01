extends AudioStreamPlayer

var note: int
var key: int
var octave: int
var accidental: int

var mouse_x: int
var viewport_size_x: int

var pitch_bend_sensitivity: float = 16

const notes := {
	'c': 0,
	'd': 2,
	'e': 4,
	'f': 5,
	'g': 7,
	'a': 9,
	'b': 11
}

const octaves := [3, 4, 5]

func _input(event: InputEvent):
	
	if event is InputEventMouseMotion:
		volume_db = linear_to_db(event.get_pressure())
	
	# Keys
	
	key = -1
	for n: String in notes.keys():
		if Input.is_action_pressed("note_%s" % n):
			key = notes[n]
	
	# Octaves
	
	for o: int in octaves:
		if Input.is_action_pressed("octave_%d" % o):
			octave = o * 12
		
	# Accidentals
	
	accidental = 0
	if Input.is_action_pressed("flat"):
		accidental = -1
	if Input.is_action_pressed("sharp"):
		accidental = 1
	
	if key == -1:
		stop()
	else:
		note = key + octave + accidental
		if !playing:
			play()
	
	

func _process(_delta: float):
	mouse_x = get_viewport().get_mouse_position().x
	viewport_size_x = get_viewport().size.x
	pitch_scale = pow(2, float(note+((float(mouse_x)/(float(viewport_size_x)/pitch_bend_sensitivity))-pitch_bend_sensitivity/2)-57)/12)
	#print(pitch_scale)
	print(volume_db)
