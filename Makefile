
MAKEFLAGS += --no-print-directory -s

# Variables shared across all files
BASEIMAGE := marias-docker
IMAGE := $(BASEIMAGE):2026-06-08

RUN ?= docker run -it --rm \
	-u $$(id -u):$$(id -g) \
	-e HOME=/home/appuser \
	-e DISPLAY=$$DISPLAY \
	-e RUN= \
	-v$$(pwd):/$(USER) \
	-v /mnt/apprapd007:/mnt/apprapd007 \
	--net=host \
	-w /$(USER) $(IMAGE)

get-inside-docker:
	docker run -it --rm \
	-u $$(id -u):$$(id -g) \
	-e HOME=/home/appuser \
	-e DISPLAY=$$DISPLAY \
	-e RUN= \
	--net=host \
	-w /$(USER) $(IMAGE) \
	bash 

jq-version:
	$(RUN) jq --version

dissolve:
	$(RUN) python3 src/dissolve.py $(shp)

##### DOCKER #####
# Internal Access to the podman container. This is a good method to look around and assess changes
# local-edit: Dockerfile
# 	docker run -it --rm \
# 		-u $$(id -u):$$(id -g) \
# 		-e HOME=/home/appuser \
# 		-e DISPLAY=$$DISPLAY \
# 		-e RUN= \
# 		--env-file ../.credentials/.creds \
# 		-v $$(realpath ../.credentials/.aws):/home/appuser/.aws:ro \
# 		-v $$(realpath ../.credentials/configs):/configs:ro \
# 		-e PYTHONPATH=/$(USER)/src/modules \
# 		-v$$(pwd):/$(USER) \
# 		-v /mnt/scratch:/mnt/scratch \
# 		-v /mnt/muninn03:/mnt/muninn03 \
# 		-v /mnt/prod:/mnt/prod \
# 		-v /mnt/uat:/mnt/uat \
# 		-v /mnt/apprapd006/hug02_ssd:/mnt/apprapd006/hug02_ssd \
# 		--net=host \
# 		-w /$(USER) $(IMAGE)
# 		bash

# Build the Docker container locally	
docker-local: 
	docker build --tag $(BASEIMAGE) - < Dockerfile && \
	docker tag $(BASEIMAGE) $(IMAGE)
