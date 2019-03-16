Place `keymap.c` file into:

    qmk_firmware/layouts/community/ergodox/dvorak/

And compile with:

    $ cd qmk_firmware
    $ make ergodox_ez:dvorak

This results in the `ergodox_ez_dvorak.hex` file.  Flash this to your keyboard.

    $ teensy_loader_cli -mmcu=atmega32u4 -w ergodox_ez_dvorak.hex
