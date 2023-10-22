FLAGS="-std=c++11 -O3 -mavx -ffast-math -Xpreprocessor -fopenmp $HOME/goinfre/homebrew/opt/libomp/lib/libomp.dylib libSDL2-2.0.0.dylib  mlx/libmlx.a -framework OpenGL -framework AppKit" #-fsanitize=address -fsanitize=undefined

clang++ $FLAGS game.cpp -fPIC -shared -o game.so.tmp
mv game.so.tmp game.so

clang++ main.cpp $FLAGS 
