extends CanvasModulate

const DARK = Color("222122")
const NIGHTVISION = Color("1ff313")

func _ready():
	visible = true
	color = DARK

func cycle_vision_mode():
	if color == NIGHTVISION:
		DARK_mode()
	else:
		NIGHTVISION_mode()
	

func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://Heist_Meisters_Assets/SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "show")
	get_tree().call_group("labels", "hide")

func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load("res://Heist_Meisters_Assets/SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "hide")
	get_tree().call_group("labels", "show")
	

