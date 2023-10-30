set CommonCompilerFlags= -O3 -std=c++11 -D_CRT_SECURE_NO_WARNINGS -mavx2 SDL2.lib

#clang++ -c %CommonCompilerFlags% stb_load_png.cpp


clang++  stb_load_png.o %CommonCompilerFlags% main.cpp


REM cl -O2 -std=c++11 -D_CRT_SECURE_NO_WARNINGS stb_load_png.cpp -mavx2 SDL2.lib main.cpp