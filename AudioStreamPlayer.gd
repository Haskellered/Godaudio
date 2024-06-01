extends AudioStreamPlayer

var note: int
var key: int
var octave: int
var accidental: int

func _input(event):
	
	# Keys
	
	key = -1
	if Input.is_action_pressed("note_c"):
		key = 0
	if Input.is_action_pressed("note_d"):
		key = 2
	if Input.is_action_pressed("note_e"):
		key = 4
	if Input.is_action_pressed("note_f"):
		key = 5
	if Input.is_action_pressed("note_g"):
		key = 7
	if Input.is_action_pressed("note_a"):
		key = 9
	if Input.is_action_pressed("note_b"):
		key = 11
	
	# Octaves
	
	if Input.is_action_pressed("octave_3"):
		octave = 36
	if Input.is_action_pressed("octave_4"):
		octave = 48
	if Input.is_action_pressed("octave_5"):
		octave = 60
		
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
		pitch_scale = pow(2, float(note-57)/12)
		if !playing:
			play()
