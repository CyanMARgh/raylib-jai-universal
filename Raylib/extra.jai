// GetMonitorName :: (monitor: s32) -> *u8 #foreign raylib;

// void CameraRoll(Camera *camera, float angle)

// CameraRoll :: (camera : *Camera, angle : float) -> void #foreign raylib;
// GetCameraForward :: (camera : *Camera) -> Vector3 #foreign raylib;


sign :: (x : $T) -> int {
	return ifx x < 0 then -1 else ifx x > 0 then 1 else 0;
}

GetRayCollisionCylinder :: (ray : Ray, a : Vector3, b : Vector3, ra : float) -> RayCollision {
	ro, rd := ray.position, ray.direction;
	ba := b  - a;
	oc := ro - a;
	baba := dot(ba, ba);
	bard := dot(ba, rd);
	baoc := dot(ba, oc);
	k2 := baba - bard * bard;
	k1 := baba * dot(oc, rd) - baoc * bard;
	k0 := baba * dot(oc, oc) - baoc * baoc - ra * ra * baba;
	h := k1 * k1 - k2 * k0;
	if h < 0 return .{hit = false};//no intersection
	h = sqrt(h);
	t := (-k1 - h) / k2;
	// body
	y := baoc + t * bard;
	if y > 0 && y < baba {
		return .{ 
			true,
			t,
			ro + t * rd,
			normalize((oc + t * rd - ba * y / baba) / ra)
		};
	}
	// caps
	t = ((ifx y < 0 then 0 else baba) - baoc) / bard;
	if abs(k1 + k2 * t) < h {
		return .{
			true,
			t,
			ro + t * rd,
			normalize(ba * cast(float)sign(y) / sqrt(baba)),
		};
	}
	return .{hit = false};
}

get_rlgl_ptr :: () -> *RLGL_Data {
    getRlglPtr :: () -> *void #foreign raylib;
    return xx getRlglPtr();
}

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