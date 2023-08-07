import requests
import base64
from subprocess import call



response = requests.get("https://hackattic.com/challenges/backup_restore/problem?access_token=99de6f567fe7a695")
json_response = response.json()

pg_dump_base64 = json_response["dump"]
pg_dump_bytes = base64.b64decode(pg_dump_base64)

with open('pg.sql.gz', 'wb') as out_file:
    out_file.write(pg_dump_bytes)

out_file.close()

call(['gunzip', 'pg.sql.gz']) # creates pg.sql

lines = []

with open('pg.sql', 'r') as sql_file:
    for line in sql_file.readlines():
        # print(i, "::", line)
        if line.startswith("\."):
            # print("======")
            break
        lines.append(line)

records = lines[95:]
alive_ssns = []

for record in records:
    r = record.split('\t')
    status = r[-1:][0]
    if status.startswith("alive"):
        alive_ssns.append(r[3])

print(alive_ssns)

response = requests.post("https://hackattic.com/challenges/backup_restore/solve?access_token=99de6f567fe7a695", json={'alive_ssns': alive_ssns})
print(response.content)