cd "${0%/*}"

if [ `uname` = "Darwin" ]; then
  clang++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/macos/libdlgmod.mm" -o "libdlgmod.dylib" -I. -std=c++17 -shared -ObjC++ -framework AppKit -framework UniformTypeIdentifiers -mmacos-version-min=10.13 -arch arm64 -arch x86_64 -fPIC;
elif [ $(uname) = "Linux" ]; then
  g++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -static-libgcc -static-libstdc++ -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -lpthread -fPIC;
elif [ $(uname) = "FreeBSD" ]; then
  clang++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -lkvm -lc -lpthread -fPIC;
elif [ $(uname) = "DragonFly" ]; then
  g++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -static-libgcc -static-libstdc++ -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -lkvm -lc -lpthread -fPIC;
elif [ $(uname) = "NetBSD" ]; then
  g++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -static-libgcc -static-libstdc++ -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -I/usr/X11R7/include -Wl,-rpath,/usr/X11R7/lib -L/usr/X11R7/lib -lkvm -lc -lpthread -fPIC;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -lkvm -lc -lpthread -fPIC;
elif [ $(uname) = "SunOS" ]; then
  export PKG_CONFIG_PATH=/usr/lib/64/pkgconfig && g++ "libdlgmod/general/libdlgmod.cpp" "libdlgmod/xlib/libdlgmod.cpp" "libdlgmod/xlib/apiprocess/process.cpp" "libdlgmod/xlib/xprocess.cpp" "libdlgmod/xlib/lodepng.cpp" -o "libdlgmod.so" -DPROCESS_GUIWINDOW_IMPL -DNULLIFY_STDERR -I. -std=c++17 -shared -static-libgcc -DUSE_SDL_POLLEVENT `pkg-config --cflags --libs x11 sdl2 --static` -lkvm -lc -lpthread -fPIC;
fi
