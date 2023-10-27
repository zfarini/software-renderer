FLAGS="-std=c++11 -O3  -mavx libSDL2-2.0.0.dylib"

#compiler="/Users/zfarini/goinfre/homebrew/Cellar/gcc/13.2.0/bin/g++-13  -fno-gnu-unique "
compiler="clang++"
#
#echo $FLAGS

random_number=$((1 + $RANDOM % 1000))


clang++ $FLAGS game.cpp stb_load_png.o -fPIC -shared -o game.so.tmp
mv game.so.tmp game$random_number.so

$compiler main.cpp $FLAGS

#clang++ main.cpp -ldl $FLAGS

