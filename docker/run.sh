source dockerenv.sh

docker run \
	--mount "type=bind,src=${FBUILD_DOCKER_MOUNT_FOLDER},dst=/home/${FBUILD_USERNAME}" \
	--runtime=nvidia \
	--gpus all \
	-it \
	${FBUILD_DOCKER_IMAGE_TAG}
