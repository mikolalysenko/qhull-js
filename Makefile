QHULL_PATH = ./src/libqhull
TARGET = qhull.js
EMCC = ../emscripten/emcc
PREJS = ./src/pre.js
POSTJS = ./src/post.js
MAIN = ./src/main.c
EXPORTJS = "['_run_qhull']"
CFLAGS =

SOURCES := $(shell find $(QHULL_PATH) -type f -name '*.c')

all: $(TARGET)
	@echo  "Done"

$(TARGET): $(SOURCES) $(PREJS) $(POSTJS) $(MAIN)
	$(EMCC) $(CFLAGS) $(SOURCES) $(MAIN) -s EXPORTED_FUNCTIONS=$(EXPORTJS) --pre-js $(PREJS) --post-js $(POSTJS) -o $(TARGET)

clean:
	rm -rf $(TARGET)

