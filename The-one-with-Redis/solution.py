import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call, check_output
import base64
import json
from datetime import datetime

def is_ascii(s):
    return all(ord(c) < 128 for c in s)

response = requests.get("https://hackattic.com/challenges/the_redis_one/problem?access_token=99de6f567fe7a695")
json_response = response.json()

rdb = json_response["rdb"]
check_type_of = json_response["requirements"]["check_type_of"]

rdb_b64_bytes = rdb.encode('ascii')
rdb_bytes = base64.b64decode(rdb_b64_bytes)
print(type(rdb_bytes))
array = bytearray(rdb_bytes)
print(type(array))
array[0:5] = bytearray(b"REDIS")

with open('dump.rdb', 'wb') as out_file:
    out_file.write(array)

print(check_type_of)

output = check_output(['rdb', '--command', 'json', 'dump.rdb'])
output = output.replace(b'\n', b'')
output = output.replace(b'\r', b'')
json_str = output.decode('utf-8')
json_db = (json.loads(json_str))

db_count = len(json_db)
print(db_count)


output = check_output(['rdb', '--command', 'memory', 'dump.rdb'])
output = output.decode('utf-8')
output_arr = output.split('\n')[1:]
keys = []
for key in output_arr:
    keys.append(key.split(','))
    print("key--", key)

millisecond_expiry = 0
type_check = ""
emoji_value = ""

keys = keys[:-1]
for key in keys:
    print(key[2])
    if len(key[7])>0:
        print(key[7])
        epoch = datetime.utcfromtimestamp(0)
        utc_expiry = datetime.strptime(key[7], "%Y-%m-%dT%H:%M:%S.%f")
        print(utc_expiry)
        millisecond_expiry = (int)((utc_expiry - epoch).total_seconds() * 1000)
        print(millisecond_expiry)
    if key[2]==check_type_of:
        type_check = key[1]


output = check_output(['rdb', '--command', 'justkeyvals', 'dump.rdb'])
output = output.decode('utf-8')
output_arr = output.split('\n')[1:]
keys = []
for key in output_arr:
    keys.append(key.split(','))
    print("key--", key)
for key in output_arr:
    s = key.split(' ')
    if(is_ascii(s[0])):
        print("ascii")
    else:
        s[1] = s[1].strip()
        emoji_value = s[1].replace(',', '')
        print(emoji_value)

jobject = {'db_count': db_count, 'emoji_key_value': emoji_value, 'expiry_millis': millisecond_expiry, check_type_of: type_check}
print(jobject)
response = requests.post("https://hackattic.com/challenges/the_redis_one/solve?access_token=99de6f567fe7a695", json={'db_count': db_count, 'emoji_key_value': emoji_value, 'expiry_millis': millisecond_expiry, check_type_of: type_check})
print(response.content)