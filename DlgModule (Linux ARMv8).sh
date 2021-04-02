cd "${0%/*}"

mkdir "DlgModule (ARMv8)"
mkdir "DlgModule (ARMv8)/Linux"
g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "DlgModule (ARMv8)/Linux/libdlgmod.so" -std=c++17 -shared -static-libgcc -static-libstdc++ -lX11 -lprocps -lpthread -fPIC
