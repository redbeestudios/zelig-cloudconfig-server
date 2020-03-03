#!/bin/bash
docker-compose up -d
echo "Iniciando git-server-one (no seas impaciente)"
sleep 5s
docker exec git-server-one create_user cosmefulanito 1234
docker exec git-server-one create_project cosmefulanito cloud-config-tmp
echo "La pass del user cosmefulanito es 1234"
git clone ssh://cosmefulanito@127.0.0.1:2022/git_codes/cosmefulanito/cloud-config-tmp.git /tmp/cloud-config-tmp
echo "Copiando archivos de https://repo.tools.rfsc.cl/scm/ofe/ofertador-cloud-config.git al repo local"
echo "Tranquilo, esta todo controlado ;)"
git clone https://repo.tools.rfsc.cl/scm/ofe/ofertador-cloud-config.git /tmp/cc-bb-tmp
mv /tmp/cc-bb-tmp/*.yml /tmp/cloud-config-tmp/
echo "Copia al repo del docker terminada."
rm -rf /tmp/cc-bb-tmp
cd /tmp/cloud-config-tmp/
git add .
git commit -am "init-commit"
echo "La pass del user cosmefulanito es 1234"
git push origin master
echo "Los archivos se encuentran en /tmp/cloud-config-tmp de tu maquina"
echo "Good Luck."
