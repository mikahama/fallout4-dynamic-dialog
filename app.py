from flask import Flask, request
#from dialog_generator import dialog
from dialog_generator import dummy_dialog as dialog
from communicator import communicator
app = Flask(__name__)

@app.route("/startDialog", methods = ['POST'])
def start_dialog():
	"""
	Papyrus sends data with json mimetype with information about the game world when dialog starts
	-> options for dialog are generated for the player to pick from
	-> options are saved as an image and the overlay application is requested to show them
	"""
	game_data = request.get_json()
	dialog.set_game_state(game_data)
	return new_options()

@app.route("/newOptions")
def new_options():
	"""
	Is called after the player - npc dialog has been shown
	The overlay app sends a request to this URL
	"""
	x, y, a = dialog.generate_options()
	b = "bye!"
	communicator.show_options(x,y,b,a)
	return "ok"


@app.route("/generateDialog")
def generate_dialog():
	"""
	The overlay app sends the user selected option (x, y, a or b) by get
	"""
	option = request.args.get('option')
	player, npc = dialog.generate_dialog(option)
	communicator.say(player, npc)
	return "ok"
