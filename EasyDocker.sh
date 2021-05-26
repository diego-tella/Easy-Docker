#!/bin/bash

banner="
 #######                        ######                                     
 #         ##    ####  #   #    #     #  ####   ####  #    # ###### #####  
 #        #  #  #       # #     #     # #    # #    # #   #  #      #    # 
 #####   #    #  ####    #      #     # #    # #      ####   #####  #    # 
 #       ######      #   #      #     # #    # #      #  #   #      #####  
 #       #    # #    #   #      #     # #    # #    # #   #  #      #   #  
 ####### #    #  ####    #      ######   ####   ####  #    # ###### #    # 
"

echo "$banner"

export DEBIAN_FRONTEND="noninteractive"
sudo apt-get update
 
# remove o docker instalado anteriormente
sudo apt-get remove docker docker-engine docker.io
# instala dependencias
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
# add adiciona a chave gpg 
sudo apt-get -y install curl
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
# instala Docker
sudo apt-get install docker-ce
# roda a imagem Hellow World 
sudo docker run hello-world
# configura Docker como um usuário não-root
sudo groupadd docker
sudo usermod -aG docker $USER
# configura o Docker para iniciar no boot
sudo systemctl start docker
sudo systemctl enable docker
# docker menu de ajuda
sudo docker
