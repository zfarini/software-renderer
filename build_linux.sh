FLAGS="-std=c++11 -O3  -mavx2"

#FLAGS="-std=c++11 -g3 -mavx2"


compiler="clang++"


#$compiler code/stb_load_png.cpp $FLAGS -c -o stb_load_png_linux.o

$compiler code/main.cpp $FLAGS stb_load_png_linux.o -lSDL2
