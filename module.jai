#if OS == .LINUX || OS == .WINDOWS {
    #load "src/raylib.jai";
} else {
    #assert(false, message = "Unsupported OS");
}
