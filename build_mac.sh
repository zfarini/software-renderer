FLAGS="-std=c++11 -O3 -mavx2 libSDL2-2.0.0.dylib -Wall -Wextra -Wno-unused-variable -Wno-missing-braces -Wno-missing-field-initializers"

#FLAGS="$FLAGS -fsanitize=address -fsanitize=undefined -g3"

#FLAGS="$FLAGS -fsanitize=thread"

compiler="clang++"

$compiler code/main.cpp  $FLAGS


