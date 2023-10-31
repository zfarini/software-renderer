FLAGS="-std=c++11 -O3 -mavx2 libSDL2-2.0.0.dylib"

#FLAGS="$FLAGS -fsanitize=address -fsanitize=undefined -g3"

compiler="clang++"
#compiler="/Users/zfarini/goinfre/homebrew/Cellar/gcc/13.2.0/bin/g++-13  "
#
#echo $FLAGS

#random_number=$((1 + $RANDOM % 1000))


#clang++ $FLAGS game.cpp stb_load_png.o -fPIC -shared -o game.so.tmp
#mv game.so.tmp game$random_number.so

#$compiler code/stb_load_png.cpp $FLAGS -c -o stb_load_png_mac.o
$compiler code/main.cpp stb_load_png_mac.o $FLAGS

#clang++ main.cpp -ldl $FLAGS

