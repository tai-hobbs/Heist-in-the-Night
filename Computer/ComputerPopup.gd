extends Popup

func set_text(combination):
	$NinePatchRect/CenterContainer/NinePatchRect/Label.text = ("You have requested an access code. It has been set to "
	+ PoolStringArray(combination).join("") + " , use the code to access secured doors.")

