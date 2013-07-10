#!/usr/bin/env python
import sys
import subprocess


def notify(message, title):
    cmd = "terminal-notifier -message '%s' -title '%s' >> /dev/null 2>&1" % (message, title)
    subprocess.call(cmd, shell=True)


def main(message, title):
    if message.startswith('#'):
        return

    if 'honzakral' in message:
        return

    if 'honza:' in message:
        # Someone talking to me in the room
        # e.g.
        # honza: in room
        who, where = title.split(' ')
        notify(message, '%s in %s' % (who, where))
        return

    elif message.startswith('honza :'):
        # Someone talking to me in a private message
        # e.g.
        # honza :hey man
        who, _ = title.split(' ')
        notify(message, '%s said' % who)
        return

    elif 'honza' in message:
        notify(message, 'honza mentioned')
        return
    else:
        return


if __name__ == '__main__':
    if len(sys.argv) == 3:
        main(sys.argv[1], sys.argv[2])
