#!/usr/bin/env python

import sys
import os

def handler(msg, cmd):
    print(f'{msg}[Y/n]')
    arg = input().upper()
    if (arg == "Y"):
        os.system(cmd)
    else:
        os.system("exit")
    return


if __name__ == "__main__":
    option = sys.argv[1]

    if (option == "poweroff"):
        handler("Poweroff?", "systemctl poweroff")
    elif (option == "suspend"):
        handler("Suspend?", "systemctl suspend")
