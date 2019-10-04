#/bin/bash

install(){
    echo "Installing nvidia-docker :)"
    # gets the OS distribution and version 
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

    # Gets the keys
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

    # Add the nvidia-docker repo from the github repo to your local repos
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

    # Install it 
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit

    # Restart docker
    sudo systemctl restart docker
}

validate_install(){
    echo "****** Validating your installation ******"
    docker run --gpus all nvidia/cuda:9.0-base nvidia-smi
}

install
validate_install