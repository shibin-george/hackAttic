import requests
import shutil
from OpenSSL import crypto
import base64
import time

response = requests.get("https://hackattic.com/challenges/serving_dns/problem?access_token=99de6f567fe7a695")
json_response = response.json()

records = json_response["records"]
for record in records:
  print("[[zones]]")

  if record['type']=='TXT':
    print("host = '" + record['name'][2:] + "'")
    print("type = 'SOA'")
    # print("answer = 'http://www.rfc-editor.org/rfc/rfc1118.txt'")
  else:
    print("host = '" + record['name'] + "'")
    print("type = '" + record['type'] + "'")

  print("answer = '" + record['data'] + "'")

  print()

time.sleep(20)
response = requests.post("https://hackattic.com/challenges/serving_dns/solve?access_token=99de6f567fe7a695", json={'dns_ip': '52.234.159.141', 'dns_port': '5053'})
print(response.content)
