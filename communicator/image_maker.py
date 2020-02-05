from PIL import Image, ImageDraw, ImageFont, ImageChops
import os

font_path = os.path.dirname(os.path.realpath(__file__)) + '/monofonto.ttf'
background_color = (0,0,0,0)

def options_image(x,y,b,a):
	margin = 8
	buttons_w = 121
	button_size = 68
	letter_size = 15
	excess = 64
	w = len(x)*letter_size+margin*2+buttons_w+len(b)*letter_size+excess
	img = Image.new('RGBA', ( w, 118), color = background_color)
	font = ImageFont.truetype(font_path, 23)
	 
	d = ImageDraw.Draw(img)
	_draw_text(excess,48,x, font, d)
	_draw_text(w - len(b)*letter_size - margin * 2 - buttons_w / 2 - button_size / 2 -len(y)*letter_size,6,y, font, d)
	_draw_text(len(x)*letter_size+margin*2+buttons_w+excess,48,b, font, d)
	_draw_text(len(x)*letter_size+excess+margin*2 + buttons_w/2 + button_size/2,118-9-23,a, font, d)
	
	img = _trim(img)
	img.save('options_text.png')

def _draw_text(x,y,text, font, d,fill=(14,188,16)):
	text = text.upper()
	d.text((x+2,y+1), text ,font=font, fill=(0,0,1))
	d.text((x,y), text ,font=font, fill=fill)

def _trim(im):
    bg = Image.new(im.mode, im.size, im.getpixel((0,0)))
    diff = ImageChops.difference(im, bg)
    diff = ImageChops.add(diff, diff, 2.0, -100)
    bbox = diff.getbbox()
    if bbox:
        return im.crop(bbox)

def dialog_image(text, player=True):
	img = Image.new('RGBA', ( 1000, 100), color = background_color)
	d = ImageDraw.Draw(img)
	font = ImageFont.truetype(font_path, 23)
	_draw_text(10,10,text, font,d,(254,254,254))
	img = _trim(img)
	#d = ImageDraw.Draw(img)
	#d.Draw.point((0,0), fill=background_color)
	if player:
		img.save('dialog_text.png')
	else:
		img.save('npc_dialog_text.png')


if __name__ == '__main__':
	options_image("Why are you here?", "Kill enemy", "The quest was to die for", "other")
	dialog_image("Something meaningful to say")