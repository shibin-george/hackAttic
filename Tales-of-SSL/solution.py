import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call


response = requests.get("https://hackattic.com/challenges/tales_of_ssl/problem?access_token=99de6f567fe7a695")
json_response = response.json()

private_key = json_response["private_key"]
domain = json_response["required_data"]["domain"]
serial_number = json_response["required_data"]["serial_number"]
country = json_response["required_data"]["country"]
country_code = country[:2].upper()

private_key_decoded = base64.b64decode(private_key)

with open('private_key', 'w') as out_file:
    out_file.write("-----BEGIN RSA PRIVATE KEY-----\n")
    i = 0
    for c in private_key:
        out_file.write(c)
        i += 1
        if i == 64:
            i = 0
            out_file.write('\n')
    out_file.write("\n-----END RSA PRIVATE KEY-----")

decrypted = call(['openssl', 'req', '-key', 'private_key', '-inform', 'PEM', '-new', '-x509', '-out', 'crt.crt', '-set_serial', serial_number, '-subj', '/C={country}/CN={domain}'.format(country = country_code, domain = domain)])
der = call(['openssl', 'x509', '-in', 'crt.crt', '-outform', 'DER', '-out', 'cert.der'])
der_base64 = call(['openssl', 'x509', '-inform', 'der', '-in', 'cert.der', '-out', 'cert3.cer'])

with open('cert3.cer', 'r') as cfile:
    b64crt = cfile.read()
    b64crt = b64crt.replace("-----BEGIN CERTIFICATE-----\n", '')
    b64crt = b64crt.replace("-----END CERTIFICATE-----\n", '')
    b64crt = b64crt.replace('\n', '')
    print(b64crt)

response = requests.post("https://hackattic.com/challenges/tales_of_ssl/solve?access_token=99de6f567fe7a695", json={'certificate': b64crt})
print(response.content)