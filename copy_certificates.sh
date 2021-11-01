#!/bin/bash

CERT_UTIL="/usr/share/elasticsearch/bin/elasticsearch-certutil"
CA_PATH="/usr/share/elasticsearch/elastic-stack-ca.p12"
gen() {
  sudo docker exec -it es01 bash -c "printf \"\\n\" | ${CERT_UTIL} ca --pass ''"
  sudo docker exec -it es01 bash -c "printf \"\\n\" | ${CERT_UTIL} cert --ca ${CA_PATH} --ca-pass '' --pass ''" 
}

copy() {
  echo "Copying certificates"
  sudo docker cp es01:/usr/share/elasticsearch/elastic-stack-ca.p12 elastic-stack-ca.p12
  sudo docker cp es01:/usr/share/elasticsearch/elastic-certificates.p12 elastic-certificates.p12
} 

changeperms() {
	sudo chmod 666 elastic-certificates.p12
	sudo chmod 666 elastic-stack-ca.p12
	sudo chmod -R 777 docker-data-volumes
}

create_data_dirs(){
  mkdir docker-data-volumes
  mkdir docker-data-volumes/elasticsearch
}

gen
copy
create_data_dirs
changeperms
