QMK_TREE=~/code/qmk_firmware
TEENSY_BIN=~/code/teensy_loader_cli/teensy_loader_cli 

pushd $QMK_TREE || exit

make ergodox_ez:honza

$TEENSY_BIN -mmcu=atmega32u4 -w ergodox_ez_honza.hex

popd || exit
