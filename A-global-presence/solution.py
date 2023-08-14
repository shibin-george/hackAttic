import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call
from fp.fp import FreeProxy

def make_proxy_req(url, country_code=''):
    try:
        proxy = FreeProxy(elite=True, timeout=3, rand=True, https=False).get()
        https_proxy = proxy.replace("http://", "https://")
        proxies = {
            'http': proxy,
            # 'https': https_proxy,
        }
        print("Trying ", proxy, " for ", country_code)
        response = requests.get(url, proxies=proxies, timeout=5)
        print(response.content)
        countries = str(response.content).split(',')
        print(len(countries))
        if len(countries) == 7:
            return False
        else:
            return True
    except Exception as e:
        print("No go due to: ", e)
        return True

response = requests.get("https://hackattic.com/challenges/a_global_presence/problem?access_token=99de6f567fe7a695")
json_response = response.json()

presence_token = json_response['presence_token']

print("https://hackattic.com/_/presence/" + presence_token)

###### Use https://www.geopeeker.com/ to send requests

import time

print("Before the sleep statement")
time.sleep(25)
print("After the sleep statement")

response = requests.post("https://hackattic.com/challenges/a_global_presence/solve?access_token=99de6f567fe7a695", json={})
print(response.content)
