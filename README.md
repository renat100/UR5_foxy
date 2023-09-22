# Per fare tutto (build del compose: build dell'immagine se non c'è già, instanzia containers se mancano e li avvia, fa anche l'attach ai servizi dei container solo dello stdo aprendo terminale dove va il log) digitare nel terminale sulla root della repo il seguente comando (nella cartella dove c'è compose.yml)
# NOTA: Se è necessario forzare la build dell'immagine (x modifiche) aggiungere il parametro --build

docker compose up

# Per visualizzare tutti i container istanziati in ogni stato (attivo/sospeso)
docker ps -a

# Per aprire una shell verso il container già in stato di run:
# attach (al servizio in esecuzione sul container, interfaccia in/out al servizio) vs bash (apro bash sul container) -> attach vs console su Portainer 
# noto il nome del container (in questo caso il nome è sempre "ros_app"), comando
docker exec -it ros_app bash



# ROS

# X COMPILARE SENZA ERRORI DRIVER UR
# Scaricare pacchetti ros x gestire dipendenze
# 1 Per permettere di installare pacchetti ros anche di distro eol
rosdep update --include-eol-distros
sudo apt-get update
# 2 Gestione dipendenze 
rosdep install --ignore-src --from-paths src -y -r --rosdistro foxy
# 3 Compilazione con parametri
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
# Source
source install/setup.bash


ros2 launch ur_bringup ur_control.launch.py ur_type:=ur5 robot_ip:=192.168.12.65 use_fake_hardware:=true launch_rviz:=true

