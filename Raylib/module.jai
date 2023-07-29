#if OS == .LINUX || OS == .WINDOWS {
    #load "raylib.jai";
} else {
    #assert(false, message = "Unsupported OS");
}
