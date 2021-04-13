cd "${0%/*}"

mkdir "DlgModule (x86)"
mkdir "DlgModule (x86)/FreeBSD"
clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "DlgModule (x86)/FreeBSD/libdlgmod.so" -std=c++17 -I/usr/local/include -L/usr/local/lib -shared -lX11 -lprocstat -lutil -lc -lpthread -fPIC -m32
