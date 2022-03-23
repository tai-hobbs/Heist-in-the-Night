extends NinePatchRect

func _ready():
	hide()

func collect_loot():
	show()
	$VBoxContainer/ItemList.add_icon_item(load("res://Heist_Meisters_Assets/GFX/Loot/suitcase.png"), false)

