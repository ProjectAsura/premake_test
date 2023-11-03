-- ソリューション名.
workspace "SampleSolution"
    -- 構成名.
    configurations { "Debug", "Develop", "Release" }

-- プロジェクト名.
project "SampleProject"

    kind "ConsoleApp"
    language "C++"

    -- 出力ディレクトリ.
    targetdir "bin/%{cfg.buildcfg}"

    -- インクルードディレクトリ.
    includedirs { "include/**" }
    shaderincludedirs { "res/shader/**" }

    -- 対称ファイル
    files { "**.h", "**.cpp", "**.hlsl", "**.hlsli" }

    -- シェーダモデルとエントリー名設定.
    shadermodel "6.2"
    shaderentry "main"

    -- シェーダヘッダファイル設定.
    filter { "files:**.hlsli" }
        flags "ExcludeFromBuild"

    -- 頂点シェーダ設定.
    filter { "files:**_vs.hlsl" }
        shadertype "Vertex"

    -- ピクセルシェーダ設定.
    filter { "files:**_ps.hlsl" }
        shadertype "Pixel"

    -- コンピュートシェーダ設定.
    filter { "files:**_cs.hlsl" }
        shadertype "Compute"

    -- 構成設定.
    filter { "configurations:Debug" }
        defines {"DEBUG"}
        shaderdefines {"DEBUG=1"}
        symbols "On"

    filter { "configurations:Develop" }
        defines {"NDEBUG"}
        shaderdefines {"NDEBUG=1"}
        optimize "On"
        symbols "On"

    filter { "configurations:Release" }
        defines {"NDEBUG"}
        shaderdefines {"NDEBUG=1"}
        optimize "On"


