#import "Math";

#if OS == .LINUX {
    #load "linux.jai";
} else {
    #assert(false, message = "Unsupported OS");
}

// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background
// * manually added - Fehse 2022-02-28
LIGHTGRAY  :: Color.{ 200, 200, 200, 255 };   // Light Gray
GRAY       :: Color.{ 130, 130, 130, 255 };   // Gray
DARKGRAY   :: Color.{ 80, 80, 80, 255 }   ;   // Dark Gray
YELLOW     :: Color.{ 253, 249, 0, 255 }  ;   // Yellow
GOLD       :: Color.{ 255, 203, 0, 255 }  ;   // Gold
ORANGE     :: Color.{ 255, 161, 0, 255 }  ;   // Orange
PINK       :: Color.{ 255, 109, 194, 255 };   // Pink
RED        :: Color.{ 230, 41, 55, 255 }  ;   // Red
MAROON     :: Color.{ 190, 33, 55, 255 }  ;   // Maroon
GREEN      :: Color.{ 0, 228, 48, 255 }   ;   // Green
LIME       :: Color.{ 0, 158, 47, 255 }   ;   // Lime
DARKGREEN  :: Color.{ 0, 117, 44, 255 }   ;   // Dark Green
SKYBLUE    :: Color.{ 102, 191, 255, 255 };   // Sky Blue
BLUE       :: Color.{ 0, 121, 241, 255 }  ;   // Blue
DARKBLUE   :: Color.{ 0, 82, 172, 255 }   ;   // Dark Blue
PURPLE     :: Color.{ 200, 122, 255, 255 };   // Purple
VIOLET     :: Color.{ 135, 60, 190, 255 } ;   // Violet
DARKPURPLE :: Color.{ 112, 31, 126, 255 } ;   // Dark Purple
BEIGE      :: Color.{ 211, 176, 131, 255 };   // Beige
BROWN      :: Color.{ 127, 106, 79, 255 } ;   // Brown
DARKBROWN  :: Color.{ 76, 63, 47, 255 }   ;   // Dark Brown
WHITE      :: Color.{ 255, 255, 255, 255 };   // White
BLACK      :: Color.{ 0, 0, 0, 255 }      ;   // Black
BLANK      :: Color.{ 0, 0, 0, 0 }        ;   // Blank (Transparent)
MAGENTA    :: Color.{ 255, 0, 255, 255 }  ;   // Magenta
RAYWHITE   :: Color.{ 245, 245, 245, 255 };   // My own White (raylib logo)

va_list :: *void; // added after recomendation by Gatza - Fehse 2022-02-28

RLGL_Data :: struct {
    currentBatch : *RenderBatch;
    defaultBatch :  RenderBatch;

    State : struct {
        vertexCounter : s32;
        texcoordx, texcoordy : float;
        normalx, normaly, normalz : float;
        colorr, colorg, colorb, colora : u8;

        currentMatrixMode : s32;
        currentMatrix : *Matrix;
        modelview  : Matrix;
        projection : Matrix;
        transform  : Matrix;
        transformRequired : bool;
        stack : [RL_MAX_MATRIX_STACK_SIZE]Matrix;
        stackCounter : s32;

        defaultTextureId  :  u32;
        activeTextureId   : [RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS]u32;
        defaultVShaderId  :  u32;
        defaultFShaderId  :  u32;
        defaultShaderId   :  u32;
        defaultShaderLocs : *s32;
        currentShaderId   :  u32;
        currentShaderLocs : *s32;

        stereoRender : bool;
        projectionStereo : [2]Matrix;
        viewOffsetStereo : [2]Matrix;


        currentBlendMode        : s32;
        glBlendSrcFactor        : s32;
        glBlendDstFactor        : s32;
        glBlendEquation         : s32;
        glBlendSrcFactorRGB     : s32;
        glBlendDestFactorRGB    : s32;
        glBlendSrcFactorAlpha   : s32;
        glBlendDestFactorAlpha  : s32;
        glBlendEquationRGB      : s32;
        glBlendEquationAlpha    : s32;
        glCustomBlendModeModified : bool;

        framebufferWidth    : s32;
        framebufferHeight   : s32;
    };

    ExtSupported : struct {
        vao             : bool;
        instancing      : bool;
        texNPOT         : bool;
        texDepth        : bool;
        texDepthWebGL   : bool;
        texFloat32      : bool;
        texCompDXT      : bool;
        texCompETC1     : bool;
        texCompETC2     : bool;
        texCompPVRT     : bool;
        texCompASTC     : bool;
        texMirrorClamp  : bool;                
        texAnisoFilter  : bool;
        computeShader   : bool;
        ssbo            : bool;

        maxAnisotropyLevel : float;
        maxDepthBits : int;
    };
}
