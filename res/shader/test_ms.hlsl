///////////////////////////////////////////////////////////////////////////////
// PayloadParam structure
///////////////////////////////////////////////////////////////////////////////
struct PayloadParam
{
    uint MeshletIndices[32];
};

///////////////////////////////////////////////////////////////////////////////
// MSOutput structure
///////////////////////////////////////////////////////////////////////////////
struct MSOutput
{
    float4  Position    : SV_POSITION;
    float2  TexCoord    : TEXCOORD;
    float3  Normal      : NORMAL;
    float3  Tangent     : TANGENT;
};

[numthreads(128, 1, 1)]
[outputtopology("triangle")]
void main
(
    uint groupThreadId  : SV_GroupThreadID,
    uint groupId        : SV_GroupId,
    in   payload  PayloadParam payloadParam,
    out  vertices MSOutput verts[64],
    out  indices  uint3    polys[126]
)
{


}
