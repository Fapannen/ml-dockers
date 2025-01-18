source dockerenv.sh

docker run \
	--runtime=nvidia \
	-it \
	--gpus all \
	${FBUILD_DOCKER_IMAGE_TAG}
