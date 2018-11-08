#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import subprocess
import sys


def get_memory():

    try:
        import psutil
        val = psutil.virtual_memory().percent
        if val > 80:
            color = '#FF0000'
        else:
            color = '#FFFFFF'
        text = "MEM: {0}%".format(val)
    except ImportError:
        text = "Failed to load psutil"
        color = '#FF0000'

    return {
        'full_text': str(text),
        'name': 'vpn',
        'color': color,
    }


def get_vpn():
    try:
        host = subprocess.check_output(["host", "mail.corp.redhat.com"])
        vpn_connected = 'has address' in host
    except:
        vpn_connected = False
    return {
        'full_text': "VPN",
        'name': 'vpn',
        'color': '#00FF00' if vpn_connected else '#FF0000',
    }


def get_battery():
    battery_path = '/sys/class/power_supply/BAT0/uevent'
    battery_level = 0
    battery_status = ''
    battery_critical = False

    f = open(battery_path)
    battery_data = f.readlines()
    f.close()

    for line in battery_data:
        label, value = line.split('=')
        value = value.replace('\n', '')

        if label == 'POWER_SUPPLY_CAPACITY':
            battery_level = int(value)

        if label == 'POWER_SUPPLY_STATUS':
            battery_status = value

    if battery_level < 15:
        battery_critical = True

    if battery_status == 'Discharging':
        battery_status = '(bat)'
    else:
        battery_status = '(ac)'

    text = 'B: {}% {}'.format(battery_level, battery_status)

    return {
        'full_text': text,
        'name': 'bat',
        'color': '#FF0000' if battery_critical else '#FFFFFF',
    }


def print_line(message):
    sys.stdout.write(message + '\n')
    sys.stdout.flush()


def read_line():
    try:
        line = sys.stdin.readline().strip()
        if not line:
            sys.exit(3)
        return line
    except KeyboardInterrupt:
        sys.exit()


def main():
    # The first line is just a Header, with the version
    print_line(read_line())

    # Then the second line is just "[" as it starts the infinate array. wat
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)

        j.insert(6, get_memory())
        j.insert(0, get_vpn())
        j.insert(6, get_battery())

        print_line(prefix+json.dumps(j))


if __name__ == '__main__':
    main()
