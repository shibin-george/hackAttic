sudo docker stop registry && sudo docker rm registry

username="floral-mountain@hackattic.com"
passwd="YAI7WHMZL3"
trigger_token="5b37999a.d571.4eff.aacf.de29902693ac"
ignition_key="9GOVC4GE9GMD7PZJX4G50CNRJOQ3"

sudo docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn $username $passwd > auth/htpasswd

curl -X POST https://hackattic.com/_/push/$trigger_token -d '{"registry_host": "docker.shibing.trafficmanager.net"}'

# get certs from LetsEncrypt using 
# sudo certbot certonly --standalone
# and store in /certs/fullchain.pem, /certs/privkey.pem

sudo docker run -d   \
  --restart=always   \
  --name registry   \
  -v "$(pwd)"/certs:/certs   \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443   \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/fullchain.pem   \
  -e REGISTRY_HTTP_TLS_KEY=/certs/privkey.pem   \
  -p 443:443   \
  -v "$(pwd)"/auth:/auth \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd   \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  registry:2

curl -X POST https://hackattic.com/_/push/$trigger_token -d '{"registry_host": "docker.shibing.trafficmanager.net"}'

curl -X GET https://docker.shibing.trafficmanager.net/v2/_catalog -v -u $username:$passwd
curl -X GET https://docker.shibing.trafficmanager.net/v2/hack/tags/list -v -u $username:$passwd

v1="0.32.193"
v2="1.14.636"

echo "docker login docker.shibing.trafficmanager.net -u=\"$username\" -p=$passwd"
echo "docker pull docker.shibing.trafficmanager.net/hack:$v1"
echo "docker pull docker.shibing.trafficmanager.net/hack:$v2"

echo "docker run -it --rm  -e IGNITION_KEY=$ignition_key docker.shibing.trafficmanager.net/hack:$v1"
echo "docker run -it --rm  -e IGNITION_KEY=$ignition_key docker.shibing.trafficmanager.net/hack:$v2"

curl -X POST https://hackattic.com/challenges/dockerized_solutions/solve?access_token=99de6f567fe7a695 -d '{"secret": "KBlhVT1lAXQhBD8/aUdtNzY/GnYfIAsofDBYJg=="}'