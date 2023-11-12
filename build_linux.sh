FLAGS="-std=c++11   -mavx2"

FLAGS="$FLAGS -O3"

#FLAGS="$FLAGS -g3"

#FLAGS="$FLAGS -g3 -fsanitize=thread"
#FLAGS="$FLAGS -g3 -fsanitize=address"

compiler="clang++"



$compiler code/main.cpp $FLAGS -lSDL2
