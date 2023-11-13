FLAGS="-std=c++11 -O3 -mavx2 libSDL2-2.0.0.dylib"

#FLAGS="$FLAGS -fsanitize=address -fsanitize=undefined -g3"

compiler="clang++"

$compiler code/main.cpp  $FLAGS


