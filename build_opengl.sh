DIR="$HOME/goinfre/homebrew/opt"

FLAGS=" -lglew -lglfw -L$DIR/glfw/lib -I$DIR/glfw/include -I$DIR/glew/include -L$DIR/glew/lib"
clang++ opengl_ref.cpp $FLAGS -framework OpenGL -o gl
