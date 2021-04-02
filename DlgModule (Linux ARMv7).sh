cd "${0%/*}"

mkdir "DlgModule (ARMv7)"
mkdir "DlgModule (ARMv7)/Linux"
g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "DlgModule (ARMv7)/Linux/libdlgmod.so" -std=c++17 -shared -static-libgcc -static-libstdc++ -lX11 -lprocps -lpthread -fPIC
