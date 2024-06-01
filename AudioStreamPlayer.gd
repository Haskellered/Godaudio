extends AudioStreamPlayer

var note: int
var key: int
var octave: int
var accidental: int

const notes = {
	'c': 0,
	'd': 2,
	'e': 4,
	'f': 5,
	'g': 7,
	'a': 9,
	'b': 11
}

const octaves = [3, 4, 5]

func _input(event):
	
	# Keys
	
	for n in notes.keys():
		if Input.is_action_pressed("note_%s" % n):
			key = notes[n]
	
	# Octaves
	
	for o in octaves:
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
		pitch_scale = pow(2, float(note-57)/12)
		if !playing:
			play()
