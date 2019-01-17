#!/usr/bin/env python
""" basic pre-flight checking for eyewitness, makes sure the passed URL is
    resolvable and will actually pass a basic GET request

    tested in python3
"""


import sys
import socket
from urllib.parse import urlparse

try:
    import requests
except ImportError:
    sys.exit("You'll need the requests library for this.")

DEBUG = 0

url = sys.argv[1]

# is it even a valid url?
urldetails = urlparse(url)
domain = urldetails.netloc
if not domain:
    if DEBUG:
        print("Couldn't parse '{}'".format(url))
    sys.exit(0)

# test it resolves
try:
    socket.gethostbyname(domain)
except socket.gaierror:
    if DEBUG:
        print("Couldn't resolve '{}'".format(domain))
    sys.exit(0)
# try to grab it
try:
    req = requests.get(url)
    if req.status_code == 500:
        if DEBUG:
            print("got a 500")
except:
    sys.exit(0)
sys.exit(1)
