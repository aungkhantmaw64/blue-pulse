DOCKER_IMG_NAME=blue-pulse-ci
PROJECT_VERSION=$(shell cat VERSION)

build-docker-image:
	docker build --progress tty -t ${DOCKER_IMG_NAME}:${PROJECT_VERSION} .

run-docker-container:
	docker container run --rm -it -v ${PWD}:/app -w /app ${DOCKER_IMG_NAME}:${PROJECT_VERSION} bash
