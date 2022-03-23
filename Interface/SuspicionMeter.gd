extends TextureProgress

export var suspicion_multiplier = 1.5

func _ready():
	value = 0

func _process(delta):
	value -= step

func player_seen():
	value += step * suspicion_multiplier * 1.5
	
	if value == max_value:
		end_game()

func end_game():
	get_tree().quit 





