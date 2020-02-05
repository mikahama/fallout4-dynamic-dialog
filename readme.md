# How to install

## 1. Configure Fallout
- copy fallout_config\Fallout4Custom.ini to Documents\My Games\Fallout4
- Fallout must run in windowed mode

## 2. Mod
- Copy papyrus\creative_guy.esp to Fallout 4\Data\
- Add Fallout 4\Papyrus Compiler to your PATH variable
- compile the papyrus script in papyrus\creativity.psc with `PapyrusCompiler.exe "creativity.psc" -i="D:\Games\Fallout 4\Data\Scripts\Source\Base" -o="D:\Games\Fallout 4\Data\Scripts" -f="D:\Games\Fallout 4\Data\Scripts\Source\Base\Institute_Papyrus_Flags.flg" -q`
- When you run fallout, go to mods in the main menu and enable creative_guy.esp. Mr Creative will now wait for you in **Diamond City**

## 3. Python
- The python code has been tested with Windows 10 bash
- Make sure that python 2.7 is installed with pip
- run `sudo pip install -r requirements.txt`

## 4. Font
- Download Monofonto (https://www.dafont.com/monofonto.font) and place it in *communicator* folder. Please not the license restrictions.

# How to configure

## 1. Move the overlay app to the correct position
- if you run in full hd, you can mostly skip this part
- press home key to make the window moveable
- use arrow keys to move the window
- press page up to save the window position for dialog
- press page down to save the window position for options
- press home again to stop moving the window

## 2. Game pad
- Run gamepad_buttons.exe to map your gamepad to the Xbox360 gamepad layout

## 3. Code
- Change hard coded paths in *papyrus\compile.sh*
- Modify *dialog_generator\dummy_dialog.py* with your generator code

## 4. Overlay application
- The overlay application has been coded with Clickteam Fusion 2.5. The source code is in the .mfa file.

# How to use
- run `sh start_flask.sh`

# Cite
Mika Hämäläinen and Khalid Alnajjar. 2019. [Creative contextual dialog adaptation in an open world RPG](https://dl.acm.org/doi/10.1145/3337722.3341865). In Proceedings of the 14th International Conference on the Foundations of Digital Games (FDG ’19). Association for Computing Machinery, New York, NY, USA, Article 73, 1–7. DOI:https://doi.org/10.1145/3337722.3341865

Khalid Alnajjar and Mika Hämäläinen. 2019. [A creative dialog generator for fallout 4](https://doi.org/10.1145/3337722.3341824). In Proceedings of the 14th International Conference on the Foundations of Digital Games (FDG ’19). Association for Computing Machinery, New York, NY, USA, Article 48, 1–4. DOI:https://doi.org/10.1145/3337722.3341824

Zenodo https://zenodo.org/record/3232864
