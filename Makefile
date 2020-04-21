GLMURL := 'https://github.com/g-truc/glm/archive/0.9.9.8.zip'

GLADLIB := lib/glad.o
all: ${GLADLIB}
	#g++ src/main.cpp -o build/run -lglut -lGLU -lGL -I./include/
	g++ src/main.cpp lib/glad.o -I./include/ -lglfw -lGL -lm -lXrandr -lXi -lX11 -lXxf86vm -lpthread  -ldl -o ./build/run
	build/run
${GLADLIB}: src/glad.c
	g++ -c src/glad.c -I./include/ -o lib/glad.o

glm:
	if [ ! -d ./include/glm/ ]; then \
		wget ${GLMURL} -nc -O /tmp/glm.zip; \
		/bin/echo "n" | unzip -o /tmp/glm.zip -d /tmp/ ; \
		mv /tmp/glm-0.9.9.8/glm/ ./include/glm/; \
	fi

