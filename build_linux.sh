FLAGS="-std=c++11   -mavx2"

FLAGS="$FLAGS -O3"

#FLAGS="$FLAGS -g3"

compiler="clang++"



$compiler code/main.cpp $FLAGS -lSDL2
