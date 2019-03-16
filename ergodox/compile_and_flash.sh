cd ~/GitHub/qmk_firmware
make ergodox_ez:honza
~/GitHub/teensy_loader_cli/teensy_loader_cli \
    -mmcu=atmega32u4 -w ergodox_ez_honza.hex
cd -
