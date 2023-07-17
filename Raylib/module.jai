#if OS == .LINUX {
    GUI :: #import,file "raygui.jai";
    RL :: GUI.RL;
} else if OS == .WINDOWS {
    RL :: #import,file "raylib.jai";
    #assert(false, message = "Unsupported OS");
}
