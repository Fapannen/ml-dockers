echo "--------------------------------"
echo "| Welcome to the setup script!  |"
echo "--------------------------------"

DOCKER_SETUP_FILE=docker/dockerenv.sh

config_variable() {
	read -p "Enter the value of $1 that you want to use (default: $2): " VAL
	if [ -z $VAL ]; then
		VAL=$2
	fi
	echo "export $1=$VAL" >> $DOCKER_SETUP_FILE
}

if [ -f $DOCKER_SETUP_FILE ]; then
	echo "Configuration file $DOCKER_SETUP_FILE exists!"
	echo "Make a backup copy if desired and remove it."
	exit 1
fi

echo "Find the version which you want to use on the following page"
echo "https://hub.docker.com/r/nvidia/cuda/tags"

# FBUILD stands for Fapannen Build, dont want these vars to clash with sth
config_variable FBUILD_VERSION 12.6.3
config_variable FBUILD_SYSTEM ubuntu
config_variable FBUILD_SYSTEM_VERSION 22.04
config_variable FBUILD_USERNAME fapannen
config_variable FBUILD_PYTHON_MAJOR_VERSION 3
config_variable FBUILD_PYTHON_MINOR_VERSION 10
config_variable FBUILD_PYTHON_REV_VERSION 0
config_variable FBUILD_DOCKER_IMAGE_TAG base-ml-gpu
config_variable FBUILD_DOCKER_MOUNT_FOLDER /home

sudo apt-get update

# NVIDIA Container Toolkit is necessary to run GPU-enabled dockers.
# Following the instructions from https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

echo "Installing NVIDIA Container Toolkit"

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get install -y nvidia-container-toolkit
