all: amd64 arm64 ppc ppc64

amd64:
	arch=amd64 ./build.sh

arm64:
	arch=arm64 ./build.sh

ppc:
	arch=ppc ./build.sh

ppc64:
	arch=ppc64 ./build.sh

multi:
	docker manifest create paleozogt/adelie \
		paleozogt/adelie:amd64 \
		paleozogt/adelie:arm64 \
		paleozogt/adelie:ppc \
		paleozogt/adelie:ppc64
