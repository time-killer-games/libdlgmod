cd "${0%/*}"

if [ `uname` = "Darwin" ]; then
  clang++ "/opt/local/lib/libSDL2.a" "/opt/local/lib/libiconv.a" "filedialogs.cpp" "modifywindow.mm" "DlgModule/Universal/dlgmodule.cpp" "DlgModule/MacOSX/dlgmodule.mm" "DlgModule/MacOSX/config.cpp" "lib/ImGuiFileDialog/ImGuiFileDialog.cpp" "imgui.cpp" "imgui_impl_sdl.cpp" "imgui_impl_opengl3.cpp" "imgui_draw.cpp" "imgui_tables.cpp" "imgui_widgets.cpp" -o "libdlgmod.dylib" -shared -std=c++17 -I. -DIMGUI_USE_WCHAR32 -DUSE_STD_FILESYSTEM -I/opt/local/include -std=c++17 -ObjC++ -framework OpenGL -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-weak_framework,CoreHaptics -Wl,-weak_framework,GameController -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,CoreVideo -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-weak_framework,QuartzCore -Wl,-weak_framework,Metal -fPIC -arch arm64 -arch x86_64 -fPIC
elif [ $(uname) = "Linux" ]; then
  g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -std=c++17 -shared -static-libgcc -static-libstdc++ -lX11 -lprocps -lpthread -fPIC
elif [ $(uname) = "FreeBSD" ]; then
  clang++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -std=c++17 -I/usr/local/include -L/usr/local/lib -shared -lX11 -lprocstat -lutil -lc -lpthread -fPIC
elif [ $(uname) = "DragonFly" ]; then
g++ "DlgModule/Universal/dlgmodule.cpp" "DlgModule/xlib/dlgmodule.cpp" "DlgModule/xlib/lodepng.cpp" -o "libdlgmod.so" -std=c++17 -I/usr/local/include -L/usr/local/lib -shared -lX11 -lkvm -lutil -lc -lpthread -fPIC
fi
