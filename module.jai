#if OS == .LINUX || OS == .WINDOWS || OS == .MACOS {
    #load "src/raylib.jai";
} else {
    #assert(false, message = "Unsupported OS");
}
