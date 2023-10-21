FLAGS=" -O3 mlx/libmlx.a -framework OpenGL -framework AppKit" #-fsanitize=address -fsanitize=undefined
clang main.c $FLAGS 
#/Users/zfarini/goinfre/homebrew/opt/gcc/bin/gcc-13 minirt.c $FLAGS
