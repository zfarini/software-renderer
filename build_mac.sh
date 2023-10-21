FLAGS=" -O3 -mavx -ffast-math libSDL2-2.0.0.dylib -Xpreprocessor -fopenmp /Users/zfarini/goinfre/homebrew/opt/libomp/lib/libomp.dylib mlx/libmlx.a -framework OpenGL -framework AppKit" #-fsanitize=address -fsanitize=undefined
clang++ main.cpp  $FLAGS 
#/Users/zfarini/goinfre/homebrew/opt/gcc/bin/gcc-13 minirt.c $FLAGS
