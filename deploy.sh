#!/bin/bash

set -e

# gdot is the Godot CLI/binary
# More info: https://docs.godotengine.org/en/latest/tutorials/editor/command_line_tutorial.html

/Applications/Godot.app/Contents/MacOS/Godot --headless --export-release Web ./export/index.html

butler push export/. joltsmith/intern-from-hell:html
