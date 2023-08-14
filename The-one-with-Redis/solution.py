import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call
import base64

response = requests.get("https://hackattic.com/challenges/the_redis_one/problem?access_token=99de6f567fe7a695")
json_response = response.json()

rdb = json_response["rdb"]
check_type_of = json_response["requirements"]["check_type_of"]

rdb_b64_bytes = rdb.encode('ascii')
rdb_bytes = base64.b64decode(rdb_b64_bytes)

with open('dump.rdb', 'wb') as out_file:
    out_file.write(rdb_bytes)

print(check_type_of)

# response = requests.post("https://hackattic.com/challenges/tales_of_ssl/solve?access_token=99de6f567fe7a695", json={'certificate': b64crt})
# print(response.content)