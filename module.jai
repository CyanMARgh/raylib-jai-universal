#if OS == .LINUX || OS == .WINDOWS || OS == .MACOS {
    #load "src/raylib.jai";
} else {
    #assert(false, message = "Unsupported OS");
}

#if OS == .MACOS {
    #system_library "Cocoa";
    #system_library "OpenGL";
    #system_library "CoreGraphics";
    #system_library "AppKit";
    #system_library "IOKit";
}
