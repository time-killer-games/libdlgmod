cd "${0%/*}"

mkdir "DlgModule (x64)"
mkdir "DlgModule (x64)/DragonFlyBSD"
g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "DlgModule (x64)/DragonFlyBSD/libdlgmod.so" -std=c++17 -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lutil -lc -lpthread -fPIC -m32
