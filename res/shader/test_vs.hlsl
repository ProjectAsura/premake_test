struct VSInput
{
    float3 Position : POSITION;
    float2 TexCoord : TEXCOORD;
};

struct VSOutput
{
    float4 Position : SV_POSITION;
    float2 TexCoord : TEXCOORD0;
};

VSOutput main(const VSInput input)
{
    VSOutput output = (VSOutput)0;

    output.Position = float4(input.Position, 1.0f);
    output.TexCoord = input.TexCoord;

    return output;
}
