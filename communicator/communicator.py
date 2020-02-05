from .image_maker import options_image, dialog_image
import requests

def say(player_dialog, npc_dialog):
	dialog_image(player_dialog, True)
	dialog_image(npc_dialog, False)
	requests.get("http://localhost:9854", {"hide":"2"})

def show_options(x,y,b,a):
	options_image(x,y,b,a)
	requests.get("http://localhost:9854", {"hide":"0"})