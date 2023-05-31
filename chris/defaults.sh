COMPUTER_NAME="Neo"
LANGUAGES=(en nl)
LOCALE="en_US@currency=EUR"
MEASUREMENT_UNITS="Centimeters"
SCREENSHOTS_FOLDER="${HOME}/Screenshots"

# Topics
#
# - Computer & Host name
# - Localization
# - System
# - Keyboard & Input
# - Trackpad, mouse, Bluetooth accessories
# - Screen
# - Finder
# - Dock
# - Mail
# - Calendar
# - Terminal
# - Activity Monitor
# - Software Updates

osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
