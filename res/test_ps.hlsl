
struct VSOutput
{
    float4 Position : SV_POSITION;
    float2 TexCoord : TEXCOORD0;
};

struct PSOutput
{
    float4 Color : SV_TARGET0;
};

PSOutput main(const VSOutput input)
{
    PSOutput output = (PSOutput)0;

    output.Color = float4(1.0f, 0.0f, 0.0f, 1.0f);

    return output;
}