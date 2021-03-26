cd "${0%/*}"

mkdir "DlgModule (x64)"
mkdir "DlgModule (x64)/Darwin"
export SDKROOT=`xcrun --show-sdk-path`
/opt/local/bin/g++-mp-* "DlgModule/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng/lodepng.cpp" -o "DlgModule (x64)/Darwin/libdlgmod.dylib" -std=c++17 -shared  -static-libgcc -static-libstdc++ -I/opt/X11/include -L/opt/X11/lib -lX11 -fPIC -m64
