cd "${0%/*}"

if [ `uname` = "Darwin" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/MacOSX/dlgmodule.mm" -o "libdlgmod.dylib" -shared -std=c++17 -ObjC++ -framework AppKit -framework UniformTypeIdentifiers -arch arm64 -arch x86_64 -fPIC
elif [ $(uname) = "Linux" ]; then
  g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -shared -static-libgcc -static-libstdc++ -lX11 -lpthread -fPIC
elif [ $(uname) = "FreeBSD" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -Wno-format-security -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lc -lpthread -fPIC
elif [ $(uname) = "DragonFly" ]; then
  g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -I/usr/local/include -L/usr/local/lib -shared -static-libgcc -static-libstdc++ -lX11 -lkvm -lc -lpthread -fPIC
elif [ $(uname) = "NetBSD" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -Wno-format-security -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lc -lpthread -fPIC
elif [ $(uname) = "OpenBSD" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -Wno-format-security -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lc -lpthread -fPIC
elif [ $(uname) = "SunOS" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/apiprocess/process.cpp" "DlgModule/xlib/xprocess.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -IDlgModule/xlib/ -std=c++17 -Wno-format-security -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lc -lpthread -fPIC
fi
