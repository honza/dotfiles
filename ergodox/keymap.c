/*
 *  ergodox ez keymap
 *  Copyright (C) 2019-2021, Honza Pokorny <me@honza.ca>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

// This is the default dvorak layout file
// I expect to customize this heavily.

#include QMK_KEYBOARD_H

enum custom_keycodes {
  IF_ERR_NIL = EZ_SAFE_RANGE,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Keymap 0: Basic layer
 *
 * ,--------------------------------------------------.           ,--------------------------------------------------.
 * | Tab    |   '  |   ,  |   .  |   P  |   Y  |      |           |      |   F  |   G  |   C  |   R  |   L  |  bkspc |
 * |--------+------+------+------+------+-------------|           |------+------+------+------+------+------+--------|
 * |ctrl/esc|   A  |   O  |   E  |   U  |   I  |  if  |           |  L1  |   D  |   H  |   T  |   N  |   S  |   -    |
 * |--------+------+------+------+------+------|  err |           |      |------+------+------+------+------+--------|
 * | LS + ( |   :  |   Q  |   J  |   K  |   X  |------|           |------|   B  |   M  |   W  |   V  |   Z  | RS + ) |
 * |--------+------+------+------+------+------| Hyper|           | Meh  |------+------+------+------+------+--------|
 * |        |      |      |      | LGUI |  L1  |      |           |      |   L2 |  Alt |      |      |      |        |
 * `--------+------+------+------+------+-------------'           `-------------+------+------+------+------+--------'
 *   |      |      |      |      |      |                                       |      |      |      |      |      |
 *   `----------------------------------'                                       `----------------------------------'
 *                                        ,-------------.       ,---------------.
 *                                        |      |      |       |      |        |
 *                                 ,------|------|------|       |------+--------+------.
 *                                 |      |      |      |       |      |        |      |
 *                                 | Space|      |------|       |------|        |Enter |
 *                                 |      |      |      |       |      |        |      |
 *                                 `--------------------'       `----------------------'
 */
// If it accepts an argument (i.e, is a function), it doesn't need KC_.
// Otherwise, it needs KC_*
[0] = LAYOUT_ergodox(  // layer 0 : default
        // left hand
        KC_TAB,         KC_QUOT, KC_COMM, KC_DOT,  KC_P,    KC_Y,  KC_TRNS,
        LCTL_T(KC_ESC), KC_A,    KC_O,    KC_E,    KC_U,    KC_I,  IF_ERR_NIL,
        KC_LSPO,        KC_SCLN, KC_Q,    KC_J,    KC_K,    KC_X,
        KC_TRNS,        KC_TRNS, KC_TRNS, KC_TRNS, KC_LGUI, MO(1), ALL_T(KC_NO),
        KC_TRNS,        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
                                                      KC_TRNS, KC_TRNS,
                                                               KC_TRNS,
                                                KC_SPC,KC_TRNS,KC_TRNS,
        // right hand
             KC_TRNS,     KC_F,  KC_G,    KC_C,    KC_R,    KC_L,    KC_BSPC,
             TG(1),       KC_D,  KC_H,    KC_T,    KC_N,    KC_S,    KC_MINS,
                          KC_B,  KC_M,    KC_W,    KC_V,    KC_Z,    KC_RSPC,
             MEH_T(KC_NO),MO(2), KC_RALT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
                                 KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
             KC_TRNS, KC_TRNS,
             KC_TRNS,
             KC_TRNS, KC_TRNS, KC_ENT
    ),
/* Keymap 1: Symbol Layer
 *
 * ,--------------------------------------------------.           ,--------------------------------------------------.
 * |        |   !  |   @  |   {  |   }  |   |  |      |           |      |      |   7  |   8  |   9  |   *  |        |
 * |--------+------+------+------+------+-------------|           |      |------+------+------+------+------+--------|
 * |        |   #  |   $  |   [  |   ]  |   `  |      |           |------|      |   4  |   5  |   6  |   +  |        |
 * |--------+------+------+------+------+------|      |           |      |------+------+------+------+------+--------|
 * |        |   %  |   ^  |   ?  |   /  |   ~  |      |           |      |   &  |   1  |   2  |   3  |   \  |        |
 * `--------+------+------+------+------+-------------'           `-------------+------+------+------+------+--------'
 * |        |      |      |      |      |      |      |           |      |      |      |    . |      |   =  |        |
 * |--------+------+------+------+------+-------------|           |------+------+------+------+------+------+--------|
 *   |      |      |      |      |      |                                       |      |      |      |      |      |
 *   `----------------------------------'                                       `----------------------------------'
 *                                        ,-------------.       ,-------------.
 *                                        |      |      |       |      |      |
 *                                 ,------|------|------|       |------+------+------.
 *                                 |      |      |      |       |      |      |      |
 *                                 |      |      |------|       |------|      |      |
 *                                 |      |      |      |       |      |      |      |
 *                                 `--------------------'       `--------------------'
 */
// SYMBOLS
[1] = LAYOUT_ergodox(
       // left hand
       KC_TRNS, KC_EXLM, KC_AT,   KC_LCBR, KC_RCBR,  KC_PIPE, KC_TRNS,
       KC_TRNS, KC_HASH, KC_DLR,  KC_LBRC, KC_RBRC,  KC_GRV,  KC_TRNS,
       KC_TRNS, KC_PERC, KC_CIRC, KC_QUES, KC_SLASH, KC_TILD,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,  KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
                                       KC_TRNS,KC_TRNS,
                                               KC_TRNS,
                               KC_TRNS,KC_TRNS,KC_TRNS,
       // right hand
       KC_TRNS, KC_TRNS, KC_7,    KC_8,    KC_9,    KC_ASTR, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_4,    KC_5,    KC_6,    KC_PLUS, KC_TRNS,
                KC_AMPR, KC_1,    KC_2,    KC_3,    KC_BSLS, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_DOT,  KC_0,    KC_EQL,  KC_TRNS,
                KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS,
       KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS
),
/* Keymap 2: Media and mouse keys
 *
 * ,--------------------------------------------------.           ,--------------------------------------------------.
 * |        |      |      |      |      |      |      |           |      |      |      |  up  |      |      |        |
 * |--------+------+------+------+------+-------------|           |------+------+------+------+------+------+--------|
 * |        |      |      | MsUp |      |      |      |           |      |      | left | down | right|      |        |
 * |--------+------+------+------+------+------|      |           |      |------+------+------+------+------+--------|
 * |        |      |MsLeft|MsDown|MsRght|      |------|           |------|      |      |      |      |      |  Play  |
 * |--------+------+------+------+------+------|      |           |      |------+------+------+------+------+--------|
 * |        |      |      |      |      |      |      |           |      |      |      | Prev | Next |      |        |
 * `--------+------+------+------+------+-------------'           `-------------+------+------+------+------+--------'
 *   |      |      |      | Lclk | Rclk |                                       |VolUp |VolDn | Mute |      |      |
 *   `----------------------------------'                                       `----------------------------------'
 *                                        ,-------------.       ,-------------.
 *                                        |      |      |       |      |      |
 *                                 ,------|------|------|       |------+------+------.
 *                                 |      |      |      |       |      |      |Brwser|
 *                                 |      |      |------|       |------|      |Back  |
 *                                 |      |      |      |       |      |      |      |
 *                                 `--------------------'       `--------------------'
 */
// MEDIA AND MOUSE
[2] = LAYOUT_ergodox(
       KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_MS_U, KC_TRNS, KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_MS_L, KC_MS_D, KC_MS_R, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS, KC_TRNS, KC_BTN1, KC_BTN2,
                                           KC_TRNS, KC_TRNS,
                                                    KC_TRNS,
                                  KC_TRNS, KC_TRNS, KC_TRNS,
    // right hand
       KC_TRNS,  KC_TRNS, KC_TRNS, KC_UP,   KC_TRNS, KC_TRNS, KC_TRNS,
       KC_TRNS,  KC_TRNS, KC_LEFT, KC_DOWN, KC_RGHT, KC_TRNS, KC_TRNS,
                 KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_MPLY,
       KC_TRNS,  KC_TRNS, KC_TRNS, KC_MPRV, KC_MNXT, KC_TRNS, KC_TRNS,
                          KC_VOLU, KC_VOLD, KC_MUTE, KC_TRNS, KC_TRNS,
       KC_TRNS, KC_TRNS,
       KC_TRNS,
       KC_TRNS, KC_TRNS, KC_WBAK
),
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case IF_ERR_NIL:
            if (record->event.pressed) {
                SEND_STRING("if err != nil {\n\t\n}");
            }
            return false;
    }
    return true;
}
