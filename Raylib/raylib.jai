 //
// This file was auto-generated using the following command:
//
// jai generate.jai
//
// AND THEN IT IS MANUALLY EDITED, BE CAREFUL!

#import "Math";

#load "extra.jai";

RAYLIB_VERSION_MAJOR :: 4;
RAYLIB_VERSION_MINOR :: 5;
RAYLIB_VERSION_PATCH :: 0;
RAYLIB_VERSION :: "4.5";

DEG2RAD :: PI/180.0;

RAD2DEG :: 180.0/PI;

RLGL_VERSION :: "4.5";

RL_DEFAULT_BATCH_BUFFER_ELEMENTS :: 8192;

RL_DEFAULT_BATCH_BUFFERS :: 1;

RL_DEFAULT_BATCH_DRAWCALLS :: 256;

RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS :: 4;

RL_MAX_MATRIX_STACK_SIZE :: 32;

RL_MAX_SHADER_LOCATIONS :: 32;

RL_CULL_DISTANCE_NEAR :: 0.01;

RL_CULL_DISTANCE_FAR :: 1000.0;

RL_TEXTURE_WRAP_S :: 0x2802;
RL_TEXTURE_WRAP_T :: 0x2803;
RL_TEXTURE_MAG_FILTER :: 0x2800;
RL_TEXTURE_MIN_FILTER :: 0x2801;

RL_TEXTURE_FILTER_NEAREST :: 0x2600;
RL_TEXTURE_FILTER_LINEAR :: 0x2601;
RL_TEXTURE_FILTER_MIP_NEAREST :: 0x2700;
RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR :: 0x2702;
RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST :: 0x2701;
RL_TEXTURE_FILTER_MIP_LINEAR :: 0x2703;
RL_TEXTURE_FILTER_ANISOTROPIC :: 0x3000;
RL_TEXTURE_MIPMAP_BIAS_RATIO :: 0x4000;

RL_TEXTURE_WRAP_REPEAT :: 0x2901;
RL_TEXTURE_WRAP_CLAMP :: 0x812F;
RL_TEXTURE_WRAP_MIRROR_REPEAT :: 0x8370;
RL_TEXTURE_WRAP_MIRROR_CLAMP :: 0x8742;

RL_MODELVIEW :: 0x1700;
RL_PROJECTION :: 0x1701;
RL_TEXTURE :: 0x1702;

RL_LINES :: 0x0001;
RL_TRIANGLES :: 0x0004;
RL_QUADS :: 0x0007;

RL_UNSIGNED_BYTE :: 0x1401;
RL_FLOAT :: 0x1406;

RL_STREAM_DRAW :: 0x88E0;
RL_STREAM_READ :: 0x88E1;
RL_STREAM_COPY :: 0x88E2;
RL_STATIC_DRAW :: 0x88E4;
RL_STATIC_READ :: 0x88E5;
RL_STATIC_COPY :: 0x88E6;
RL_DYNAMIC_DRAW :: 0x88E8;
RL_DYNAMIC_READ :: 0x88E9;
RL_DYNAMIC_COPY :: 0x88EA;

RL_FRAGMENT_SHADER :: 0x8B30;
RL_VERTEX_SHADER :: 0x8B31;
RL_COMPUTE_SHADER :: 0x91B9;

RL_ZERO :: 0;
RL_ONE :: 1;
RL_SRC_COLOR :: 0x0300;
RL_ONE_MINUS_SRC_COLOR :: 0x0301;
RL_SRC_ALPHA :: 0x0302;
RL_ONE_MINUS_SRC_ALPHA :: 0x0303;
RL_DST_ALPHA :: 0x0304;
RL_ONE_MINUS_DST_ALPHA :: 0x0305;
RL_DST_COLOR :: 0x0306;
RL_ONE_MINUS_DST_COLOR :: 0x0307;
RL_SRC_ALPHA_SATURATE :: 0x0308;
RL_CONSTANT_COLOR :: 0x8001;
RL_ONE_MINUS_CONSTANT_COLOR :: 0x8002;
RL_CONSTANT_ALPHA :: 0x8003;
RL_ONE_MINUS_CONSTANT_ALPHA :: 0x8004;

RL_FUNC_ADD :: 0x8006;
RL_MIN :: 0x8007;
RL_MAX :: 0x8008;
RL_FUNC_SUBTRACT :: 0x800A;
RL_FUNC_REVERSE_SUBTRACT :: 0x800B;
RL_BLEND_EQUATION :: 0x8009;
RL_BLEND_EQUATION_RGB :: 0x8009;
RL_BLEND_EQUATION_ALPHA :: 0x883D;
RL_BLEND_DST_RGB :: 0x80C8;
RL_BLEND_SRC_RGB :: 0x80C9;
RL_BLEND_DST_ALPHA :: 0x80CA;
RL_BLEND_SRC_ALPHA :: 0x80CB;
RL_BLEND_COLOR :: 0x8005;

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

// Matrix, 4x4 components, column major, OpenGL style, right-handed
Matrix :: struct {
	m0, m4,  m8, m12 :  float; // Matrix first row (4 components)
	m1, m5,  m9, m13 :  float; // Matrix second row (4 components)
	m2, m6, m10, m14 :  float; // Matrix third row (4 components)
	m3, m7, m11, m15 :  float; // Matrix fourth row (4 components)
}

// Color, 4 components, R8G8B8A8 (32bit)
Color :: struct {
	r: u8; // Color red value
	g: u8; // Color green value
	b: u8; // Color blue value
	a: u8; // Color alpha value
}

// Rectangle, 4 components
Rectangle :: struct {
	x:      float; // Rectangle top-left corner position x
	y:      float; // Rectangle top-left corner position y
	width:  float; // Rectangle width
	height: float; // Rectangle height
	// #place x; corner : Vector2;
	// #place width; size : Vector2;
}

// Image, pixel data stored in CPU memory (RAM)
Image :: struct {
	data:    *void; // Image raw data
	width:   s32; // Image base width
	height:  s32; // Image base height
	mipmaps: s32; // Mipmap levels, 1 by default
	format:  s32; // Data format (PixelFormat type)
}

// Texture, tex data stored in GPU memory (VRAM)
Texture :: struct {
	id:      u32; // OpenGL texture id
	width:   s32; // Texture base width
	height:  s32; // Texture base height
	mipmaps: s32; // Mipmap levels, 1 by default
	format:  s32; // Data format (PixelFormat type)
}

// Texture2D, same as Texture
Texture2D :: Texture;

// TextureCubemap, same as Texture
TextureCubemap :: Texture;

// RenderTexture, fbo for texture rendering
RenderTexture :: struct {
	id:      u32; // OpenGL framebuffer object id
	texture: Texture; // Color buffer attachment texture
	depth:   Texture; // Depth buffer attachment texture
}

// RenderTexture2D, same as RenderTexture
RenderTexture2D :: RenderTexture;

// NPatchInfo, n-patch layout info
NPatchInfo :: struct {
	source: Rectangle; // Texture source rectangle
	left:   s32; // Left border offset
	top:    s32; // Top border offset
	right:  s32; // Right border offset
	bottom: s32; // Bottom border offset
	layout: s32; // Layout of the n-patch: 3x3, 1x3 or 3x1
}

// GlyphInfo, font characters glyphs info
GlyphInfo :: struct {
	value:    s32; // Character value (Unicode)
	offsetX:  s32; // Character offset X when drawing
	offsetY:  s32; // Character offset Y when drawing
	advanceX: s32; // Character advance position X
	image:    Image; // Character image data
}

// Font, font texture and GlyphInfo array data
Font :: struct {
	baseSize:     s32; // Base size (default chars height)
	glyphCount:   s32; // Number of glyph characters
	glyphPadding: s32; // Padding around the glyph characters
	texture:      Texture2D; // Texture atlas containing the glyphs
	recs:         *Rectangle; // Rectangles in texture for the glyphs
	glyphs:       *GlyphInfo; // Glyphs info data
}

// Camera, defines position/orientation in 3d space
Camera3D :: struct {
	position:   Vector3; // Camera position
	target:     Vector3; // Camera target it looks-at
	up:         Vector3; // Camera up vector (rotation over its axis)
	fovy:       float; // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
	projection: s32; // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
}

Camera :: Camera3D;

// Camera2D, defines position/orientation in 2d space
Camera2D :: struct {
	offset:   Vector2; // Camera offset (displacement from target)
	target:   Vector2; // Camera target (rotation and zoom origin)
	rotation: float; // Camera rotation in degrees
	zoom:     float; // Camera zoom (scaling), should be 1.0f by default
}

// Mesh, vertex data and vao/vbo
Mesh :: struct {
	vertexCount:   s32; // Number of vertices stored in arrays
	triangleCount: s32; // Number of triangles stored (indexed or not)

	vertices:      *float; // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
	texcoords:     *float; // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
	texcoords2:    *float; // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
	normals:       *float; // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
	tangents:      *float; // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
	colors:        *u8; // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
	indices:       *u16; // Vertex indices (in case vertex data comes indexed)

	animVertices:  *float; // Animated vertex positions (after bones transformations)
	animNormals:   *float; // Animated normals (after bones transformations)
	boneIds:       *u8; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
	boneWeights:   *float; // Vertex bone weight, up to 4 bones influence by vertex (skinning)

	vaoId:         u32; // OpenGL Vertex Array Object id
	vboId:         *u32; // OpenGL Vertex Buffer Objects id (default vertex data)
}

// Shader
Shader :: struct {
	id:   u32; // Shader program id
	locs: *s32; // Shader locations array (RL_MAX_SHADER_LOCATIONS)
}

// MaterialMap
MaterialMap :: struct {
	texture: Texture2D; // Material map texture
	color:   Color; // Material map color
	value:   float; // Material map value
}

// Material, includes shader and maps
Material :: struct {
	shader: Shader; // Material shader
	maps:   *MaterialMap; // Material maps array (MAX_MATERIAL_MAPS)
	params: [4] float; // Material generic parameters (if required)
}

// Transform, vertex transformation data
Transform :: struct {
	translation: Vector3; // Translation
	rotation:    Quaternion; // Rotation
	scale:       Vector3; // Scale
}

// Bone, skeletal animation bone
BoneInfo :: struct {
	name:   [32] u8; // Bone name
	parent: s32; // Bone parent
}

// Model, meshes, materials and animation data
Model :: struct {
	transform:     Matrix; // Local transform matrix

	meshCount:     s32; // Number of meshes
	materialCount: s32; // Number of materials
	meshes:        *Mesh; // Meshes array
	materials:     *Material; // Materials array
	meshMaterial:  *s32; // Mesh material number

	boneCount:     s32; // Number of bones
	bones:         *BoneInfo; // Bones information (skeleton)
	bindPose:      *Transform; // Bones base transformation (pose)
}

// ModelAnimation
ModelAnimation :: struct {
	boneCount:  s32; // Number of bones
	frameCount: s32; // Number of animation frames
	bones:      *BoneInfo; // Bones information (skeleton)
	framePoses: **Transform; // Poses array by frame
}

// Ray, ray for raycasting
Ray :: struct {
	position:  Vector3; // Ray position (origin)
	direction: Vector3; // Ray direction
}

// RayCollision, ray hit information
RayCollision :: struct {
	hit:      bool; // Did the ray hit something?
	distance: float; // Distance to the nearest hit
	point:    Vector3; // Point of the nearest hit
	normal:   Vector3; // Surface normal of hit
}

// BoundingBox
BoundingBox :: struct {
	min: Vector3; // Minimum vertex box-corner
	max: Vector3; // Maximum vertex box-corner
}

// Wave, audio wave data
Wave :: struct {
	frameCount: u32; // Total number of frames (considering channels)
	sampleRate: u32; // Frequency (samples per second)
	sampleSize: u32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	channels:   u32; // Number of channels (1-mono, 2-stereo, ...)
	data:       *void; // Buffer data pointer
}

rAudioBuffer :: struct {}
rAudioProcessor :: struct {}

// AudioStream, custom audio stream
AudioStream :: struct {
	buffer:     *rAudioBuffer; // Pointer to internal data used by the audio system
	processor:  *rAudioProcessor; // Pointer to internal data processor, useful for audio effects

	sampleRate: u32; // Frequency (samples per second)
	sampleSize: u32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	channels:   u32; // Number of channels (1-mono, 2-stereo, ...)
}

// Sound
Sound :: struct {
	stream:     AudioStream; // Audio stream
	frameCount: u32; // Total number of frames (considering channels)
}

// Music, audio stream, anything longer than ~10 seconds should be streamed
Music :: struct {
	stream:     AudioStream; // Audio stream
	frameCount: u32; // Total number of frames (considering channels)
	looping:    bool; // Music looping enable

	ctxType:    s32; // Type of music context (audio filetype)
	ctxData:    *void; // Audio context data, depends on type
}

// VrDeviceInfo, Head-Mounted-Display device parameters
VrDeviceInfo :: struct {
	hResolution:            s32; // Horizontal resolution in pixels
	vResolution:            s32; // Vertical resolution in pixels
	hScreenSize:            float; // Horizontal size in meters
	vScreenSize:            float; // Vertical size in meters
	vScreenCenter:          float; // Screen center in meters
	eyeToScreenDistance:    float; // Distance between eye and display in meters
	lensSeparationDistance: float; // Lens separation distance in meters
	interpupillaryDistance: float; // IPD (distance between pupils) in meters
	lensDistortionValues:   [4] float; // Lens distortion constant parameters
	chromaAbCorrection:     [4] float; // Chromatic aberration correction parameters
}

// VrStereoConfig, VR stereo rendering configuration for simulator
VrStereoConfig :: struct {
	projection:        [2] Matrix; // VR projection matrices (per eye)
	viewOffset:        [2] Matrix; // VR view offset matrices (per eye)
	leftLensCenter:    [2] float; // VR left lens center
	rightLensCenter:   [2] float; // VR right lens center
	leftScreenCenter:  [2] float; // VR left screen center
	rightScreenCenter: [2] float; // VR right screen center
	scale:             [2] float; // VR distortion scale
	scaleIn:           [2] float; // VR distortion scale in
}

// File path list
FilePathList :: struct {
	capacity: u32; // Filepaths max entries
	count:    u32; // Filepaths entries count
	paths:    **u8; // Filepaths entries
}

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
ConfigFlags :: enum s32 {
	VSYNC_HINT               :: 64;
	FULLSCREEN_MODE          :: 2;
	WINDOW_RESIZABLE         :: 4;
	WINDOW_UNDECORATED       :: 8;
	WINDOW_HIDDEN            :: 128;
	WINDOW_MINIMIZED         :: 512;
	WINDOW_MAXIMIZED         :: 1024;
	WINDOW_UNFOCUSED         :: 2048;
	WINDOW_TOPMOST           :: 4096;
	WINDOW_ALWAYS_RUN        :: 256;
	WINDOW_TRANSPARENT       :: 16;
	WINDOW_HIGHDPI           :: 8192;
	WINDOW_MOUSE_PASSTHROUGH :: 16384;
	MSAA_4X_HINT             :: 32;
	INTERLACED_HINT          :: 65536;
}
FLAG_VSYNC_HINT               :: ConfigFlags.VSYNC_HINT;
FLAG_FULLSCREEN_MODE          :: ConfigFlags.FULLSCREEN_MODE;
FLAG_WINDOW_RESIZABLE         :: ConfigFlags.WINDOW_RESIZABLE;
FLAG_WINDOW_UNDECORATED       :: ConfigFlags.WINDOW_UNDECORATED;
FLAG_WINDOW_HIDDEN            :: ConfigFlags.WINDOW_HIDDEN;
FLAG_WINDOW_MINIMIZED         :: ConfigFlags.WINDOW_MINIMIZED;
FLAG_WINDOW_MAXIMIZED         :: ConfigFlags.WINDOW_MAXIMIZED;
FLAG_WINDOW_UNFOCUSED         :: ConfigFlags.WINDOW_UNFOCUSED;
FLAG_WINDOW_TOPMOST           :: ConfigFlags.WINDOW_TOPMOST;
FLAG_WINDOW_ALWAYS_RUN        :: ConfigFlags.WINDOW_ALWAYS_RUN;
FLAG_WINDOW_TRANSPARENT       :: ConfigFlags.WINDOW_TRANSPARENT;
FLAG_WINDOW_HIGHDPI           :: ConfigFlags.WINDOW_HIGHDPI;
FLAG_WINDOW_MOUSE_PASSTHROUGH :: ConfigFlags.WINDOW_MOUSE_PASSTHROUGH;
FLAG_MSAA_4X_HINT             :: ConfigFlags.MSAA_4X_HINT;
FLAG_INTERLACED_HINT          :: ConfigFlags.INTERLACED_HINT;

// Trace log level
// NOTE: Organized by priority level
TraceLogLevel :: enum s32 {
    ALL     :: 0;
    TRACE   :: 1;
    DEBUG   :: 2;
    INFO    :: 3;
    WARNING :: 4;
    ERROR   :: 5;
    FATAL   :: 6;
    NONE    :: 7;
}
LOG_ALL     :: TraceLogLevel.ALL;
LOG_TRACE   :: TraceLogLevel.TRACE;
LOG_DEBUG   :: TraceLogLevel.DEBUG;
LOG_INFO    :: TraceLogLevel.INFO;
LOG_WARNING :: TraceLogLevel.WARNING;
LOG_ERROR   :: TraceLogLevel.ERROR;
LOG_FATAL   :: TraceLogLevel.FATAL;
LOG_NONE    :: TraceLogLevel.NONE;

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
KeyboardKey :: enum s32 {
    NULL          :: 0;

    APOSTROPHE    :: 39;
    COMMA         :: 44;
    MINUS         :: 45;
    PERIOD        :: 46;
    SLASH         :: 47;
    ZERO          :: 48;
    ONE           :: 49;
    TWO           :: 50;
    THREE         :: 51;
    FOUR          :: 52;
    FIVE          :: 53;
    SIX           :: 54;
    SEVEN         :: 55;
    EIGHT         :: 56;
    NINE          :: 57;
    SEMICOLON     :: 59;
    EQUAL         :: 61;
    A             :: 65;
    B             :: 66;
    C             :: 67;
    D             :: 68;
    E             :: 69;
    F             :: 70;
    G             :: 71;
    H             :: 72;
    I             :: 73;
    J             :: 74;
    K             :: 75;
    L             :: 76;
    M             :: 77;
    N             :: 78;
    O             :: 79;
    P             :: 80;
    Q             :: 81;
    R             :: 82;
    S             :: 83;
    T             :: 84;
    U             :: 85;
    V             :: 86;
    W             :: 87;
    X             :: 88;
    Y             :: 89;
    Z             :: 90;
    LEFT_BRACKET  :: 91;
    BACKSLASH     :: 92;
    RIGHT_BRACKET :: 93;
    GRAVE         :: 96;

    SPACE         :: 32;
    ESCAPE        :: 256;
    ENTER         :: 257;
    TAB           :: 258;
    BACKSPACE     :: 259;
    INSERT        :: 260;
    DELETE        :: 261;
    RIGHT         :: 262;
    LEFT          :: 263;
    DOWN          :: 264;
    UP            :: 265;
    PAGE_UP       :: 266;
    PAGE_DOWN     :: 267;
    HOME          :: 268;
    END           :: 269;
    CAPS_LOCK     :: 280;
    SCROLL_LOCK   :: 281;
    NUM_LOCK      :: 282;
    PRINT_SCREEN  :: 283;
    PAUSE         :: 284;
    F1            :: 290;
    F2            :: 291;
    F3            :: 292;
    F4            :: 293;
    F5            :: 294;
    F6            :: 295;
    F7            :: 296;
    F8            :: 297;
    F9            :: 298;
    F10           :: 299;
    F11           :: 300;
    F12           :: 301;
    LEFT_SHIFT    :: 340;
    LEFT_CONTROL  :: 341;
    LEFT_ALT      :: 342;
    LEFT_SUPER    :: 343;
    RIGHT_SHIFT   :: 344;
    RIGHT_CONTROL :: 345;
    RIGHT_ALT     :: 346;
    RIGHT_SUPER   :: 347;
    KB_MENU       :: 348;

    KP_0          :: 320;
    KP_1          :: 321;
    KP_2          :: 322;
    KP_3          :: 323;
    KP_4          :: 324;
    KP_5          :: 325;
    KP_6          :: 326;
    KP_7          :: 327;
    KP_8          :: 328;
    KP_9          :: 329;
    KP_DECIMAL    :: 330;
    KP_DIVIDE     :: 331;
    KP_MULTIPLY   :: 332;
    KP_SUBTRACT   :: 333;
    KP_ADD        :: 334;
    KP_ENTER      :: 335;
    KP_EQUAL      :: 336;

    BACK          :: 4;
    MENU          :: 82;
    VOLUME_UP     :: 24;
    VOLUME_DOWN   :: 25;
}

KEY_NULL          :: KeyboardKey.NULL;

KEY_APOSTROPHE    :: KeyboardKey.APOSTROPHE;
KEY_COMMA         :: KeyboardKey.COMMA;
KEY_MINUS         :: KeyboardKey.MINUS;
KEY_PERIOD        :: KeyboardKey.PERIOD;
KEY_SLASH         :: KeyboardKey.SLASH;
KEY_ZERO          :: KeyboardKey.ZERO;
KEY_ONE           :: KeyboardKey.ONE;
KEY_TWO           :: KeyboardKey.TWO;
KEY_THREE         :: KeyboardKey.THREE;
KEY_FOUR          :: KeyboardKey.FOUR;
KEY_FIVE          :: KeyboardKey.FIVE;
KEY_SIX           :: KeyboardKey.SIX;
KEY_SEVEN         :: KeyboardKey.SEVEN;
KEY_EIGHT         :: KeyboardKey.EIGHT;
KEY_NINE          :: KeyboardKey.NINE;
KEY_SEMICOLON     :: KeyboardKey.SEMICOLON;
KEY_EQUAL         :: KeyboardKey.EQUAL;
KEY_A             :: KeyboardKey.A;
KEY_B             :: KeyboardKey.B;
KEY_C             :: KeyboardKey.C;
KEY_D             :: KeyboardKey.D;
KEY_E             :: KeyboardKey.E;
KEY_F             :: KeyboardKey.F;
KEY_G             :: KeyboardKey.G;
KEY_H             :: KeyboardKey.H;
KEY_I             :: KeyboardKey.I;
KEY_J             :: KeyboardKey.J;
KEY_K             :: KeyboardKey.K;
KEY_L             :: KeyboardKey.L;
KEY_M             :: KeyboardKey.M;
KEY_N             :: KeyboardKey.N;
KEY_O             :: KeyboardKey.O;
KEY_P             :: KeyboardKey.P;
KEY_Q             :: KeyboardKey.Q;
KEY_R             :: KeyboardKey.R;
KEY_S             :: KeyboardKey.S;
KEY_T             :: KeyboardKey.T;
KEY_U             :: KeyboardKey.U;
KEY_V             :: KeyboardKey.V;
KEY_W             :: KeyboardKey.W;
KEY_X             :: KeyboardKey.X;
KEY_Y             :: KeyboardKey.Y;
KEY_Z             :: KeyboardKey.Z;
KEY_LEFT_BRACKET  :: KeyboardKey.LEFT_BRACKET;
KEY_BACKSLASH     :: KeyboardKey.BACKSLASH;
KEY_RIGHT_BRACKET :: KeyboardKey.RIGHT_BRACKET;
KEY_GRAVE         :: KeyboardKey.GRAVE;

KEY_SPACE         :: KeyboardKey.SPACE;
KEY_ESCAPE        :: KeyboardKey.ESCAPE;
KEY_ENTER         :: KeyboardKey.ENTER;
KEY_TAB           :: KeyboardKey.TAB;
KEY_BACKSPACE     :: KeyboardKey.BACKSPACE;
KEY_INSERT        :: KeyboardKey.INSERT;
KEY_DELETE        :: KeyboardKey.DELETE;
KEY_RIGHT         :: KeyboardKey.RIGHT;
KEY_LEFT          :: KeyboardKey.LEFT;
KEY_DOWN          :: KeyboardKey.DOWN;
KEY_UP            :: KeyboardKey.UP;
KEY_PAGE_UP       :: KeyboardKey.PAGE_UP;
KEY_PAGE_DOWN     :: KeyboardKey.PAGE_DOWN;
KEY_HOME          :: KeyboardKey.HOME;
KEY_END           :: KeyboardKey.END;
KEY_CAPS_LOCK     :: KeyboardKey.CAPS_LOCK;
KEY_SCROLL_LOCK   :: KeyboardKey.SCROLL_LOCK;
KEY_NUM_LOCK      :: KeyboardKey.NUM_LOCK;
KEY_PRINT_SCREEN  :: KeyboardKey.PRINT_SCREEN;
KEY_PAUSE         :: KeyboardKey.PAUSE;
KEY_F1            :: KeyboardKey.F1;
KEY_F2            :: KeyboardKey.F2;
KEY_F3            :: KeyboardKey.F3;
KEY_F4            :: KeyboardKey.F4;
KEY_F5            :: KeyboardKey.F5;
KEY_F6            :: KeyboardKey.F6;
KEY_F7            :: KeyboardKey.F7;
KEY_F8            :: KeyboardKey.F8;
KEY_F9            :: KeyboardKey.F9;
KEY_F10           :: KeyboardKey.F10;
KEY_F11           :: KeyboardKey.F11;
KEY_F12           :: KeyboardKey.F12;
KEY_LEFT_SHIFT    :: KeyboardKey.LEFT_SHIFT;
KEY_LEFT_CONTROL  :: KeyboardKey.LEFT_CONTROL;
KEY_LEFT_ALT      :: KeyboardKey.LEFT_ALT;
KEY_LEFT_SUPER    :: KeyboardKey.LEFT_SUPER;
KEY_RIGHT_SHIFT   :: KeyboardKey.RIGHT_SHIFT;
KEY_RIGHT_CONTROL :: KeyboardKey.RIGHT_CONTROL;
KEY_RIGHT_ALT     :: KeyboardKey.RIGHT_ALT;
KEY_RIGHT_SUPER   :: KeyboardKey.RIGHT_SUPER;
KEY_KB_MENU       :: KeyboardKey.KB_MENU;

KEY_KP_0          :: KeyboardKey.KP_0;
KEY_KP_1          :: KeyboardKey.KP_1;
KEY_KP_2          :: KeyboardKey.KP_2;
KEY_KP_3          :: KeyboardKey.KP_3;
KEY_KP_4          :: KeyboardKey.KP_4;
KEY_KP_5          :: KeyboardKey.KP_5;
KEY_KP_6          :: KeyboardKey.KP_6;
KEY_KP_7          :: KeyboardKey.KP_7;
KEY_KP_8          :: KeyboardKey.KP_8;
KEY_KP_9          :: KeyboardKey.KP_9;
KEY_KP_DECIMAL    :: KeyboardKey.KP_DECIMAL;
KEY_KP_DIVIDE     :: KeyboardKey.KP_DIVIDE;
KEY_KP_MULTIPLY   :: KeyboardKey.KP_MULTIPLY;
KEY_KP_SUBTRACT   :: KeyboardKey.KP_SUBTRACT;
KEY_KP_ADD        :: KeyboardKey.KP_ADD;
KEY_KP_ENTER      :: KeyboardKey.KP_ENTER;
KEY_KP_EQUAL      :: KeyboardKey.KP_EQUAL;

KEY_BACK          :: KeyboardKey.BACK;
KEY_MENU          :: KeyboardKey.MENU;
KEY_VOLUME_UP     :: KeyboardKey.VOLUME_UP;
KEY_VOLUME_DOWN   :: KeyboardKey.VOLUME_DOWN;


// Mouse buttons
MouseButton :: enum s32 {
    LEFT    :: 0;
    RIGHT   :: 1;
    MIDDLE  :: 2;
    SIDE    :: 3;
    EXTRA   :: 4;
    FORWARD :: 5;
    BACK    :: 6;
}
MOUSE_BUTTON_LEFT    :: MouseButton.LEFT;
MOUSE_BUTTON_RIGHT   :: MouseButton.RIGHT;
MOUSE_BUTTON_MIDDLE  :: MouseButton.MIDDLE;
MOUSE_BUTTON_SIDE    :: MouseButton.SIDE;
MOUSE_BUTTON_EXTRA   :: MouseButton.EXTRA;
MOUSE_BUTTON_FORWARD :: MouseButton.FORWARD;
MOUSE_BUTTON_BACK    :: MouseButton.BACK;

// Mouse cursor
MouseCursor :: enum s32 {
	DEFAULT       :: 0;
	ARROW         :: 1;
	IBEAM         :: 2;
	CROSSHAIR     :: 3;
	POINTING_HAND :: 4;
	RESIZE_EW     :: 5;
	RESIZE_NS     :: 6;
	RESIZE_NWSE   :: 7;
	RESIZE_NESW   :: 8;
	RESIZE_ALL    :: 9;
	NOT_ALLOWED   :: 10;
}
MOUSE_CURSOR_DEFAULT       :: MouseCursor.DEFAULT;
MOUSE_CURSOR_ARROW         :: MouseCursor.ARROW;
MOUSE_CURSOR_IBEAM         :: MouseCursor.IBEAM;
MOUSE_CURSOR_CROSSHAIR     :: MouseCursor.CROSSHAIR;
MOUSE_CURSOR_POINTING_HAND :: MouseCursor.POINTING_HAND;
MOUSE_CURSOR_RESIZE_EW     :: MouseCursor.RESIZE_EW;
MOUSE_CURSOR_RESIZE_NS     :: MouseCursor.RESIZE_NS;
MOUSE_CURSOR_RESIZE_NWSE   :: MouseCursor.RESIZE_NWSE;
MOUSE_CURSOR_RESIZE_NESW   :: MouseCursor.RESIZE_NESW;
MOUSE_CURSOR_RESIZE_ALL    :: MouseCursor.RESIZE_ALL;
MOUSE_CURSOR_NOT_ALLOWED   :: MouseCursor.NOT_ALLOWED;

// Gamepad buttons
GamepadButton :: enum s32 {
	UNKNOWN          :: 0;
	LEFT_FACE_UP     :: 1;
	LEFT_FACE_RIGHT  :: 2;
	LEFT_FACE_DOWN   :: 3;
	LEFT_FACE_LEFT   :: 4;
	RIGHT_FACE_UP    :: 5;
	RIGHT_FACE_RIGHT :: 6;
	RIGHT_FACE_DOWN  :: 7;
	RIGHT_FACE_LEFT  :: 8;
	LEFT_TRIGGER_1   :: 9;
	LEFT_TRIGGER_2   :: 10;
	RIGHT_TRIGGER_1  :: 11;
	RIGHT_TRIGGER_2  :: 12;
	MIDDLE_LEFT      :: 13;
	MIDDLE           :: 14;
	MIDDLE_RIGHT     :: 15;
	LEFT_THUMB       :: 16;
	RIGHT_THUMB      :: 17;
}
GAMEPAD_BUTTON_UNKNOWN          :: GamepadButton.UNKNOWN;
GAMEPAD_BUTTON_LEFT_FACE_UP     :: GamepadButton.LEFT_FACE_UP;
GAMEPAD_BUTTON_LEFT_FACE_RIGHT  :: GamepadButton.LEFT_FACE_RIGHT;
GAMEPAD_BUTTON_LEFT_FACE_DOWN   :: GamepadButton.LEFT_FACE_DOWN;
GAMEPAD_BUTTON_LEFT_FACE_LEFT   :: GamepadButton.LEFT_FACE_LEFT;
GAMEPAD_BUTTON_RIGHT_FACE_UP    :: GamepadButton.RIGHT_FACE_UP;
GAMEPAD_BUTTON_RIGHT_FACE_RIGHT :: GamepadButton.RIGHT_FACE_RIGHT;
GAMEPAD_BUTTON_RIGHT_FACE_DOWN  :: GamepadButton.RIGHT_FACE_DOWN;
GAMEPAD_BUTTON_RIGHT_FACE_LEFT  :: GamepadButton.RIGHT_FACE_LEFT;
GAMEPAD_BUTTON_LEFT_TRIGGER_1   :: GamepadButton.LEFT_TRIGGER_1;
GAMEPAD_BUTTON_LEFT_TRIGGER_2   :: GamepadButton.LEFT_TRIGGER_2;
GAMEPAD_BUTTON_RIGHT_TRIGGER_1  :: GamepadButton.RIGHT_TRIGGER_1;
GAMEPAD_BUTTON_RIGHT_TRIGGER_2  :: GamepadButton.RIGHT_TRIGGER_2;
GAMEPAD_BUTTON_MIDDLE_LEFT      :: GamepadButton.MIDDLE_LEFT;
GAMEPAD_BUTTON_MIDDLE           :: GamepadButton.MIDDLE;
GAMEPAD_BUTTON_MIDDLE_RIGHT     :: GamepadButton.MIDDLE_RIGHT;
GAMEPAD_BUTTON_LEFT_THUMB       :: GamepadButton.LEFT_THUMB;
GAMEPAD_BUTTON_RIGHT_THUMB      :: GamepadButton.RIGHT_THUMB;

// Gamepad axis
GamepadAxis :: enum s32 {
	LEFT_X        :: 0;
	LEFT_Y        :: 1;
	RIGHT_X       :: 2;
	RIGHT_Y       :: 3;
	LEFT_TRIGGER  :: 4;
	RIGHT_TRIGGER :: 5;
}
GAMEPAD_AXIS_LEFT_X        :: GamepadAxis.LEFT_X;
GAMEPAD_AXIS_LEFT_Y        :: GamepadAxis.LEFT_Y;
GAMEPAD_AXIS_RIGHT_X       :: GamepadAxis.RIGHT_X;
GAMEPAD_AXIS_RIGHT_Y       :: GamepadAxis.RIGHT_Y;
GAMEPAD_AXIS_LEFT_TRIGGER  :: GamepadAxis.LEFT_TRIGGER;
GAMEPAD_AXIS_RIGHT_TRIGGER :: GamepadAxis.RIGHT_TRIGGER;

// Material map index
MaterialMapIndex :: enum s32 {
	ALBEDO     :: 0;
	METALNESS  :: 1;
	NORMAL     :: 2;
	ROUGHNESS  :: 3;
	OCCLUSION  :: 4;
	EMISSION   :: 5;
	HEIGHT     :: 6;
	CUBEMAP    :: 7;
	IRRADIANCE :: 8;
	PREFILTER  :: 9;
	BRDF       :: 10;
}
MATERIAL_MAP_ALBEDO     :: MaterialMapIndex.ALBEDO;
MATERIAL_MAP_METALNESS  :: MaterialMapIndex.METALNESS;
MATERIAL_MAP_NORMAL     :: MaterialMapIndex.NORMAL;
MATERIAL_MAP_ROUGHNESS  :: MaterialMapIndex.ROUGHNESS;
MATERIAL_MAP_OCCLUSION  :: MaterialMapIndex.OCCLUSION;
MATERIAL_MAP_EMISSION   :: MaterialMapIndex.EMISSION;
MATERIAL_MAP_HEIGHT     :: MaterialMapIndex.HEIGHT;
MATERIAL_MAP_CUBEMAP    :: MaterialMapIndex.CUBEMAP;
MATERIAL_MAP_IRRADIANCE :: MaterialMapIndex.IRRADIANCE;
MATERIAL_MAP_PREFILTER  :: MaterialMapIndex.PREFILTER;
MATERIAL_MAP_BRDF       :: MaterialMapIndex.BRDF;

// Shader location index
ShaderLocationIndex :: enum s32 {
	VERTEX_POSITION   :: 0;
	VERTEX_TEXCOORD01 :: 1;
	VERTEX_TEXCOORD02 :: 2;
	VERTEX_NORMAL     :: 3;
	VERTEX_TANGENT    :: 4;
	VERTEX_COLOR      :: 5;
	MATRIX_MVP        :: 6;
	MATRIX_VIEW       :: 7;
	MATRIX_PROJECTION :: 8;
	MATRIX_MODEL      :: 9;
	MATRIX_NORMAL     :: 10;
	VECTOR_VIEW       :: 11;
	COLOR_DIFFUSE     :: 12;
	COLOR_SPECULAR    :: 13;
	COLOR_AMBIENT     :: 14;
	MAP_ALBEDO        :: 15;
	MAP_METALNESS     :: 16;
	MAP_NORMAL        :: 17;
	MAP_ROUGHNESS     :: 18;
	MAP_OCCLUSION     :: 19;
	MAP_EMISSION      :: 20;
	MAP_HEIGHT        :: 21;
	MAP_CUBEMAP       :: 22;
	MAP_IRRADIANCE    :: 23;
	MAP_PREFILTER     :: 24;
	MAP_BRDF          :: 25;
}
SHADER_LOC_VERTEX_POSITION   :: ShaderLocationIndex.VERTEX_POSITION;
SHADER_LOC_VERTEX_TEXCOORD01 :: ShaderLocationIndex.VERTEX_TEXCOORD01;
SHADER_LOC_VERTEX_TEXCOORD02 :: ShaderLocationIndex.VERTEX_TEXCOORD02;
SHADER_LOC_VERTEX_NORMAL     :: ShaderLocationIndex.VERTEX_NORMAL;
SHADER_LOC_VERTEX_TANGENT    :: ShaderLocationIndex.VERTEX_TANGENT;
SHADER_LOC_VERTEX_COLOR      :: ShaderLocationIndex.VERTEX_COLOR;
SHADER_LOC_MATRIX_MVP        :: ShaderLocationIndex.MATRIX_MVP;
SHADER_LOC_MATRIX_VIEW       :: ShaderLocationIndex.MATRIX_VIEW;
SHADER_LOC_MATRIX_PROJECTION :: ShaderLocationIndex.MATRIX_PROJECTION;
SHADER_LOC_MATRIX_MODEL      :: ShaderLocationIndex.MATRIX_MODEL;
SHADER_LOC_MATRIX_NORMAL     :: ShaderLocationIndex.MATRIX_NORMAL;
SHADER_LOC_VECTOR_VIEW       :: ShaderLocationIndex.VECTOR_VIEW;
SHADER_LOC_COLOR_DIFFUSE     :: ShaderLocationIndex.COLOR_DIFFUSE;
SHADER_LOC_COLOR_SPECULAR    :: ShaderLocationIndex.COLOR_SPECULAR;
SHADER_LOC_COLOR_AMBIENT     :: ShaderLocationIndex.COLOR_AMBIENT;
SHADER_LOC_MAP_ALBEDO        :: ShaderLocationIndex.MAP_ALBEDO;
SHADER_LOC_MAP_METALNESS     :: ShaderLocationIndex.MAP_METALNESS;
SHADER_LOC_MAP_NORMAL        :: ShaderLocationIndex.MAP_NORMAL;
SHADER_LOC_MAP_ROUGHNESS     :: ShaderLocationIndex.MAP_ROUGHNESS;
SHADER_LOC_MAP_OCCLUSION     :: ShaderLocationIndex.MAP_OCCLUSION;
SHADER_LOC_MAP_EMISSION      :: ShaderLocationIndex.MAP_EMISSION;
SHADER_LOC_MAP_HEIGHT        :: ShaderLocationIndex.MAP_HEIGHT;
SHADER_LOC_MAP_CUBEMAP       :: ShaderLocationIndex.MAP_CUBEMAP;
SHADER_LOC_MAP_IRRADIANCE    :: ShaderLocationIndex.MAP_IRRADIANCE;
SHADER_LOC_MAP_PREFILTER     :: ShaderLocationIndex.MAP_PREFILTER;
SHADER_LOC_MAP_BRDF          :: ShaderLocationIndex.MAP_BRDF;

// Shader uniform data type
ShaderUniformDataType :: enum s32 {
	FLOAT     :: 0;
	VEC2      :: 1;
	VEC3      :: 2;
	VEC4      :: 3;
	INT       :: 4;
	IVEC2     :: 5;
	IVEC3     :: 6;
	IVEC4     :: 7;
	SAMPLER2D :: 8;
}
SHADER_UNIFORM_FLOAT     :: ShaderUniformDataType.FLOAT;
SHADER_UNIFORM_VEC2      :: ShaderUniformDataType.VEC2;
SHADER_UNIFORM_VEC3      :: ShaderUniformDataType.VEC3;
SHADER_UNIFORM_VEC4      :: ShaderUniformDataType.VEC4;
SHADER_UNIFORM_INT       :: ShaderUniformDataType.INT;
SHADER_UNIFORM_IVEC2     :: ShaderUniformDataType.IVEC2;
SHADER_UNIFORM_IVEC3     :: ShaderUniformDataType.IVEC3;
SHADER_UNIFORM_IVEC4     :: ShaderUniformDataType.IVEC4;
SHADER_UNIFORM_SAMPLER2D :: ShaderUniformDataType.SAMPLER2D;

// Shader attribute data types
ShaderAttributeDataType :: enum s32 {
	FLOAT :: 0;
	VEC2  :: 1;
	VEC3  :: 2;
	VEC4  :: 3;
}
SHADER_ATTRIB_FLOAT :: ShaderAttributeDataType.FLOAT;
SHADER_ATTRIB_VEC2  :: ShaderAttributeDataType.VEC2;
SHADER_ATTRIB_VEC3  :: ShaderAttributeDataType.VEC3;
SHADER_ATTRIB_VEC4  :: ShaderAttributeDataType.VEC4;

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
PixelFormat :: enum s32 {
	UNCOMPRESSED_GRAYSCALE    :: 1;
	UNCOMPRESSED_GRAY_ALPHA   :: 2;
	UNCOMPRESSED_R5G6B5       :: 3;
	UNCOMPRESSED_R8G8B8       :: 4;
	UNCOMPRESSED_R5G5B5A1     :: 5;
	UNCOMPRESSED_R4G4B4A4     :: 6;
	UNCOMPRESSED_R8G8B8A8     :: 7;
	UNCOMPRESSED_R32          :: 8;
	UNCOMPRESSED_R32G32B32    :: 9;
	UNCOMPRESSED_R32G32B32A32 :: 10;
	COMPRESSED_DXT1_RGB       :: 11;
	COMPRESSED_DXT1_RGBA      :: 12;
	COMPRESSED_DXT3_RGBA      :: 13;
	COMPRESSED_DXT5_RGBA      :: 14;
	COMPRESSED_ETC1_RGB       :: 15;
	COMPRESSED_ETC2_RGB       :: 16;
	COMPRESSED_ETC2_EAC_RGBA  :: 17;
	COMPRESSED_PVRT_RGB       :: 18;
	COMPRESSED_PVRT_RGBA      :: 19;
	COMPRESSED_ASTC_4x4_RGBA  :: 20;
	COMPRESSED_ASTC_8x8_RGBA  :: 21;
}
PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    :: PixelFormat.UNCOMPRESSED_GRAYSCALE;
PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   :: PixelFormat.UNCOMPRESSED_GRAY_ALPHA;
PIXELFORMAT_UNCOMPRESSED_R5G6B5       :: PixelFormat.UNCOMPRESSED_R5G6B5;
PIXELFORMAT_UNCOMPRESSED_R8G8B8       :: PixelFormat.UNCOMPRESSED_R8G8B8;
PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     :: PixelFormat.UNCOMPRESSED_R5G5B5A1;
PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     :: PixelFormat.UNCOMPRESSED_R4G4B4A4;
PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     :: PixelFormat.UNCOMPRESSED_R8G8B8A8;
PIXELFORMAT_UNCOMPRESSED_R32          :: PixelFormat.UNCOMPRESSED_R32;
PIXELFORMAT_UNCOMPRESSED_R32G32B32    :: PixelFormat.UNCOMPRESSED_R32G32B32;
PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 :: PixelFormat.UNCOMPRESSED_R32G32B32A32;
PIXELFORMAT_COMPRESSED_DXT1_RGB       :: PixelFormat.COMPRESSED_DXT1_RGB;
PIXELFORMAT_COMPRESSED_DXT1_RGBA      :: PixelFormat.COMPRESSED_DXT1_RGBA;
PIXELFORMAT_COMPRESSED_DXT3_RGBA      :: PixelFormat.COMPRESSED_DXT3_RGBA;
PIXELFORMAT_COMPRESSED_DXT5_RGBA      :: PixelFormat.COMPRESSED_DXT5_RGBA;
PIXELFORMAT_COMPRESSED_ETC1_RGB       :: PixelFormat.COMPRESSED_ETC1_RGB;
PIXELFORMAT_COMPRESSED_ETC2_RGB       :: PixelFormat.COMPRESSED_ETC2_RGB;
PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  :: PixelFormat.COMPRESSED_ETC2_EAC_RGBA;
PIXELFORMAT_COMPRESSED_PVRT_RGB       :: PixelFormat.COMPRESSED_PVRT_RGB;
PIXELFORMAT_COMPRESSED_PVRT_RGBA      :: PixelFormat.COMPRESSED_PVRT_RGBA;
PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  :: PixelFormat.COMPRESSED_ASTC_4x4_RGBA;
PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  :: PixelFormat.COMPRESSED_ASTC_8x8_RGBA;

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
TextureFilter :: enum s32 {
	POINT           :: 0;
	BILINEAR        :: 1;
	TRILINEAR       :: 2;
	ANISOTROPIC_4X  :: 3;
	ANISOTROPIC_8X  :: 4;
	ANISOTROPIC_16X :: 5;
}
TEXTURE_FILTER_POINT           :: TextureFilter.POINT;
TEXTURE_FILTER_BILINEAR        :: TextureFilter.BILINEAR;
TEXTURE_FILTER_TRILINEAR       :: TextureFilter.TRILINEAR;
TEXTURE_FILTER_ANISOTROPIC_4X  :: TextureFilter.ANISOTROPIC_4X;
TEXTURE_FILTER_ANISOTROPIC_8X  :: TextureFilter.ANISOTROPIC_8X;
TEXTURE_FILTER_ANISOTROPIC_16X :: TextureFilter.ANISOTROPIC_16X;

// Texture parameters: wrap mode
TextureWrap :: enum s32 {
	REPEAT        :: 0;
	CLAMP         :: 1;
	MIRROR_REPEAT :: 2;
	MIRROR_CLAMP  :: 3;
}
TEXTURE_WRAP_REPEAT        :: TextureWrap.REPEAT;
TEXTURE_WRAP_CLAMP         :: TextureWrap.CLAMP;
TEXTURE_WRAP_MIRROR_REPEAT :: TextureWrap.MIRROR_REPEAT;
TEXTURE_WRAP_MIRROR_CLAMP  :: TextureWrap.MIRROR_CLAMP;

// Cubemap layouts
CubemapLayout :: enum s32 {
	AUTO_DETECT         :: 0;
	LINE_VERTICAL       :: 1;
	LINE_HORIZONTAL     :: 2;
	CROSS_THREE_BY_FOUR :: 3;
	CROSS_FOUR_BY_THREE :: 4;
	PANORAMA            :: 5;
}
CUBEMAP_LAYOUT_AUTO_DETECT         :: CubemapLayout.AUTO_DETECT;
CUBEMAP_LAYOUT_LINE_VERTICAL       :: CubemapLayout.LINE_VERTICAL;
CUBEMAP_LAYOUT_LINE_HORIZONTAL     :: CubemapLayout.LINE_HORIZONTAL;
CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR :: CubemapLayout.CROSS_THREE_BY_FOUR;
CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE :: CubemapLayout.CROSS_FOUR_BY_THREE;
CUBEMAP_LAYOUT_PANORAMA            :: CubemapLayout.PANORAMA;

// Font type, defines generation method
FontType :: enum s32 {
	DEFAULT :: 0;
	BITMAP  :: 1;
	SDF     :: 2;
}
FONT_DEFAULT :: FontType.DEFAULT;
FONT_BITMAP  :: FontType.BITMAP;
FONT_SDF     :: FontType.SDF;

// Color blending modes (pre-defined)
BlendMode :: enum s32 {
	ALPHA             :: 0;
	ADDITIVE          :: 1;
	MULTIPLIED        :: 2;
	ADD_COLORS        :: 3;
	SUBTRACT_COLORS   :: 4;
	ALPHA_PREMULTIPLY :: 5;
	CUSTOM            :: 6;
	CUSTOM_SEPARATE   :: 7;
}
BLEND_ALPHA             :: BlendMode.ALPHA;
BLEND_ADDITIVE          :: BlendMode.ADDITIVE;
BLEND_MULTIPLIED        :: BlendMode.MULTIPLIED;
BLEND_ADD_COLORS        :: BlendMode.ADD_COLORS;
BLEND_SUBTRACT_COLORS   :: BlendMode.SUBTRACT_COLORS;
BLEND_ALPHA_PREMULTIPLY :: BlendMode.ALPHA_PREMULTIPLY;
BLEND_CUSTOM            :: BlendMode.CUSTOM;
BLEND_CUSTOM_SEPARATE   :: BlendMode.CUSTOM_SEPARATE;

// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
Gesture :: enum s32 {
	NONE        :: 0;
	TAP         :: 1;
	DOUBLETAP   :: 2;
	HOLD        :: 4;
	DRAG        :: 8;
	SWIPE_RIGHT :: 16;
	SWIPE_LEFT  :: 32;
	SWIPE_UP    :: 64;
	SWIPE_DOWN  :: 128;
	PINCH_IN    :: 256;
	PINCH_OUT   :: 512;
}
GESTURE_NONE        :: Gesture.NONE;
GESTURE_TAP         :: Gesture.TAP;
GESTURE_DOUBLETAP   :: Gesture.DOUBLETAP;
GESTURE_HOLD        :: Gesture.HOLD;
GESTURE_DRAG        :: Gesture.DRAG;
GESTURE_SWIPE_RIGHT :: Gesture.SWIPE_RIGHT;
GESTURE_SWIPE_LEFT  :: Gesture.SWIPE_LEFT;
GESTURE_SWIPE_UP    :: Gesture.SWIPE_UP;
GESTURE_SWIPE_DOWN  :: Gesture.SWIPE_DOWN;
GESTURE_PINCH_IN    :: Gesture.PINCH_IN;
GESTURE_PINCH_OUT   :: Gesture.PINCH_OUT;

// Camera system modes
CameraMode :: enum s32 {
	CUSTOM       :: 0;
	FREE         :: 1;
	ORBITAL      :: 2;
	FIRST_PERSON :: 3;
	THIRD_PERSON :: 4;
}
CAMERA_CUSTOM       :: CameraMode.CUSTOM;
CAMERA_FREE         :: CameraMode.FREE;
CAMERA_ORBITAL      :: CameraMode.ORBITAL;
CAMERA_FIRST_PERSON :: CameraMode.FIRST_PERSON;
CAMERA_THIRD_PERSON :: CameraMode.THIRD_PERSON;

// Camera projection
CameraProjection :: enum u32 {
	PERSPECTIVE  :: 0;
	ORTHOGRAPHIC :: 1;
}
CAMERA_PERSPECTIVE  :: CameraProjection.PERSPECTIVE;
CAMERA_ORTHOGRAPHIC :: CameraProjection.ORTHOGRAPHIC;

// N-patch layout
NPatchLayout :: enum u32 {
	NINE_PATCH             :: 0;
	THREE_PATCH_VERTICAL   :: 1;
	THREE_PATCH_HORIZONTAL :: 2;
}
NPATCH_NINE_PATCH             :: NPatchLayout.NINE_PATCH;
NPATCH_THREE_PATCH_VERTICAL   :: NPatchLayout.THREE_PATCH_VERTICAL;
NPATCH_THREE_PATCH_HORIZONTAL :: NPatchLayout.THREE_PATCH_HORIZONTAL;

// Callbacks to hook some internal functions
// WARNING: These callbacks are intended for advance users
TraceLogCallback :: #type (logLevel: TraceLogLevel, text: *u8, args: va_list) -> void #c_call;
LoadFileDataCallback :: #type (fileName: *u8, bytesRead: *u32) -> *u8 #c_call;
SaveFileDataCallback :: #type (fileName: *u8, data: *void, bytesToWrite: u32) -> bool #c_call;
LoadFileTextCallback :: #type (fileName: *u8) -> *u8 #c_call;
SaveFileTextCallback :: #type (fileName: *u8, text: *u8) -> bool #c_call;

// Window-related functions
InitWindow :: (width: s32, height: s32, title: *u8) -> void #foreign raylib;
WindowShouldClose :: () -> bool #foreign raylib;
CloseWindow :: () -> void #foreign raylib "altCloseWindow";
IsWindowReady :: () -> bool #foreign raylib;
IsWindowFullscreen :: () -> bool #foreign raylib;
IsWindowHidden :: () -> bool #foreign raylib;
IsWindowMinimized :: () -> bool #foreign raylib;
IsWindowMaximized :: () -> bool #foreign raylib;
IsWindowFocused :: () -> bool #foreign raylib;
IsWindowResized :: () -> bool #foreign raylib;
IsWindowState :: (flag: u32) -> bool #foreign raylib;
SetWindowState :: (flags: u32) -> void #foreign raylib;
ClearWindowState :: (flags: u32) -> void #foreign raylib;
ToggleFullscreen :: () -> void #foreign raylib;
MaximizeWindow :: () -> void #foreign raylib;
MinimizeWindow :: () -> void #foreign raylib;
RestoreWindow :: () -> void #foreign raylib;
SetWindowIcon :: (image: Image) -> void #foreign raylib;
SetWindowIcons :: (images: *Image, count: s32) -> void #foreign raylib;
SetWindowTitle :: (title: *u8) -> void #foreign raylib;
SetWindowPosition :: (x: s32, y: s32) -> void #foreign raylib;
SetWindowMonitor :: (monitor: s32) -> void #foreign raylib;
SetWindowMinSize :: (width: s32, height: s32) -> void #foreign raylib;
SetWindowSize :: (width: s32, height: s32) -> void #foreign raylib;
SetWindowOpacity :: (opacity: float) -> void #foreign raylib;
GetWindowHandle :: () -> *void #foreign raylib;
GetScreenWidth :: () -> s32 #foreign raylib;
GetScreenHeight :: () -> s32 #foreign raylib;
GetRenderWidth :: () -> s32 #foreign raylib;
GetRenderHeight :: () -> s32 #foreign raylib;
GetMonitorCount :: () -> s32 #foreign raylib;
GetCurrentMonitor :: () -> s32 #foreign raylib;
GetMonitorPosition :: (monitor: s32) -> Vector2 #foreign raylib;
GetMonitorWidth :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorHeight :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorPhysicalWidth :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorPhysicalHeight :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorRefreshRate :: (monitor: s32) -> s32 #foreign raylib;
GetWindowPosition :: () -> Vector2 #foreign raylib;
GetWindowScaleDPI :: () -> Vector2 #foreign raylib;
GetMonitorName :: (monitor: s32) -> *u8 #foreign raylib;
SetClipboardText :: (text: *u8) -> void #foreign raylib;
GetClipboardText :: () -> *u8 #foreign raylib;
EnableEventWaiting :: () -> void #foreign raylib;
DisableEventWaiting :: () -> void #foreign raylib;

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
SwapScreenBuffer :: () -> void #foreign raylib;
PollInputEvents :: () -> void #foreign raylib;
WaitTime :: (seconds: float64) -> void #foreign raylib;

// Cursor-related functions
ShowCursor :: () -> void #foreign raylib "altShowCursor";
HideCursor :: () -> void #foreign raylib;
IsCursorHidden :: () -> bool #foreign raylib;
EnableCursor :: () -> void #foreign raylib;
DisableCursor :: () -> void #foreign raylib;
IsCursorOnScreen :: () -> bool #foreign raylib;

// Drawing-related functions
ClearBackground :: (color: Color) -> void #foreign raylib;
BeginDrawing :: () -> void #foreign raylib;
EndDrawing :: () -> void #foreign raylib;
BeginMode2D :: (camera: Camera2D) -> void #foreign raylib;
EndMode2D :: () -> void #foreign raylib;
BeginMode3D :: (camera: Camera3D) -> void #foreign raylib;
EndMode3D :: () -> void #foreign raylib;
BeginTextureMode :: (target: RenderTexture2D) -> void #foreign raylib;
EndTextureMode :: () -> void #foreign raylib;
BeginShaderMode :: (shader: Shader) -> void #foreign raylib;
EndShaderMode :: () -> void #foreign raylib;
BeginBlendMode :: (mode: s32) -> void #foreign raylib;
EndBlendMode :: () -> void #foreign raylib;
BeginScissorMode :: (x: s32, y: s32, width: s32, height: s32) -> void #foreign raylib;
EndScissorMode :: () -> void #foreign raylib;
BeginVrStereoMode :: (config: VrStereoConfig) -> void #foreign raylib;
EndVrStereoMode :: () -> void #foreign raylib;

// VR stereo config functions for VR simulator
LoadVrStereoConfig :: (device: VrDeviceInfo) -> VrStereoConfig #foreign raylib;
UnloadVrStereoConfig :: (config: VrStereoConfig) -> void #foreign raylib;

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
LoadShader :: (vsFileName: *u8, fsFileName: *u8) -> Shader #foreign raylib;
LoadShaderFromMemory :: (vsCode: *u8, fsCode: *u8) -> Shader #foreign raylib;
IsShaderReady :: (shader: Shader) -> bool #foreign raylib;
GetShaderLocation :: (shader: Shader, uniformName: *u8) -> s32 #foreign raylib;
GetShaderLocationAttrib :: (shader: Shader, attribName: *u8) -> s32 #foreign raylib;
SetShaderValue :: (shader: Shader, locIndex: s32, value: *void, uniformType: ShaderUniformDataType) -> void #foreign raylib;
SetShaderValueV :: (shader: Shader, locIndex: s32, value: *void, uniformType: ShaderUniformDataType, count: s32) -> void #foreign raylib;
SetShaderValueMatrix :: (shader: Shader, locIndex: s32, mat: Matrix) -> void #foreign raylib;
SetShaderValueTexture :: (shader: Shader, locIndex: s32, texture: Texture2D) -> void #foreign raylib;
UnloadShader :: (shader: Shader) -> void #foreign raylib;

// Screen-space-related functions
GetMouseRay :: (mousePosition: Vector2, camera: Camera) -> Ray #foreign raylib;
GetCameraMatrix :: (camera: Camera) -> Matrix #foreign raylib;
GetCameraMatrix2D :: (camera: Camera2D) -> Matrix #foreign raylib;
GetWorldToScreen :: (position: Vector3, camera: Camera) -> Vector2 #foreign raylib;
GetScreenToWorld2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raylib;
GetWorldToScreenEx :: (position: Vector3, camera: Camera, width: s32, height: s32) -> Vector2 #foreign raylib;
GetWorldToScreen2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raylib;

// Timing-related functions
SetTargetFPS :: (fps: s32) -> void #foreign raylib;
GetFPS :: () -> s32 #foreign raylib;
GetFrameTime :: () -> float #foreign raylib;
GetTime :: () -> float64 #foreign raylib;

// Misc. functions
GetRandomValue :: (min: s32, max: s32) -> s32 #foreign raylib;
SetRandomSeed :: (seed: u32) -> void #foreign raylib;
TakeScreenshot :: (fileName: *u8) -> void #foreign raylib;
SetConfigFlags :: (flags: u32) -> void #foreign raylib;

TraceLog_CFormat :: (logLevel: TraceLogLevel, text: *u8, __args: ..Any) -> void #foreign raylib "TraceLog";
TraceLog :: (logLevel: TraceLogLevel, text: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, text, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    TraceLog_CFormat(logLevel, "%s", formatted_text.data);
} @PrintLike
SetTraceLogLevel :: (logLevel: TraceLogLevel) -> void #foreign raylib;
MemAlloc :: (size: u32) -> *void #foreign raylib;
MemRealloc :: (ptr: *void, size: u32) -> *void #foreign raylib;
MemFree :: (ptr: *void) -> void #foreign raylib;

OpenURL :: (url: *u8) -> void #foreign raylib;

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users
SetTraceLogCallback :: (callback: TraceLogCallback) -> void #foreign raylib;
SetLoadFileDataCallback :: (callback: LoadFileDataCallback) -> void #foreign raylib;
SetSaveFileDataCallback :: (callback: SaveFileDataCallback) -> void #foreign raylib;
SetLoadFileTextCallback :: (callback: LoadFileTextCallback) -> void #foreign raylib;
SetSaveFileTextCallback :: (callback: SaveFileTextCallback) -> void #foreign raylib;

// Files management functions
LoadFileData :: (fileName: *u8, bytesRead: *u32) -> *u8 #foreign raylib;
UnloadFileData :: (data: *u8) -> void #foreign raylib;
SaveFileData :: (fileName: *u8, data: *void, bytesToWrite: u32) -> bool #foreign raylib;
ExportDataAsCode :: (data: *u8, size: u32, fileName: *u8) -> bool #foreign raylib;
LoadFileText :: (fileName: *u8) -> *u8 #foreign raylib;
UnloadFileText :: (text: *u8) -> void #foreign raylib;
SaveFileText :: (fileName: *u8, text: *u8) -> bool #foreign raylib;
FileExists :: (fileName: *u8) -> bool #foreign raylib;
DirectoryExists :: (dirPath: *u8) -> bool #foreign raylib;
IsFileExtension :: (fileName: *u8, ext: *u8) -> bool #foreign raylib;
GetFileLength :: (fileName: *u8) -> s32 #foreign raylib;
GetFileExtension :: (fileName: *u8) -> *u8 #foreign raylib;
GetFileName :: (filePath: *u8) -> *u8 #foreign raylib;
GetFileNameWithoutExt :: (filePath: *u8) -> *u8 #foreign raylib;
GetDirectoryPath :: (filePath: *u8) -> *u8 #foreign raylib;
GetPrevDirectoryPath :: (dirPath: *u8) -> *u8 #foreign raylib;
GetWorkingDirectory :: () -> *u8 #foreign raylib;
GetApplicationDirectory :: () -> *u8 #foreign raylib;
ChangeDirectory :: (dir: *u8) -> bool #foreign raylib;
IsPathFile :: (path: *u8) -> bool #foreign raylib;
LoadDirectoryFiles :: (dirPath: *u8) -> FilePathList #foreign raylib;
LoadDirectoryFilesEx :: (basePath: *u8, filter: *u8, scanSubdirs: bool) -> FilePathList #foreign raylib;
UnloadDirectoryFiles :: (files: FilePathList) -> void #foreign raylib;
IsFileDropped :: () -> bool #foreign raylib;
LoadDroppedFiles :: () -> FilePathList #foreign raylib;
UnloadDroppedFiles :: (files: FilePathList) -> void #foreign raylib;
GetFileModTime :: (fileName: *u8) -> s64 #foreign raylib;

// Compression/Encoding functionality
CompressData :: (data: *u8, dataSize: s32, compDataSize: *s32) -> *u8 #foreign raylib;
DecompressData :: (compData: *u8, compDataSize: s32, dataSize: *s32) -> *u8 #foreign raylib;
EncodeDataBase64 :: (data: *u8, dataSize: s32, outputSize: *s32) -> *u8 #foreign raylib;
DecodeDataBase64 :: (data: *u8, outputSize: *s32) -> *u8 #foreign raylib;

// Input-related functions: keyboard
IsKeyPressed :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyDown :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyReleased :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyUp :: (key: KeyboardKey) -> bool #foreign raylib;
SetExitKey :: (key: KeyboardKey) -> void #foreign raylib;
GetKeyPressed :: () -> KeyboardKey #foreign raylib;
GetCharPressed :: () -> KeyboardKey #foreign raylib;

// Input-related functions: gamepads
IsGamepadAvailable :: (gamepad: s32) -> bool #foreign raylib;
GetGamepadName :: (gamepad: s32) -> *u8 #foreign raylib;
IsGamepadButtonPressed :: (gamepad: s32, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonDown :: (gamepad: s32, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonReleased :: (gamepad: s32, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonUp :: (gamepad: s32, button: GamepadButton) -> bool #foreign raylib;
GetGamepadButtonPressed :: () -> GamepadButton #foreign raylib;
GetGamepadAxisCount :: (gamepad: s32) -> s32 #foreign raylib;
GetGamepadAxisMovement :: (gamepad: s32, axis: GamepadAxis) -> float #foreign raylib;
SetGamepadMappings :: (mappings: *u8) -> s32 #foreign raylib;

// Input-related functions: mouse
IsMouseButtonPressed :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonDown :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonReleased :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonUp :: (button: MouseButton) -> bool #foreign raylib;
GetMouseX :: () -> s32 #foreign raylib;
GetMouseY :: () -> s32 #foreign raylib;
GetMousePosition :: () -> Vector2 #foreign raylib;
GetMouseDelta :: () -> Vector2 #foreign raylib;
SetMousePosition :: (x: s32, y: s32) -> void #foreign raylib;
SetMouseOffset :: (offsetX: s32, offsetY: s32) -> void #foreign raylib;
SetMouseScale :: (scaleX: float, scaleY: float) -> void #foreign raylib;
GetMouseWheelMove :: () -> float #foreign raylib;
GetMouseWheelMoveV :: () -> Vector2 #foreign raylib;
SetMouseCursor :: (cursor: MouseCursor) -> void #foreign raylib;

// Input-related functions: touch
GetTouchX :: () -> s32 #foreign raylib;
GetTouchY :: () -> s32 #foreign raylib;
GetTouchPosition :: (index: s32) -> Vector2 #foreign raylib;
GetTouchPointId :: (index: s32) -> s32 #foreign raylib;
GetTouchPointCount :: () -> s32 #foreign raylib;

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------
SetGesturesEnabled :: (flags: Gesture) -> void #foreign raylib;
IsGestureDetected :: (gesture: Gesture) -> bool #foreign raylib;
GetGestureDetected :: () -> Gesture #foreign raylib;
GetGestureHoldDuration :: () -> float #foreign raylib;
GetGestureDragVector :: () -> Vector2 #foreign raylib;
GetGestureDragAngle :: () -> float #foreign raylib;
GetGesturePinchVector :: () -> Vector2 #foreign raylib;
GetGesturePinchAngle :: () -> float #foreign raylib;

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------
UpdateCamera :: (camera: *Camera, mode: CameraMode) -> void #foreign raylib;
UpdateCameraPro :: (camera: *Camera, movement: Vector3, rotation: Vector3, zoom: float) -> void #foreign raylib;

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------
// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
SetShapesTexture :: (texture: Texture2D, source: Rectangle) -> void #foreign raylib;


// Basic shapes drawing functions
DrawPixel :: (posX: s32, posY: s32, color: Color) -> void #foreign raylib;
DrawPixelV :: (position: Vector2, color: Color) -> void #foreign raylib;
DrawLine :: (startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) -> void #foreign raylib;
DrawLineV :: (startPos: Vector2, endPos: Vector2, color: Color) -> void #foreign raylib;
DrawLineEx :: (startPos: Vector2, endPos: Vector2, thick: float, color: Color) -> void #foreign raylib;
DrawLineBezier :: (startPos: Vector2, endPos: Vector2, thick: float, color: Color) -> void #foreign raylib;
DrawLineBezierQuad :: (startPos: Vector2, endPos: Vector2, controlPos: Vector2, thick: float, color: Color) -> void #foreign raylib;
DrawLineBezierCubic :: (startPos: Vector2, endPos: Vector2, startControlPos: Vector2, endControlPos: Vector2, thick: float, color: Color) -> void #foreign raylib;
DrawLineStrip :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raylib;
DrawCircle :: (centerX: s32, centerY: s32, radius: float, color: Color) -> void #foreign raylib;
DrawCircleSector :: (center: Vector2, radius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raylib;
DrawCircleSectorLines :: (center: Vector2, radius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raylib;
DrawCircleGradient :: (centerX: s32, centerY: s32, radius: float, color1: Color, color2: Color) -> void #foreign raylib;
DrawCircleV :: (center: Vector2, radius: float, color: Color) -> void #foreign raylib;
DrawCircleLines :: (centerX: s32, centerY: s32, radius: float, color: Color) -> void #foreign raylib;
DrawEllipse :: (centerX: s32, centerY: s32, radiusH: float, radiusV: float, color: Color) -> void #foreign raylib;
DrawEllipseLines :: (centerX: s32, centerY: s32, radiusH: float, radiusV: float, color: Color) -> void #foreign raylib;
DrawRing :: (center: Vector2, innerRadius: float, outerRadius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raylib;
DrawRingLines :: (center: Vector2, innerRadius: float, outerRadius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raylib;
DrawRectangle :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raylib;
DrawRectangleV :: (position: Vector2, size: Vector2, color: Color) -> void #foreign raylib;
DrawRectangleRec :: (rec: Rectangle, color: Color) -> void #foreign raylib;
DrawRectanglePro :: (rec: Rectangle, origin: Vector2, rotation: float, color: Color) -> void #foreign raylib;
DrawRectangleGradientV :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) -> void #foreign raylib;
DrawRectangleGradientH :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) -> void #foreign raylib;
DrawRectangleGradientEx :: (rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) -> void #foreign raylib;
DrawRectangleLines :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raylib;
DrawRectangleLinesEx :: (rec: Rectangle, lineThick: float, color: Color) -> void #foreign raylib;
DrawRectangleRounded :: (rec: Rectangle, roundness: float, segments: s32, color: Color) -> void #foreign raylib;
DrawRectangleRoundedLines :: (rec: Rectangle, roundness: float, segments: s32, lineThick: float, color: Color) -> void #foreign raylib;
DrawTriangle :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) -> void #foreign raylib;
DrawTriangleLines :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) -> void #foreign raylib;
DrawTriangleFan :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raylib;
DrawTriangleStrip :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raylib;
DrawPoly :: (center: Vector2, sides: s32, radius: float, rotation: float, color: Color) -> void #foreign raylib;
DrawPolyLines :: (center: Vector2, sides: s32, radius: float, rotation: float, color: Color) -> void #foreign raylib;
DrawPolyLinesEx :: (center: Vector2, sides: s32, radius: float, rotation: float, lineThick: float, color: Color) -> void #foreign raylib;

// Basic shapes collision detection functions
CheckCollisionRecs :: (rec1: Rectangle, rec2: Rectangle) -> bool #foreign raylib;
CheckCollisionCircles :: (center1: Vector2, radius1: float, center2: Vector2, radius2: float) -> bool #foreign raylib;
CheckCollisionCircleRec :: (center: Vector2, radius: float, rec: Rectangle) -> bool #foreign raylib;
CheckCollisionPointRec :: (point: Vector2, rec: Rectangle) -> bool #foreign raylib;
CheckCollisionPointCircle :: (point: Vector2, center: Vector2, radius: float) -> bool #foreign raylib;
CheckCollisionPointTriangle :: (point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) -> bool #foreign raylib;
CheckCollisionPointPoly :: (point: Vector2, points: *Vector2, pointCount: s32) -> bool #foreign raylib;
CheckCollisionLines :: (startPos1: Vector2, endPos1: Vector2, startPos2: Vector2, endPos2: Vector2, collisionPoint: *Vector2) -> bool #foreign raylib;
CheckCollisionPointLine :: (point: Vector2, p1: Vector2, p2: Vector2, threshold: s32) -> bool #foreign raylib;
GetCollisionRec :: (rec1: Rectangle, rec2: Rectangle) -> Rectangle #foreign raylib;

// Image loading functions
// NOTE: These functions do not require GPU access
LoadImage :: (fileName: *u8) -> Image #foreign raylib;
LoadImageRaw :: (fileName: *u8, width: s32, height: s32, format: s32, headerSize: s32) -> Image #foreign raylib;
LoadImageAnim :: (fileName: *u8, frames: *s32) -> Image #foreign raylib;
LoadImageFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32) -> Image #foreign raylib;
LoadImageFromTexture :: (texture: Texture2D) -> Image #foreign raylib;
LoadImageFromScreen :: () -> Image #foreign raylib;
IsImageReady :: (image: Image) -> bool #foreign raylib;
UnloadImage :: (image: Image) -> void #foreign raylib;
ExportImage :: (image: Image, fileName: *u8) -> bool #foreign raylib;
ExportImageAsCode :: (image: Image, fileName: *u8) -> bool #foreign raylib;

// Image generation functions
GenImageColor :: (width: s32, height: s32, color: Color) -> Image #foreign raylib;
GenImageGradientV :: (width: s32, height: s32, top: Color, bottom: Color) -> Image #foreign raylib;
GenImageGradientH :: (width: s32, height: s32, left: Color, right: Color) -> Image #foreign raylib;
GenImageGradientRadial :: (width: s32, height: s32, density: float, inner: Color, outer: Color) -> Image #foreign raylib;
GenImageChecked :: (width: s32, height: s32, checksX: s32, checksY: s32, col1: Color, col2: Color) -> Image #foreign raylib;
GenImageWhiteNoise :: (width: s32, height: s32, factor: float) -> Image #foreign raylib;
GenImagePerlinNoise :: (width: s32, height: s32, offsetX: s32, offsetY: s32, scale: float) -> Image #foreign raylib;
GenImageCellular :: (width: s32, height: s32, tileSize: s32) -> Image #foreign raylib;
GenImageText :: (width: s32, height: s32, text: *u8) -> Image #foreign raylib;

// Image manipulation functions
ImageCopy :: (image: Image) -> Image #foreign raylib;
ImageFromImage :: (image: Image, rec: Rectangle) -> Image #foreign raylib;
ImageText :: (text: *u8, fontSize: s32, color: Color) -> Image #foreign raylib;
ImageTextEx :: (font: Font, text: *u8, fontSize: float, spacing: float, tint: Color) -> Image #foreign raylib;
ImageFormat :: (image: *Image, newFormat: PixelFormat) -> void #foreign raylib;
ImageToPOT :: (image: *Image, fill: Color) -> void #foreign raylib;
ImageCrop :: (image: *Image, crop: Rectangle) -> void #foreign raylib;
ImageAlphaCrop :: (image: *Image, threshold: float) -> void #foreign raylib;
ImageAlphaClear :: (image: *Image, color: Color, threshold: float) -> void #foreign raylib;
ImageAlphaMask :: (image: *Image, alphaMask: Image) -> void #foreign raylib;
ImageAlphaPremultiply :: (image: *Image) -> void #foreign raylib;
ImageBlurGaussian :: (image: *Image, blurSize: s32) -> void #foreign raylib;
ImageResize :: (image: *Image, newWidth: s32, newHeight: s32) -> void #foreign raylib;
ImageResizeNN :: (image: *Image, newWidth: s32, newHeight: s32) -> void #foreign raylib;
ImageResizeCanvas :: (image: *Image, newWidth: s32, newHeight: s32, offsetX: s32, offsetY: s32, fill: Color) -> void #foreign raylib;
ImageMipmaps :: (image: *Image) -> void #foreign raylib;
ImageDither :: (image: *Image, rBpp: s32, gBpp: s32, bBpp: s32, aBpp: s32) -> void #foreign raylib;
ImageFlipVertical :: (image: *Image) -> void #foreign raylib;
ImageFlipHorizontal :: (image: *Image) -> void #foreign raylib;
ImageRotateCW :: (image: *Image) -> void #foreign raylib;
ImageRotateCCW :: (image: *Image) -> void #foreign raylib;
ImageColorTint :: (image: *Image, color: Color) -> void #foreign raylib;
ImageColorInvert :: (image: *Image) -> void #foreign raylib;
ImageColorGrayscale :: (image: *Image) -> void #foreign raylib;
ImageColorContrast :: (image: *Image, contrast: float) -> void #foreign raylib;
ImageColorBrightness :: (image: *Image, brightness: s32) -> void #foreign raylib;
ImageColorReplace :: (image: *Image, color: Color, replace: Color) -> void #foreign raylib;
LoadImageColors :: (image: Image) -> *Color #foreign raylib;
LoadImagePalette :: (image: Image, maxPaletteSize: s32, colorCount: *s32) -> *Color #foreign raylib;
UnloadImageColors :: (colors: *Color) -> void #foreign raylib;
UnloadImagePalette :: (colors: *Color) -> void #foreign raylib;
GetImageAlphaBorder :: (image: Image, threshold: float) -> Rectangle #foreign raylib;
GetImageColor :: (image: Image, x: s32, y: s32) -> Color #foreign raylib;

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
ImageClearBackground :: (dst: *Image, color: Color) -> void #foreign raylib;
ImageDrawPixel :: (dst: *Image, posX: s32, posY: s32, color: Color) -> void #foreign raylib;
ImageDrawPixelV :: (dst: *Image, position: Vector2, color: Color) -> void #foreign raylib;
ImageDrawLine :: (dst: *Image, startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) -> void #foreign raylib;
ImageDrawLineV :: (dst: *Image, start: Vector2, end: Vector2, color: Color) -> void #foreign raylib;
ImageDrawCircle :: (dst: *Image, centerX: s32, centerY: s32, radius: s32, color: Color) -> void #foreign raylib;
ImageDrawCircleV :: (dst: *Image, center: Vector2, radius: s32, color: Color) -> void #foreign raylib;
ImageDrawCircleLines :: (dst: *Image, centerX: s32, centerY: s32, radius: s32, color: Color) -> void #foreign raylib;
ImageDrawCircleLinesV :: (dst: *Image, center: Vector2, radius: s32, color: Color) -> void #foreign raylib;
ImageDrawRectangle :: (dst: *Image, posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raylib;
ImageDrawRectangleV :: (dst: *Image, position: Vector2, size: Vector2, color: Color) -> void #foreign raylib;
ImageDrawRectangleRec :: (dst: *Image, rec: Rectangle, color: Color) -> void #foreign raylib;
ImageDrawRectangleLines :: (dst: *Image, rec: Rectangle, thick: s32, color: Color) -> void #foreign raylib;
ImageDraw :: (dst: *Image, src: Image, srcRec: Rectangle, dstRec: Rectangle, tint: Color) -> void #foreign raylib;
ImageDrawText :: (dst: *Image, text: *u8, posX: s32, posY: s32, fontSize: s32, color: Color) -> void #foreign raylib;
ImageDrawTextEx :: (dst: *Image, font: Font, text: *u8, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raylib;

// Texture loading functions
// NOTE: These functions require GPU access
LoadTexture :: (fileName: *u8) -> Texture2D #foreign raylib;
LoadTextureFromImage :: (image: Image) -> Texture2D #foreign raylib;
LoadTextureCubemap :: (image: Image, layout: CubemapLayout) -> TextureCubemap #foreign raylib;
LoadRenderTexture :: (width: s32, height: s32) -> RenderTexture2D #foreign raylib;
IsTextureReady :: (texture: Texture2D) -> bool #foreign raylib;
UnloadTexture :: (texture: Texture2D) -> void #foreign raylib;
IsRenderTextureReady :: (target: RenderTexture2D) -> bool #foreign raylib;
UnloadRenderTexture :: (target: RenderTexture2D) -> void #foreign raylib;
UpdateTexture :: (texture: Texture2D, pixels: *void) -> void #foreign raylib;
UpdateTextureRec :: (texture: Texture2D, rec: Rectangle, pixels: *void) -> void #foreign raylib;

// Texture configuration functions
GenTextureMipmaps :: (texture: *Texture2D) -> void #foreign raylib;
SetTextureFilter :: (texture: Texture2D, filter: TextureFilter) -> void #foreign raylib;
SetTextureWrap :: (texture: Texture2D, wrap: TextureWrap) -> void #foreign raylib;

// Texture drawing functions
DrawTexture :: (texture: Texture2D, posX: s32, posY: s32, tint: Color) -> void #foreign raylib;
DrawTextureV :: (texture: Texture2D, position: Vector2, tint: Color) -> void #foreign raylib;
DrawTextureEx :: (texture: Texture2D, position: Vector2, rotation: float, scale: float, tint: Color) -> void #foreign raylib;
DrawTextureRec :: (texture: Texture2D, source: Rectangle, position: Vector2, tint: Color) -> void #foreign raylib;
DrawTexturePro :: (texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: float, tint: Color) -> void #foreign raylib;
DrawTextureNPatch :: (texture: Texture2D, nPatchInfo: NPatchInfo, dest: Rectangle, origin: Vector2, rotation: float, tint: Color) -> void #foreign raylib;

// Color/pixel related functions
Fade :: (color: Color, alpha: float) -> Color #foreign raylib;
ColorToInt :: (color: Color) -> s32 #foreign raylib;
ColorNormalize :: (color: Color) -> Vector4 #foreign raylib;
ColorFromNormalized :: (normalized: Vector4) -> Color #foreign raylib;
ColorToHSV :: (color: Color) -> Vector3 #foreign raylib;
ColorFromHSV :: (hue: float, saturation: float, value: float) -> Color #foreign raylib;
ColorTint :: (color: Color, tint: Color) -> Color #foreign raylib;
ColorBrightness :: (color: Color, factor: float) -> Color #foreign raylib;
ColorContrast :: (color: Color, contrast: float) -> Color #foreign raylib;
ColorAlpha :: (color: Color, alpha: float) -> Color #foreign raylib;
ColorAlphaBlend :: (dst: Color, src: Color, tint: Color) -> Color #foreign raylib;
GetColor :: (hexValue: u32) -> Color #foreign raylib;
GetPixelColor :: (srcPtr: *void, format: PixelFormat) -> Color #foreign raylib;
SetPixelColor :: (dstPtr: *void, color: Color, format: PixelFormat) -> void #foreign raylib;
GetPixelDataSize :: (width: s32, height: s32, format: s32) -> s32 #foreign raylib;

// Font loading/unloading functions
GetFontDefault :: () -> Font #foreign raylib;
LoadFont :: (fileName: *u8) -> Font #foreign raylib;
LoadFontEx :: (fileName: *u8, fontSize: s32, fontChars: *s32, glyphCount: s32) -> Font #foreign raylib;
LoadFontFromImage :: (image: Image, key: Color, firstChar: s32) -> Font #foreign raylib;
LoadFontFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32, fontSize: s32, fontChars: *s32, glyphCount: s32) -> Font #foreign raylib;
IsFontReady :: (font: Font) -> bool #foreign raylib;
LoadFontData :: (fileData: *u8, dataSize: s32, fontSize: s32, fontChars: *s32, glyphCount: s32, type: s32) -> *GlyphInfo #foreign raylib;
GenImageFontAtlas :: (chars: *GlyphInfo, recs: **Rectangle, glyphCount: s32, fontSize: s32, padding: s32, packMethod: s32) -> Image #foreign raylib;
UnloadFontData :: (chars: *GlyphInfo, glyphCount: s32) -> void #foreign raylib;
UnloadFont :: (font: Font) -> void #foreign raylib;
ExportFontAsCode :: (font: Font, fileName: *u8) -> bool #foreign raylib;

// Text drawing functions
DrawFPS :: (posX: s32, posY: s32) -> void #foreign raylib;
DrawText :: (text: *u8, posX: s32, posY: s32, fontSize: s32, color: Color) -> void #foreign raylib;
DrawTextEx :: (font: Font, text: *u8, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raylib;
DrawTextPro :: (font: Font, text: *u8, position: Vector2, origin: Vector2, rotation: float, fontSize: float, spacing: float, tint: Color) -> void #foreign raylib;
DrawTextCodepoint :: (font: Font, codepoint: s32, position: Vector2, fontSize: float, tint: Color) -> void #foreign raylib;
DrawTextCodepoints :: (font: Font, codepoints: *s32, count: s32, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raylib;

// Text font info functions
MeasureText :: (text: *u8, fontSize: s32) -> s32 #foreign raylib;
MeasureTextEx :: (font: Font, text: *u8, fontSize: float, spacing: float) -> Vector2 #foreign raylib;
GetGlyphIndex :: (font: Font, codepoint: s32) -> s32 #foreign raylib;
GetGlyphInfo :: (font: Font, codepoint: s32) -> GlyphInfo #foreign raylib;
GetGlyphAtlasRec :: (font: Font, codepoint: s32) -> Rectangle #foreign raylib;

// Text codepoints management functions (unicode characters)
LoadUTF8 :: (codepoints: *s32, length: s32) -> *u8 #foreign raylib;
UnloadUTF8 :: (text: *u8) -> void #foreign raylib;
LoadCodepoints :: (text: *u8, count: *s32) -> *s32 #foreign raylib;
UnloadCodepoints :: (codepoints: *s32) -> void #foreign raylib;
GetCodepointCount :: (text: *u8) -> s32 #foreign raylib;
GetCodepoint :: (text: *u8, codepointSize: *s32) -> s32 #foreign raylib;
GetCodepointNext :: (text: *u8, codepointSize: *s32) -> s32 #foreign raylib;
GetCodepointPrevious :: (text: *u8, codepointSize: *s32) -> s32 #foreign raylib;
CodepointToUTF8 :: (codepoint: s32, utf8Size: *s32) -> *u8 #foreign raylib;

// Text strings management functions (no UTF-8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
TextCopy :: (dst: *u8, src: *u8) -> s32 #foreign raylib;
TextIsEqual :: (text1: *u8, text2: *u8) -> bool #foreign raylib;
TextLength :: (text: *u8) -> u32 #foreign raylib;
TextFormat_CFormat :: (text: *u8, __args: ..Any) -> *u8 #foreign raylib "TextFormat";
TextFormat :: (text: string, __args: ..Any) -> *u8 {
	#import "Basic";
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, text, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return TextFormat_CFormat("%s", formatted_text.data);
} @PrintLike
TextSubtext :: (text: *u8, position: s32, length: s32) -> *u8 #foreign raylib;
TextReplace :: (text: *u8, replace: *u8, by: *u8) -> *u8 #foreign raylib;
TextInsert :: (text: *u8, insert: *u8, position: s32) -> *u8 #foreign raylib;
TextJoin :: (textList: **u8, count: s32, delimiter: *u8) -> *u8 #foreign raylib;
TextSplit :: (text: *u8, delimiter: u8, count: *s32) -> **u8 #foreign raylib;
TextAppend :: (text: *u8, append: *u8, position: *s32) -> void #foreign raylib;
TextFindIndex :: (text: *u8, find: *u8) -> s32 #foreign raylib;
TextToUpper :: (text: *u8) -> *u8 #foreign raylib;
TextToLower :: (text: *u8) -> *u8 #foreign raylib;
TextToPascal :: (text: *u8) -> *u8 #foreign raylib;
TextToInteger :: (text: *u8) -> s32 #foreign raylib;

// Basic geometric 3D shapes drawing functions
DrawLine3D :: (startPos: Vector3, endPos: Vector3, color: Color) -> void #foreign raylib;
DrawPoint3D :: (position: Vector3, color: Color) -> void #foreign raylib;
DrawCircle3D :: (center: Vector3, radius: float, rotationAxis: Vector3, rotationAngle: float, color: Color) -> void #foreign raylib;
DrawTriangle3D :: (v1: Vector3, v2: Vector3, v3: Vector3, color: Color) -> void #foreign raylib;
DrawTriangleStrip3D :: (points: *Vector3, pointCount: s32, color: Color) -> void #foreign raylib;
DrawCube :: (position: Vector3, width: float, height: float, length: float, color: Color) -> void #foreign raylib;
DrawCubeV :: (position: Vector3, size: Vector3, color: Color) -> void #foreign raylib;
DrawCubeWires :: (position: Vector3, width: float, height: float, length: float, color: Color) -> void #foreign raylib;
DrawCubeWiresV :: (position: Vector3, size: Vector3, color: Color) -> void #foreign raylib;
DrawSphere :: (centerPos: Vector3, radius: float, color: Color) -> void #foreign raylib;
DrawSphereEx :: (centerPos: Vector3, radius: float, rings: s32, slices: s32, color: Color) -> void #foreign raylib;
DrawSphereWires :: (centerPos: Vector3, radius: float, rings: s32, slices: s32, color: Color) -> void #foreign raylib;
DrawCylinder :: (position: Vector3, radiusTop: float, radiusBottom: float, height: float, slices: s32, color: Color) -> void #foreign raylib;
DrawCylinderEx :: (startPos: Vector3, endPos: Vector3, startRadius: float, endRadius: float, sides: s32, color: Color) -> void #foreign raylib;
DrawCylinderWires :: (position: Vector3, radiusTop: float, radiusBottom: float, height: float, slices: s32, color: Color) -> void #foreign raylib;
DrawCylinderWiresEx :: (startPos: Vector3, endPos: Vector3, startRadius: float, endRadius: float, sides: s32, color: Color) -> void #foreign raylib;
DrawCapsule :: (startPos: Vector3, endPos: Vector3, radius: float, slices: s32, rings: s32, color: Color) -> void #foreign raylib;
DrawCapsuleWires :: (startPos: Vector3, endPos: Vector3, radius: float, slices: s32, rings: s32, color: Color) -> void #foreign raylib;
DrawPlane :: (centerPos: Vector3, size: Vector2, color: Color) -> void #foreign raylib;
DrawRay :: (ray: Ray, color: Color) -> void #foreign raylib;
DrawGrid :: (slices: s32, spacing: float) -> void #foreign raylib;

// Model management functions
LoadModel :: (fileName: *u8) -> Model #foreign raylib;
LoadModelFromMesh :: (mesh: Mesh) -> Model #foreign raylib;
IsModelReady :: (model: Model) -> bool #foreign raylib;
UnloadModel :: (model: Model) -> void #foreign raylib;
GetModelBoundingBox :: (model: Model) -> BoundingBox #foreign raylib;

// Model drawing functions
DrawModel :: (model: Model, position: Vector3, scale: float, tint: Color) -> void #foreign raylib;
DrawModelEx :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float, scale: Vector3, tint: Color) -> void #foreign raylib;
DrawModelWires :: (model: Model, position: Vector3, scale: float, tint: Color) -> void #foreign raylib;
DrawModelWiresEx :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float, scale: Vector3, tint: Color) -> void #foreign raylib;
DrawBoundingBox :: (box: BoundingBox, color: Color) -> void #foreign raylib;
DrawBillboard :: (camera: Camera, texture: Texture2D, position: Vector3, size: float, tint: Color) -> void #foreign raylib;
DrawBillboardRec :: (camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, size: Vector2, tint: Color) -> void #foreign raylib;
DrawBillboardPro :: (camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, up: Vector3, size: Vector2, origin: Vector2, rotation: float, tint: Color) -> void #foreign raylib;

// Mesh management functions
UploadMesh :: (mesh: *Mesh, dynamic: bool) -> void #foreign raylib;
UpdateMeshBuffer :: (mesh: Mesh, index: s32, data: *void, dataSize: s32, offset: s32) -> void #foreign raylib;
UnloadMesh :: (mesh: Mesh) -> void #foreign raylib;
DrawMesh :: (mesh: Mesh, material: Material, transform: Matrix) -> void #foreign raylib;
DrawMeshInstanced :: (mesh: Mesh, material: Material, transforms: *Matrix, instances: s32) -> void #foreign raylib;
ExportMesh :: (mesh: Mesh, fileName: *u8) -> bool #foreign raylib;
GetMeshBoundingBox :: (mesh: Mesh) -> BoundingBox #foreign raylib;
GenMeshTangents :: (mesh: *Mesh) -> void #foreign raylib;

// Mesh generation functions
GenMeshPoly :: (sides: s32, radius: float) -> Mesh #foreign raylib;
GenMeshPlane :: (width: float, length: float, resX: s32, resZ: s32) -> Mesh #foreign raylib;
GenMeshCube :: (width: float, height: float, length: float) -> Mesh #foreign raylib;
GenMeshSphere :: (radius: float, rings: s32, slices: s32) -> Mesh #foreign raylib;
GenMeshHemiSphere :: (radius: float, rings: s32, slices: s32) -> Mesh #foreign raylib;
GenMeshCylinder :: (radius: float, height: float, slices: s32) -> Mesh #foreign raylib;
GenMeshCone :: (radius: float, height: float, slices: s32) -> Mesh #foreign raylib;
GenMeshTorus :: (radius: float, size: float, radSeg: s32, sides: s32) -> Mesh #foreign raylib;
GenMeshKnot :: (radius: float, size: float, radSeg: s32, sides: s32) -> Mesh #foreign raylib;
GenMeshHeightmap :: (heightmap: Image, size: Vector3) -> Mesh #foreign raylib;
GenMeshCubicmap :: (cubicmap: Image, cubeSize: Vector3) -> Mesh #foreign raylib;

// Material loading/unloading functions
LoadMaterials :: (fileName: *u8, materialCount: *s32) -> *Material #foreign raylib;
LoadMaterialDefault :: () -> Material #foreign raylib;
IsMaterialReady :: (material: Material) -> bool #foreign raylib;
UnloadMaterial :: (material: Material) -> void #foreign raylib;
SetMaterialTexture :: (material: *Material, mapType: s32, texture: Texture2D) -> void #foreign raylib;
SetModelMeshMaterial :: (model: *Model, meshId: s32, materialId: s32) -> void #foreign raylib;

// Model animations loading/unloading functions
LoadModelAnimations :: (fileName: *u8, animCount: *u32) -> *ModelAnimation #foreign raylib;
UpdateModelAnimation :: (model: Model, anim: ModelAnimation, frame: s32) -> void #foreign raylib;
UnloadModelAnimation :: (anim: ModelAnimation) -> void #foreign raylib;
UnloadModelAnimations :: (animations: *ModelAnimation, count: u32) -> void #foreign raylib;
IsModelAnimationValid :: (model: Model, anim: ModelAnimation) -> bool #foreign raylib;

// Collision detection functions
CheckCollisionSpheres :: (center1: Vector3, radius1: float, center2: Vector3, radius2: float) -> bool #foreign raylib;
CheckCollisionBoxes :: (box1: BoundingBox, box2: BoundingBox) -> bool #foreign raylib;
CheckCollisionBoxSphere :: (box: BoundingBox, center: Vector3, radius: float) -> bool #foreign raylib;
GetRayCollisionSphere :: (ray: Ray, center: Vector3, radius: float) -> RayCollision #foreign raylib;
GetRayCollisionBox :: (ray: Ray, box: BoundingBox) -> RayCollision #foreign raylib;
GetRayCollisionMesh :: (ray: Ray, mesh: Mesh, transform: Matrix) -> RayCollision #foreign raylib;
GetRayCollisionTriangle :: (ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) -> RayCollision #foreign raylib;
GetRayCollisionQuad :: (ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3, p4: Vector3) -> RayCollision #foreign raylib;

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
AudioCallback :: #type (bufferData: *void, frames: u32) -> void #c_call;

// Audio device management functions
InitAudioDevice :: () -> void #foreign raylib;
CloseAudioDevice :: () -> void #foreign raylib;
IsAudioDeviceReady :: () -> bool #foreign raylib;
SetMasterVolume :: (volume: float) -> void #foreign raylib;

// Wave/Sound loading/unloading functions
LoadWave :: (fileName: *u8) -> Wave #foreign raylib;
LoadWaveFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32) -> Wave #foreign raylib;
IsWaveReady :: (wave: Wave) -> bool #foreign raylib;
LoadSound :: (fileName: *u8) -> Sound #foreign raylib;
LoadSoundFromWave :: (wave: Wave) -> Sound #foreign raylib;
IsSoundReady :: (sound: Sound) -> bool #foreign raylib;
UpdateSound :: (sound: Sound, data: *void, sampleCount: s32) -> void #foreign raylib;
UnloadWave :: (wave: Wave) -> void #foreign raylib;
UnloadSound :: (sound: Sound) -> void #foreign raylib;
ExportWave :: (wave: Wave, fileName: *u8) -> bool #foreign raylib;
ExportWaveAsCode :: (wave: Wave, fileName: *u8) -> bool #foreign raylib;

// Wave/Sound management functions
PlaySound :: (sound: Sound) -> void #foreign raylib;
StopSound :: (sound: Sound) -> void #foreign raylib;
PauseSound :: (sound: Sound) -> void #foreign raylib;
ResumeSound :: (sound: Sound) -> void #foreign raylib;
IsSoundPlaying :: (sound: Sound) -> bool #foreign raylib;
SetSoundVolume :: (sound: Sound, volume: float) -> void #foreign raylib;
SetSoundPitch :: (sound: Sound, pitch: float) -> void #foreign raylib;
SetSoundPan :: (sound: Sound, pan: float) -> void #foreign raylib;
WaveCopy :: (wave: Wave) -> Wave #foreign raylib;
WaveCrop :: (wave: *Wave, initSample: s32, finalSample: s32) -> void #foreign raylib;
WaveFormat :: (wave: *Wave, sampleRate: s32, sampleSize: s32, channels: s32) -> void #foreign raylib;
LoadWaveSamples :: (wave: Wave) -> *float #foreign raylib;
UnloadWaveSamples :: (samples: *float) -> void #foreign raylib;

// Music management functions
LoadMusicStream :: (fileName: *u8) -> Music #foreign raylib;
LoadMusicStreamFromMemory :: (fileType: *u8, data: *u8, dataSize: s32) -> Music #foreign raylib;
IsMusicReady :: (music: Music) -> bool #foreign raylib;
UnloadMusicStream :: (music: Music) -> void #foreign raylib;
PlayMusicStream :: (music: Music) -> void #foreign raylib;
IsMusicStreamPlaying :: (music: Music) -> bool #foreign raylib;
UpdateMusicStream :: (music: Music) -> void #foreign raylib;
StopMusicStream :: (music: Music) -> void #foreign raylib;
PauseMusicStream :: (music: Music) -> void #foreign raylib;
ResumeMusicStream :: (music: Music) -> void #foreign raylib;
SeekMusicStream :: (music: Music, position: float) -> void #foreign raylib;
SetMusicVolume :: (music: Music, volume: float) -> void #foreign raylib;
SetMusicPitch :: (music: Music, pitch: float) -> void #foreign raylib;
SetMusicPan :: (music: Music, pan: float) -> void #foreign raylib;
GetMusicTimeLength :: (music: Music) -> float #foreign raylib;
GetMusicTimePlayed :: (music: Music) -> float #foreign raylib;

// AudioStream management functions
LoadAudioStream :: (sampleRate: u32, sampleSize: u32, channels: u32) -> AudioStream #foreign raylib;
IsAudioStreamReady :: (stream: AudioStream) -> bool #foreign raylib;
UnloadAudioStream :: (stream: AudioStream) -> void #foreign raylib;
UpdateAudioStream :: (stream: AudioStream, data: *void, frameCount: s32) -> void #foreign raylib;
IsAudioStreamProcessed :: (stream: AudioStream) -> bool #foreign raylib;
PlayAudioStream :: (stream: AudioStream) -> void #foreign raylib;
PauseAudioStream :: (stream: AudioStream) -> void #foreign raylib;
ResumeAudioStream :: (stream: AudioStream) -> void #foreign raylib;
IsAudioStreamPlaying :: (stream: AudioStream) -> bool #foreign raylib;
StopAudioStream :: (stream: AudioStream) -> void #foreign raylib;
SetAudioStreamVolume :: (stream: AudioStream, volume: float) -> void #foreign raylib;
SetAudioStreamPitch :: (stream: AudioStream, pitch: float) -> void #foreign raylib;
SetAudioStreamPan :: (stream: AudioStream, pan: float) -> void #foreign raylib;
SetAudioStreamBufferSizeDefault :: (size: s32) -> void #foreign raylib;
SetAudioStreamCallback :: (stream: AudioStream, callback: AudioCallback) -> void #foreign raylib;

AttachAudioStreamProcessor :: (stream: AudioStream, processor: AudioCallback) -> void #foreign raylib;
DetachAudioStreamProcessor :: (stream: AudioStream, processor: AudioCallback) -> void #foreign raylib;

AttachAudioMixedProcessor :: (processor: AudioCallback) -> void #foreign raylib;
DetachAudioMixedProcessor :: (processor: AudioCallback) -> void #foreign raylib;

// Dynamic vertex buffers (position + texcoords + colors + indices arrays)
VertexBuffer :: struct {
	elementCount: s32; // Number of elements in the buffer (QUADS)

	vertices:     *float; // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
	texcoords:    *float; // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
	colors:       *u8; // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)

	indices:      *u32; // Vertex indices (in case vertex data comes indexed) (6 indices per quad)

	vaoId:        u32; // OpenGL Vertex Array Object id
	vboId:        [4] u32; // OpenGL Vertex Buffer Objects id (4 types of vertex data)
}

// Draw call type
// NOTE: Only texture changes register a new draw, other state-change-related elements are not
// used at this moment (vaoId, shaderId, matrices), raylib just forces a batch draw call if any
// of those state-change happens (this is done in core module)
DrawCall :: struct {
	mode:            s32; // Drawing mode: LINES, TRIANGLES, QUADS
	vertexCount:     s32; // Number of vertex of the draw
	vertexAlignment: s32; // Number of vertex required for index alignment (LINES, TRIANGLES)

	textureId:       u32; // Texture id to be used on the draw -> Use to create new draw call if changes
}

// rlRenderBatch type
RenderBatch :: struct {
	bufferCount:   s32; // Number of vertex buffers (multi-buffering support)
	currentBuffer: s32; // Current buffer tracking in case of multi-buffering
	vertexBuffer:  *VertexBuffer; // Dynamic buffer(s) for vertex data

	draws:         *DrawCall; // Draw calls array, depends on textureId
	drawCounter:   s32; // Draw calls counter
	currentDepth:  float; // Current depth value for next draw
}

// OpenGL version
GlVersion :: enum u32 {
	_11   :: 1;
	_21   :: 2;
	_33   :: 3;
	_43   :: 4;
	ES_20 :: 5;
}
RL_OPENGL_11    :: GlVersion._11;
RL_OPENGL_21    :: GlVersion._21;
RL_OPENGL_33    :: GlVersion._33;
RL_OPENGL_43    :: GlVersion._43;
RL_OPENGL_ES_20 :: GlVersion.ES_20;

// Framebuffer attachment type
// NOTE: By default up to 8 color channels defined, but it can be more
FramebufferAttachType :: enum u32 {
	COLOR_CHANNEL0 :: 0;
	COLOR_CHANNEL1 :: 1;
	COLOR_CHANNEL2 :: 2;
	COLOR_CHANNEL3 :: 3;
	COLOR_CHANNEL4 :: 4;
	COLOR_CHANNEL5 :: 5;
	COLOR_CHANNEL6 :: 6;
	COLOR_CHANNEL7 :: 7;
	DEPTH          :: 100;
	STENCIL        :: 200;
}
RL_ATTACHMENT_COLOR_CHANNEL0 :: FramebufferAttachType.COLOR_CHANNEL0;
RL_ATTACHMENT_COLOR_CHANNEL1 :: FramebufferAttachType.COLOR_CHANNEL1;
RL_ATTACHMENT_COLOR_CHANNEL2 :: FramebufferAttachType.COLOR_CHANNEL2;
RL_ATTACHMENT_COLOR_CHANNEL3 :: FramebufferAttachType.COLOR_CHANNEL3;
RL_ATTACHMENT_COLOR_CHANNEL4 :: FramebufferAttachType.COLOR_CHANNEL4;
RL_ATTACHMENT_COLOR_CHANNEL5 :: FramebufferAttachType.COLOR_CHANNEL5;
RL_ATTACHMENT_COLOR_CHANNEL6 :: FramebufferAttachType.COLOR_CHANNEL6;
RL_ATTACHMENT_COLOR_CHANNEL7 :: FramebufferAttachType.COLOR_CHANNEL7;
RL_ATTACHMENT_DEPTH          :: FramebufferAttachType.DEPTH;
RL_ATTACHMENT_STENCIL        :: FramebufferAttachType.STENCIL;

// Framebuffer texture attachment type
FramebufferAttachTextureType :: enum u32 {
	CUBEMAP_POSITIVE_X :: 0;
	CUBEMAP_NEGATIVE_X :: 1;
	CUBEMAP_POSITIVE_Y :: 2;
	CUBEMAP_NEGATIVE_Y :: 3;
	CUBEMAP_POSITIVE_Z :: 4;
	CUBEMAP_NEGATIVE_Z :: 5;
	TEXTURE2D          :: 100;
	RENDERBUFFER       :: 200;
}
RL_ATTACHMENT_CUBEMAP_POSITIVE_X :: FramebufferAttachTextureType.CUBEMAP_POSITIVE_X;
RL_ATTACHMENT_CUBEMAP_NEGATIVE_X :: FramebufferAttachTextureType.CUBEMAP_NEGATIVE_X;
RL_ATTACHMENT_CUBEMAP_POSITIVE_Y :: FramebufferAttachTextureType.CUBEMAP_POSITIVE_Y;
RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y :: FramebufferAttachTextureType.CUBEMAP_NEGATIVE_Y;
RL_ATTACHMENT_CUBEMAP_POSITIVE_Z :: FramebufferAttachTextureType.CUBEMAP_POSITIVE_Z;
RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z :: FramebufferAttachTextureType.CUBEMAP_NEGATIVE_Z;
RL_ATTACHMENT_TEXTURE2D          :: FramebufferAttachTextureType.TEXTURE2D;
RL_ATTACHMENT_RENDERBUFFER       :: FramebufferAttachTextureType.RENDERBUFFER;

// Face culling mode
CullMode :: enum u32 {
	FRONT :: 0;
	BACK  :: 1;
}
RL_CULL_FACE_FRONT :: CullMode.FRONT;
RL_CULL_FACE_BACK  :: CullMode.BACK;

MatrixMode :: (mode: s32) -> void #foreign raylib "rlMatrixMode";
PushMatrix :: () -> void #foreign raylib "rlPushMatrix";
PopMatrix :: () -> void #foreign raylib "rlPopMatrix";
LoadIdentity :: () -> void #foreign raylib "rlLoadIdentity";
Translatef :: (x: float, y: float, z: float) -> void #foreign raylib "rlTranslatef";
Rotatef :: (angle: float, x: float, y: float, z: float) -> void #foreign raylib "rlRotatef";
Scalef :: (x: float, y: float, z: float) -> void #foreign raylib "rlScalef";
MultMatrixf :: (matf: *float) -> void #foreign raylib "rlMultMatrixf";
Frustum :: (left: float64, right: float64, bottom: float64, top: float64, znear: float64, zfar: float64) -> void #foreign raylib "rlFrustum";
Ortho :: (left: float64, right: float64, bottom: float64, top: float64, znear: float64, zfar: float64) -> void #foreign raylib "rlOrtho";
Viewport :: (x: s32, y: s32, width: s32, height: s32) -> void #foreign raylib "rlViewport";

//------------------------------------------------------------------------------------
// Functions Declaration - Vertex level operations
//------------------------------------------------------------------------------------
Begin :: (mode: s32) -> void #foreign raylib "rlBegin";
End :: () -> void #foreign raylib "rlEnd";
Vertex2i :: (x: s32, y: s32) -> void #foreign raylib "rlVertex2i";
Vertex2f :: (x: float, y: float) -> void #foreign raylib "rlVertex2f";
Vertex3f :: (x: float, y: float, z: float) -> void #foreign raylib "rlVertex3f";
TexCoord2f :: (x: float, y: float) -> void #foreign raylib "rlTexCoord2f";
Normal3f :: (x: float, y: float, z: float) -> void #foreign raylib "rlNormal3f";
Color4ub :: (r: u8, g: u8, b: u8, a: u8) -> void #foreign raylib "rlColor4ub";
Color3f :: (x: float, y: float, z: float) -> void #foreign raylib "rlColor3f";
Color4f :: (x: float, y: float, z: float, w: float) -> void #foreign raylib "rlColor4f";

// Vertex buffers state
EnableVertexArray :: (vaoId: u32) -> bool #foreign raylib "rlEnableVertexArray";
DisableVertexArray :: () -> void #foreign raylib "rlDisableVertexArray";
EnableVertexBuffer :: (id: u32) -> void #foreign raylib "rlEnableVertexBuffer";
DisableVertexBuffer :: () -> void #foreign raylib "rlDisableVertexBuffer";
EnableVertexBufferElement :: (id: u32) -> void #foreign raylib "rlEnableVertexBufferElement";
DisableVertexBufferElement :: () -> void #foreign raylib "rlDisableVertexBufferElement";
EnableVertexAttribute :: (index: u32) -> void #foreign raylib "rlEnableVertexAttribute";
DisableVertexAttribute :: (index: u32) -> void #foreign raylib "rlDisableVertexAttribute";

// Textures state
ActiveTextureSlot :: (slot: s32) -> void #foreign raylib "rlActiveTextureSlot";
EnableTexture :: (id: u32) -> void #foreign raylib "rlEnableTexture";
DisableTexture :: () -> void #foreign raylib "rlDisableTexture";
EnableTextureCubemap :: (id: u32) -> void #foreign raylib "rlEnableTextureCubemap";
DisableTextureCubemap :: () -> void #foreign raylib "rlDisableTextureCubemap";
TextureParameters :: (id: u32, param: s32, value: s32) -> void #foreign raylib "rlTextureParameters";
CubemapParameters :: (id: u32, param: s32, value: s32) -> void #foreign raylib "rlCubemapParameters";

// Shader state
EnableShader :: (id: u32) -> void #foreign raylib "rlEnableShader";
DisableShader :: () -> void #foreign raylib "rlDisableShader";

// Framebuffer state
EnableFramebuffer :: (id: u32) -> void #foreign raylib "rlEnableFramebuffer";
DisableFramebuffer :: () -> void #foreign raylib "rlDisableFramebuffer";
ActiveDrawBuffers :: (count: s32) -> void #foreign raylib "rlActiveDrawBuffers";

// General render state
EnableColorBlend :: () -> void #foreign raylib "rlEnableColorBlend";
DisableColorBlend :: () -> void #foreign raylib "rlDisableColorBlend";
EnableDepthTest :: () -> void #foreign raylib "rlEnableDepthTest";
DisableDepthTest :: () -> void #foreign raylib "rlDisableDepthTest";
EnableDepthMask :: () -> void #foreign raylib "rlEnableDepthMask";
DisableDepthMask :: () -> void #foreign raylib "rlDisableDepthMask";
EnableBackfaceCulling :: () -> void #foreign raylib "rlEnableBackfaceCulling";
DisableBackfaceCulling :: () -> void #foreign raylib "rlDisableBackfaceCulling";
SetCullFace :: (mode: CullMode) -> void #foreign raylib "rlSetCullFace";
EnableScissorTest :: () -> void #foreign raylib "rlEnableScissorTest";
DisableScissorTest :: () -> void #foreign raylib "rlDisableScissorTest";
Scissor :: (x: s32, y: s32, width: s32, height: s32) -> void #foreign raylib "rlScissor";
EnableWireMode :: () -> void #foreign raylib "rlEnableWireMode";
DisableWireMode :: () -> void #foreign raylib "rlDisableWireMode";
SetLineWidth :: (width: float) -> void #foreign raylib "rlSetLineWidth";
GetLineWidth :: () -> float #foreign raylib "rlGetLineWidth";
EnableSmoothLines :: () -> void #foreign raylib "rlEnableSmoothLines";
DisableSmoothLines :: () -> void #foreign raylib "rlDisableSmoothLines";
EnableStereoRender :: () -> void #foreign raylib "rlEnableStereoRender";
DisableStereoRender :: () -> void #foreign raylib "rlDisableStereoRender";
IsStereoRenderEnabled :: () -> bool #foreign raylib "rlIsStereoRenderEnabled";

ClearColor :: (r: u8, g: u8, b: u8, a: u8) -> void #foreign raylib "rlClearColor";
ClearScreenBuffers :: () -> void #foreign raylib "rlClearScreenBuffers";
CheckErrors :: () -> void #foreign raylib "rlCheckErrors";
SetBlendMode :: (mode: BlendMode) -> void #foreign raylib "rlSetBlendMode";
SetBlendFactors :: (glSrcFactor: s32, glDstFactor: s32, glEquation: s32) -> void #foreign raylib "rlSetBlendFactors";
SetBlendFactorsSeparate :: (glSrcRGB: s32, glDstRGB: s32, glSrcAlpha: s32, glDstAlpha: s32, glEqRGB: s32, glEqAlpha: s32) -> void #foreign raylib "rlSetBlendFactorsSeparate";

//------------------------------------------------------------------------------------
// Functions Declaration - rlgl functionality
//------------------------------------------------------------------------------------
// rlgl initialization functions
get_rlgl_ptr :: () -> *RLGL_Data {
    getRlglPtr :: () -> *void #foreign raylib;
    return xx getRlglPtr();
}

getRlglPtr :: () -> *void #foreign raylib;
glInit :: (width: s32, height: s32) -> void #foreign raylib "rlglInit";
glClose :: () -> void #foreign raylib "rlglClose";
LoadExtensions :: (loader: *void) -> void #foreign raylib "rlLoadExtensions";
GetVersion :: () -> s32 #foreign raylib "rlGetVersion";
SetFramebufferWidth :: (width: s32) -> void #foreign raylib "rlSetFramebufferWidth";
GetFramebufferWidth :: () -> s32 #foreign raylib "rlGetFramebufferWidth";
SetFramebufferHeight :: (height: s32) -> void #foreign raylib "rlSetFramebufferHeight";
GetFramebufferHeight :: () -> s32 #foreign raylib "rlGetFramebufferHeight";

GetTextureIdDefault :: () -> u32 #foreign raylib "rlGetTextureIdDefault";
GetShaderIdDefault :: () -> u32 #foreign raylib "rlGetShaderIdDefault";
GetShaderLocsDefault :: () -> *s32 #foreign raylib "rlGetShaderLocsDefault";

// Render batch management
// NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode
// but this render batch API is exposed in case of custom batches are required
LoadRenderBatch :: (numBuffers: s32, bufferElements: s32) -> RenderBatch #foreign raylib "rlLoadRenderBatch";
UnloadRenderBatch :: (batch: RenderBatch) -> void #foreign raylib "rlUnloadRenderBatch";
DrawRenderBatch :: (batch: *RenderBatch) -> void #foreign raylib "rlDrawRenderBatch";
SetRenderBatchActive :: (batch: *RenderBatch) -> void #foreign raylib "rlSetRenderBatchActive";
DrawRenderBatchActive :: () -> void #foreign raylib "rlDrawRenderBatchActive";
CheckRenderBatchLimit :: (vCount: s32) -> bool #foreign raylib "rlCheckRenderBatchLimit";

SetTexture :: (id: u32) -> void #foreign raylib "rlSetTexture";

// Vertex buffers management
LoadVertexArray :: () -> u32 #foreign raylib "rlLoadVertexArray";
LoadVertexBuffer :: (buffer: *void, size: s32, dynamic: bool) -> u32 #foreign raylib "rlLoadVertexBuffer";
LoadVertexBufferElement :: (buffer: *void, size: s32, dynamic: bool) -> u32 #foreign raylib "rlLoadVertexBufferElement";
UpdateVertexBuffer :: (bufferId: u32, data: *void, dataSize: s32, offset: s32) -> void #foreign raylib "rlUpdateVertexBuffer";
UpdateVertexBufferElements :: (id: u32, data: *void, dataSize: s32, offset: s32) -> void #foreign raylib "rlUpdateVertexBufferElements";
UnloadVertexArray :: (vaoId: u32) -> void #foreign raylib "rlUnloadVertexArray";
UnloadVertexBuffer :: (vboId: u32) -> void #foreign raylib "rlUnloadVertexBuffer";
SetVertexAttribute :: (index: u32, compSize: s32, type: s32, normalized: bool, stride: s32, pointer: *void) -> void #foreign raylib "rlSetVertexAttribute";
SetVertexAttributeDivisor :: (index: u32, divisor: s32) -> void #foreign raylib "rlSetVertexAttributeDivisor";
SetVertexAttributeDefault :: (locIndex: s32, value: *void, attribType: s32, count: s32) -> void #foreign raylib "rlSetVertexAttributeDefault";
DrawVertexArray :: (offset: s32, count: s32) -> void #foreign raylib "rlDrawVertexArray";
DrawVertexArrayElements :: (offset: s32, count: s32, buffer: *void) -> void #foreign raylib "rlDrawVertexArrayElements";
DrawVertexArrayInstanced :: (offset: s32, count: s32, instances: s32) -> void #foreign raylib "rlDrawVertexArrayInstanced";
DrawVertexArrayElementsInstanced :: (offset: s32, count: s32, buffer: *void, instances: s32) -> void #foreign raylib "rlDrawVertexArrayElementsInstanced";

// Textures management
LoadTexture :: (data: *void, width: s32, height: s32, format: s32, mipmapCount: s32) -> u32 #foreign raylib "rlLoadTexture";
LoadTextureDepth :: (width: s32, height: s32, useRenderBuffer: bool) -> u32 #foreign raylib "rlLoadTextureDepth";
LoadTextureCubemap :: (data: *void, size: s32, format: s32) -> u32 #foreign raylib "rlLoadTextureCubemap";
UpdateTexture :: (id: u32, offsetX: s32, offsetY: s32, width: s32, height: s32, format: s32, data: *void) -> void #foreign raylib "rlUpdateTexture";
GetGlTextureFormats :: (format: s32, glInternalFormat: *u32, glFormat: *u32, glType: *u32) -> void #foreign raylib "rlGetGlTextureFormats";
GetPixelFormatName :: (format: u32) -> *u8 #foreign raylib "rlGetPixelFormatName";
UnloadTexture :: (id: u32) -> void #foreign raylib "rlUnloadTexture";
GenTextureMipmaps :: (id: u32, width: s32, height: s32, format: s32, mipmaps: *s32) -> void #foreign raylib "rlGenTextureMipmaps";
ReadTexturePixels :: (id: u32, width: s32, height: s32, format: s32) -> *void #foreign raylib "rlReadTexturePixels";
ReadScreenPixels :: (width: s32, height: s32) -> *u8 #foreign raylib "rlReadScreenPixels";

// Framebuffer management (fbo)
LoadFramebuffer :: (width: s32, height: s32) -> u32 #foreign raylib "rlLoadFramebuffer";
FramebufferAttach :: (fboId: u32, texId: u32, attachType: s32, texType: s32, mipLevel: s32) -> void #foreign raylib "rlFramebufferAttach";
FramebufferComplete :: (id: u32) -> bool #foreign raylib "rlFramebufferComplete";
UnloadFramebuffer :: (id: u32) -> void #foreign raylib "rlUnloadFramebuffer";

// Shaders management
LoadShaderCode :: (vsCode: *u8, fsCode: *u8) -> u32 #foreign raylib "rlLoadShaderCode";
CompileShader :: (shaderCode: *u8, type: s32) -> u32 #foreign raylib "rlCompileShader";
LoadShaderProgram :: (vShaderId: u32, fShaderId: u32) -> u32 #foreign raylib "rlLoadShaderProgram";
UnloadShaderProgram :: (id: u32) -> void #foreign raylib "rlUnloadShaderProgram";
GetLocationUniform :: (shaderId: u32, uniformName: *u8) -> s32 #foreign raylib "rlGetLocationUniform";
GetLocationAttrib :: (shaderId: u32, attribName: *u8) -> s32 #foreign raylib "rlGetLocationAttrib";
SetUniform :: (locIndex: s32, value: *void, uniformType: s32, count: s32) -> void #foreign raylib "rlSetUniform";
SetUniformMatrix :: (locIndex: s32, mat: Matrix) -> void #foreign raylib "rlSetUniformMatrix";
SetUniformSampler :: (locIndex: s32, textureId: u32) -> void #foreign raylib "rlSetUniformSampler";
SetShader :: (id: u32, locs: *s32) -> void #foreign raylib "rlSetShader";

// Compute shader management
LoadComputeShaderProgram :: (shaderId: u32) -> u32 #foreign raylib "rlLoadComputeShaderProgram";
ComputeShaderDispatch :: (groupX: u32, groupY: u32, groupZ: u32) -> void #foreign raylib "rlComputeShaderDispatch";

// Shader buffer storage object management (ssbo)
LoadShaderBuffer :: (size: u32, data: *void, usageHint: s32) -> u32 #foreign raylib "rlLoadShaderBuffer";
UnloadShaderBuffer :: (ssboId: u32) -> void #foreign raylib "rlUnloadShaderBuffer";
UpdateShaderBuffer :: (id: u32, data: *void, dataSize: u32, offset: u32) -> void #foreign raylib "rlUpdateShaderBuffer";
BindShaderBuffer :: (id: u32, index: u32) -> void #foreign raylib "rlBindShaderBuffer";
ReadShaderBuffer :: (id: u32, dest: *void, count: u32, offset: u32) -> void #foreign raylib "rlReadShaderBuffer";
CopyShaderBuffer :: (destId: u32, srcId: u32, destOffset: u32, srcOffset: u32, count: u32) -> void #foreign raylib "rlCopyShaderBuffer";
GetShaderBufferSize :: (id: u32) -> u32 #foreign raylib "rlGetShaderBufferSize";

// Buffer management
BindImageTexture :: (id: u32, index: u32, format: PixelFormat, readonly: bool) -> void #foreign raylib "rlBindImageTexture";

// Matrix state management
GetMatrixModelview :: () -> Matrix #foreign raylib "rlGetMatrixModelview";
GetMatrixProjection :: () -> Matrix #foreign raylib "rlGetMatrixProjection";
GetMatrixTransform :: () -> Matrix #foreign raylib "rlGetMatrixTransform";
GetMatrixProjectionStereo :: (eye: s32) -> Matrix #foreign raylib "rlGetMatrixProjectionStereo";
GetMatrixViewOffsetStereo :: (eye: s32) -> Matrix #foreign raylib "rlGetMatrixViewOffsetStereo";
SetMatrixProjection :: (proj: Matrix) -> void #foreign raylib "rlSetMatrixProjection";
SetMatrixModelview :: (view: Matrix) -> void #foreign raylib "rlSetMatrixModelview";
SetMatrixProjectionStereo :: (right: Matrix, left: Matrix) -> void #foreign raylib "rlSetMatrixProjectionStereo";
SetMatrixViewOffsetStereo :: (right: Matrix, left: Matrix) -> void #foreign raylib "rlSetMatrixViewOffsetStereo";

// Quick and dirty cube/quad buffers load->draw->unload
LoadDrawCube :: () -> void #foreign raylib "rlLoadDrawCube";
LoadDrawQuad :: () -> void #foreign raylib "rlLoadDrawQuad";

// Camera basis
GetCameraForward :: (camera: *Camera) -> Vector3 #foreign raylib;
GetCameraUp :: (camera: *Camera) -> Vector3 #foreign raylib;
GetCameraRight :: (camera: *Camera) -> Vector3 #foreign raylib;

// Camera movement
GetCameraForward :: (camera : *Camera) -> Vector3 #foreign raylib;

CameraMoveForward :: (camera: *Camera, distance: float, moveInWorldPlane: bool) -> void #foreign raylib;
CameraMoveUp :: (camera: *Camera, distance: float) -> void #foreign raylib;
CameraMoveRight :: (camera: *Camera, distance: float, moveInWorldPlane: bool) -> void #foreign raylib;
CameraMoveToTarget :: (camera: *Camera, delta: float) -> void #foreign raylib;

// Camera rotation
CameraYaw :: (camera: *Camera, angle: float, rotateAroundTarget: bool) -> void #foreign raylib;
CameraPitch :: (camera: *Camera, angle: float, lockView: bool, rotateAroundTarget: bool, rotateUp: bool) -> void #foreign raylib;
CameraRoll :: (camera: *Camera, angle: float) -> void #foreign raylib;

GetCameraViewMatrix :: (camera: *Camera) -> Matrix #foreign raylib;
GetCameraProjectionMatrix :: (camera: *Camera, aspect: float) -> Matrix #foreign raylib;

#scope_file

#if OS == .LINUX {
    raylib :: #library,no_dll "linux/raylib";
} else #if OS == .WINDOWS {
    raylib :: #library,no_dll "windows/raylib";
}
