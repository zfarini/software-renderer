FLAGS="-std=c++11 -O3  -mavx2"

#FLAGS="-std=c++11 -g3 -mavx2"


compiler="clang++"



$compiler code/main.cpp $FLAGS -lSDL2
