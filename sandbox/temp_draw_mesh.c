// mesh = {
//     vertexCount = 3;
//     triangleCount = 1;
//     vertices = 7f1a_f321_0080;
//     texcoords = null;
//     texcoords2 = null;
//     normals = null;
//     tangents = null;
//     colors = null;
//     indices = null;
//     animVertices = null;
//     animNormals = null;
//     boneIds = null;
//     boneWeights = null;
//     vaoId = 2;
//     vboId = 7f1a_f301_2ba0;
// }
// model = {
//     transform = {
//         m0 = 1; m4 = 0; m8 = 0; m12 = 0;
//         m1 = 0; m5 = 1; m9 = 0; m13 = 0;
//         m2 = 0; m6 = 0; m10 = 1; m14 = 0;
//         m3 = 0; m7 = 0; m11 = 0; m15 = 1;
//     };
//     meshCount = 1;
//     materialCount = 1;
//     meshes = 7f1a_f31e_1f90;
//     materials = 7f1a_f302_0b00;
//     meshMaterial = 7f1a_f303_0140;
//     boneCount = 0;
//     bones = null;
//     bindPose = null;
// }
// material = {
//     {3, 7f1a_f304_0080},
//     7f1a_f322_0080,
//     [0, 0, 0, 0]
// }
// Material :: struct {
//     shader: Shader; // Material shader
//     maps:   *MaterialMap; // Material maps array (MAX_MATERIAL_MAPS)
//     params: [4] float; // Material generic parameters (if required)
// }
// shader_locs = [
   //  0, 1, -1, -1, -1,
   //  3, 1, -1, -1, -1,
   // -1, -1, 0, -1, -1,
   //  2, -1, -1, -1, -1,
   //  -1, -1, -1, -1, -1,
   //  -1]
// VERTEX_POSITION   :: 0;
// VERTEX_TEXCOORD01 :: 1;
// VERTEX_TEXCOORD02 :: 2;
// VERTEX_NORMAL     :: 3;
// VERTEX_TANGENT    :: 4;
// VERTEX_COLOR      :: 5;
// MATRIX_MVP        :: 6;
// MATRIX_VIEW       :: 7;
// MATRIX_PROJECTION :: 8;
// MATRIX_MODEL      :: 9;
// MATRIX_NORMAL     :: 10;
// VECTOR_VIEW       :: 11;
// COLOR_DIFFUSE     :: 12;
// COLOR_SPECULAR    :: 13;
// COLOR_AMBIENT     :: 14;
// MAP_ALBEDO        :: 15;
// MAP_METALNESS     :: 16;
// MAP_NORMAL        :: 17;
// MAP_ROUGHNESS     :: 18;
// MAP_OCCLUSION     :: 19;
// MAP_EMISSION      :: 20;
// MAP_HEIGHT        :: 21;
// MAP_CUBEMAP       :: 22;
// MAP_IRRADIANCE    :: 23;
// MAP_PREFILTER     :: 24;
// MAP_BRDF          :: 25;

// ALBEDO     :: 0;
// METALNESS  :: 1;
// NORMAL     :: 2;
// ROUGHNESS  :: 3;
// OCCLUSION  :: 4;
// EMISSION   :: 5;
// HEIGHT     :: 6;
// CUBEMAP    :: 7;
// IRRADIANCE :: 8;
// PREFILTER  :: 9;
// BRDF       :: 10;

// maps = [
//     {{1, 1, 1, 1, 7}, {255, 255, 255, 255}, 0},
//     {{0, 0, 0, 0, 0}, {255, 255, 255, 255}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0},
//     {{0, 0, 0, 0, 0}, {0, 0, 0, 0}, 0}
// ]

void DrawMesh(Mesh mesh, Material material, Matrix transform) {
    rlEnableShader(material.shader.id);

    if (material.shader.locs[SHADER_LOC_COLOR_DIFFUSE] != -1) {
        float values[4] = {
            (float)material.maps[MATERIAL_MAP_DIFFUSE].color.r/255.0f,
            (float)material.maps[MATERIAL_MAP_DIFFUSE].color.g/255.0f,
            (float)material.maps[MATERIAL_MAP_DIFFUSE].color.b/255.0f,
            (float)material.maps[MATERIAL_MAP_DIFFUSE].color.a/255.0f
        };
        rlSetUniform(material.shader.locs[SHADER_LOC_COLOR_DIFFUSE], values, SHADER_UNIFORM_VEC4, 1);
    }

    Matrix matModel = MatrixIdentity();
    Matrix matView = rlGetMatrixModelview();
    Matrix matModelView = MatrixIdentity();
    Matrix matProjection = rlGetMatrixProjection();

    matModel = MatrixMultiply(transform, rlGetMatrixTransform());

    matModelView = MatrixMultiply(matModel, matView);

    {
        int i = 0;
        rlActiveTextureSlot(i);
        rlEnableTexture(material.maps[i].texture.id);
        rlSetUniform(material.shader.locs[SHADER_LOC_MAP_DIFFUSE + i], &i, SHADER_UNIFORM_INT, 1);
    }

    rlEnableVertexArray(mesh.vaoId);

    if (mesh.vboId[3] == 0) rlDisableVertexAttribute(material.shader.locs[SHADER_LOC_VERTEX_COLOR]);

    int eyeCount = rlIsStereoRenderEnabled() ? 2 : 1;

    for (int eye = 0; eye < eyeCount; eye++) {
        Matrix matModelViewProjection = MatrixIdentity();
        if (eyeCount == 1) {
            matModelViewProjection = MatrixMultiply(matModelView, matProjection);
        } else {
            rlViewport(eye*rlGetFramebufferWidth()/2, 0, rlGetFramebufferWidth()/2, rlGetFramebufferHeight());
            matModelViewProjection = MatrixMultiply(MatrixMultiply(matModelView, rlGetMatrixViewOffsetStereo(eye)), rlGetMatrixProjectionStereo(eye));
        }
        rlSetUniformMatrix(material.shader.locs[SHADER_LOC_MATRIX_MVP], matModelViewProjection);
        rlDrawVertexArray(0, mesh.vertexCount);  // DRAW
    }

    // Unbind all bound texture maps
    {
        rlActiveTextureSlot(0);
        rlDisableTexture();
    }

    rlDisableVertexArray();
    rlDisableVertexBuffer();
    rlDisableVertexBufferElement();

    rlDisableShader();

    rlSetMatrixModelview(matView);
    rlSetMatrixProjection(matProjection);
}
