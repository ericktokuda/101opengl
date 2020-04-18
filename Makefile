GLMURL := 'https://github.com/g-truc/glm/archive/0.9.9.8.zip'
all:
	g++ src/main.cpp -o build/run -lglut -lGLU -lGL -I./include/
	build/run
glm:
	if [ ! -d ./include/glm/ ]; then \
		wget ${GLMURL} -nc -O /tmp/glm.zip; \
		/bin/echo "n" | unzip -o /tmp/glm.zip -d /tmp/ ; \
		mv /tmp/glm-0.9.9.8/glm/ ./include/glm/; \
	fi

