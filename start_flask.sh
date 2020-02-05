#!/bin/bash
./log_reader_daemon.py &
./overlay_app.exe &
export FLASK_DEBUG=1
flask run