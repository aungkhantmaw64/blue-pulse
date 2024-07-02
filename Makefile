DOCKER_IMG_NAME=blue-pulse-ci
PROJECT_VERSION=$(shell cat VERSION)

build-docker-image:
	docker build -t ${DOCKER_IMG_NAME}:${PROJECT_VERSION} .

run-docker-container:
	docker container run ${CONTAINER_EXTRA_ARGS} --rm -v ${PWD}:/app -w /app ${DOCKER_IMG_NAME}:${PROJECT_VERSION} ${CMD}

run-ci: 
	CMD="bptool.py build --clean unit-tests static-analysis" make run-docker-container
