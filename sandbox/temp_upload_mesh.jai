UploadMesh :: (mesh : *Mesh, dynamic : bool) {
    assert(mesh->vaoId == 0, "VAO: [ID %] Trying to re-load an already loaded mesh", mesh->vaoId);

    mesh->vboId = (unsigned int *)RL_CALLOC(1, sizeof(unsigned int));

    mesh->vaoId = 0;        // Vertex Array Object
    mesh->vboId[0] = 0;     // Vertex buffer: positions
    // mesh->vboId[1] = 0;     // Vertex buffer: texcoords
    // mesh->vboId[2] = 0;     // Vertex buffer: normals
    // mesh->vboId[3] = 0;     // Vertex buffer: colors
    // mesh->vboId[4] = 0;     // Vertex buffer: tangents
    // mesh->vboId[5] = 0;     // Vertex buffer: texcoords2
    // mesh->vboId[6] = 0;     // Vertex buffer: indices

    mesh->vaoId = rlLoadVertexArray();
    rlEnableVertexArray(mesh->vaoId);

    // NOTE: Vertex attributes must be uploaded considering default locations points and available vertex data

    // Enable vertex attributes: position (shader-location = 0)
    void *vertices = mesh->vertices;
    mesh->vboId[0] = rlLoadVertexBuffer(vertices, mesh->vertexCount*3*sizeof(float), dynamic);
    rlSetVertexAttribute(0, 3, RL_FLOAT, 0, 0, 0);
    rlEnableVertexAttribute(0);

    mesh->vboId[1] = rlLoadVertexBuffer(mesh->texcoords, mesh->vertexCount*2*sizeof(float), dynamic);
    rlSetVertexAttribute(1, 2, RL_FLOAT, 0, 0, 0);
    rlEnableVertexAttribute(1);

    if (mesh->vaoId > 0) {
        TRACELOG(LOG_INFO, "VAO: [ID %i] Mesh uploaded successfully to VRAM (GPU)", mesh->vaoId);
    } else {
        TRACELOG(LOG_INFO, "VBO: Mesh uploaded successfully to VRAM (GPU)");
    }
    rlDisableVertexArray();
}