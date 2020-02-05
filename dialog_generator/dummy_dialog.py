
options = [["dummy", "dummy", "dummy"] , ["dummy", "dummy", "dummy"], ["dummy", "dummy", "dummy"]]
current_state = 0
def generate_dialog(option):
	if option == "b":
		return "Player: Good bye.", "Mr Creative: See you later."
	if option == "x":
		return "Player: X", "Mr Creative: X"
	if option == "y":
		return "Player: Y", "Mr Creative: Y"
	if option == "a":
		return "Player: A", "Mr Creative: A"

def generate_options():
	return options.pop()

def set_game_state(a):
	global current_state
	current_state += 1
	if current_state == 3:
		current_state = 0