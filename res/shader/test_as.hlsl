///////////////////////////////////////////////////////////////////////////////
// PayloadParam structure
///////////////////////////////////////////////////////////////////////////////
struct PayloadParam
{
    uint MeshletIndices[32];
};

//-----------------------------------------------------------------------------
// Resources.
//-----------------------------------------------------------------------------
groupshared PayloadParam    s_Payload;


[numthreads(32, 1, 1)]
void main(uint dispatchId : SV_DispatchThreadID)
{
    bool visible = true;

    if (visible)
    {
        uint index = WavePrefixCountBits(visible);
        s_Payload.MeshletIndices[index] = dispatchId;
    }

    uint visibleCount = WaveActiveCountBits(visible);
    DispatchMesh(visibleCount, 1, 1, s_Payload);
}
