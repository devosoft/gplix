# Flags to use regardless of compiler
CFLAGS_all := -Wall -Wno-unused-function -std=c++14 -I../Empirical/

# Native compiler information
CXX_nat := g++
CFLAGS_nat := -g $(CFLAGS_all)
#CFLAGS_nat := -O3 -DNDEBUG $(CFLAGS_all)

# Emscripten compiler information
CXX_web := emcc
OFLAGS_web := -g4 -pedantic -Wno-dollar-in-identifier-extension -s TOTAL_MEMORY=67108864 # -s DEMANGLE_SUPPORT=1 # -s SAFE_HEAP=1
#OFLAGS_web := -DNDEBUG -s TOTAL_MEMORY=67108864
#OFLAGS_web := -Oz -DNDEBUG -s TOTAL_MEMORY=67108864 -s ASSERTIONS=1
#OFLAGS_web := -Os -DNDEBUG -s TOTAL_MEMORY=67108864


# CFLAGS_web := $(CFLAGS_all) $(OFLAGS_web) --js-library ../Empirical/web/library_emp.js -s EXPORTED_FUNCTIONS="['_main', '_empCppCallback']" -s DISABLE_EXCEPTION_CATCHING=1 -s COMPILER_ASSERTIONS=1 -s NO_EXIT_RUNTIME=1 --embed-file configs
CFLAGS_web := $(CFLAGS_all) $(OFLAGS_web) --js-library ../Empirical/web/library_emp.js -s EXPORTED_FUNCTIONS="['_main', '_empCppCallback']" -s DISABLE_EXCEPTION_CATCHING=1 -s NO_EXIT_RUNTIME=1 --embed-file configs
default: gplix
web: gplix.js
all: gplix gplix.js

gplix:	source/command_line.cc
	$(CXX_nat) $(CFLAGS_nat) source/command_line.cc -o gplix
	@echo To build the web version use: make web

gplix.js: source/gplix.cc
	$(CXX_web) $(CFLAGS_web) source/gplix.cc -o web/gplix.js

clean:
	rm -f gplix web/gplix.js *.js.map *~ source/*.o

# Debugging information
#print-%: ; @echo $*=$($*)
print-%: ; @echo '$(subst ','\'',$*=$($*))'
