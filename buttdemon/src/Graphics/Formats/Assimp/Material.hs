{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ViewPatterns #-}

module Graphics.Formats.Assimp.Material where

import Graphics.Formats.Assimp.Types

import Data.Bits
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

pattern AI_DEFAULT_MATERIAL_NAME :: AiString
pattern AI_DEFAULT_MATERIAL_NAME = "DefaultMaterial"

newtype AiTextureOp = AiTextureOp CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiTextureOp

pattern AiTextureOp_Multiply :: AiTextureOp
pattern AiTextureOp_Multiply = AiTextureOp 0x0
pattern AiTextureOp_Add :: AiTextureOp
pattern AiTextureOp_Add = AiTextureOp 0x1
pattern AiTextureOp_Subtract :: AiTextureOp
pattern AiTextureOp_Subtract = AiTextureOp 0x2
pattern AiTextureOp_Divide :: AiTextureOp
pattern AiTextureOp_Divide = AiTextureOp 0x3
pattern AiTextureOp_SmoothAdd :: AiTextureOp
pattern AiTextureOp_SmoothAdd = AiTextureOp 0x4
pattern AiTextureOp_SignedAdd :: AiTextureOp
pattern AiTextureOp_SignedAdd = AiTextureOp 0x5

newtype AiTextureMapMode = AiTextureMapMode CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiTextureMapMode

pattern AiTextureMapMode_Wrap :: AiTextureMapMode
pattern AiTextureMapMode_Wrap = AiTextureMapMode 0x0
pattern AiTextureMapMode_Clamp :: AiTextureMapMode
pattern AiTextureMapMode_Clamp = AiTextureMapMode 0x1
pattern AiTextureMapMode_Mirror :: AiTextureMapMode
pattern AiTextureMapMode_Mirror = AiTextureMapMode 0x2
pattern AiTextureMapMode_Decal :: AiTextureMapMode
pattern AiTextureMapMode_Decal = AiTextureMapMode 0x3

newtype AiTextureMapping = AiTextureMapping CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiTextureMapping

pattern AiTextureMapping_UV :: AiTextureMapping
pattern AiTextureMapping_UV = AiTextureMapping 0x0
pattern AiTextureMapping_SPHERE :: AiTextureMapping
pattern AiTextureMapping_SPHERE = AiTextureMapping 0x1
pattern AiTextureMapping_CYLINDER :: AiTextureMapping
pattern AiTextureMapping_CYLINDER = AiTextureMapping 0x2
pattern AiTextureMapping_BOX :: AiTextureMapping
pattern AiTextureMapping_BOX = AiTextureMapping 0x3
pattern AiTextureMapping_PLANE :: AiTextureMapping
pattern AiTextureMapping_PLANE = AiTextureMapping 0x4
pattern AiTextureMapping_OTHER :: AiTextureMapping
pattern AiTextureMapping_OTHER = AiTextureMapping 0x5

newtype AiTextureType = AiTextureType CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiTextureType

pattern AiTextureType_NONE :: AiTextureType
pattern AiTextureType_NONE = AiTextureType 0
pattern AiTextureType_DIFFUSE :: AiTextureType
pattern AiTextureType_DIFFUSE = AiTextureType 1
pattern AiTextureType_SPECULAR :: AiTextureType
pattern AiTextureType_SPECULAR = AiTextureType 2
pattern AiTextureType_AMBIENT :: AiTextureType
pattern AiTextureType_AMBIENT = AiTextureType 3
pattern AiTextureType_EMISSIVE :: AiTextureType
pattern AiTextureType_EMISSIVE = AiTextureType 4
pattern AiTextureType_HEIGHT :: AiTextureType
pattern AiTextureType_HEIGHT = AiTextureType 5
pattern AiTextureType_NORMALS :: AiTextureType
pattern AiTextureType_NORMALS = AiTextureType 6
pattern AiTextureType_SHININESS :: AiTextureType
pattern AiTextureType_SHININESS = AiTextureType 7
pattern AiTextureType_OPACITY :: AiTextureType
pattern AiTextureType_OPACITY = AiTextureType 8
pattern AiTextureType_DISPLACEMENT :: AiTextureType
pattern AiTextureType_DISPLACEMENT = AiTextureType 9
pattern AiTextureType_LIGHTMAP :: AiTextureType
pattern AiTextureType_LIGHTMAP = AiTextureType 10
pattern AiTextureType_REFLECTION :: AiTextureType
pattern AiTextureType_REFLECTION = AiTextureType 11
pattern AiTextureType_BASE_COLOR :: AiTextureType
pattern AiTextureType_BASE_COLOR = AiTextureType 12
pattern AiTextureType_NORMAL_CAMERA :: AiTextureType
pattern AiTextureType_NORMAL_CAMERA = AiTextureType 13
pattern AiTextureType_EMISSION_COLOR :: AiTextureType
pattern AiTextureType_EMISSION_COLOR = AiTextureType 14
pattern AiTextureType_METALNESS :: AiTextureType
pattern AiTextureType_METALNESS = AiTextureType 15
pattern AiTextureType_DIFFUSE_ROUGHNESS :: AiTextureType
pattern AiTextureType_DIFFUSE_ROUGHNESS = AiTextureType 16
pattern AiTextureType_AMBIENT_OCCLUSION :: AiTextureType
pattern AiTextureType_AMBIENT_OCCLUSION = AiTextureType 17
pattern AiTextureType_UNKNOWN :: AiTextureType
pattern AiTextureType_UNKNOWN = AiTextureType 18

pattern AI_TEXTURE_TYPE_MAX :: AiTextureType
pattern AI_TEXTURE_TYPE_MAX = AiTextureType_UNKNOWN

newtype AiShadingMode = AiShadingMode CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiShadingMode

pattern AiShadingMode_Flat :: AiShadingMode
pattern AiShadingMode_Flat = AiShadingMode 0x1
pattern AiShadingMode_Gouraud :: AiShadingMode
pattern AiShadingMode_Gouraud = AiShadingMode 0x2
pattern AiShadingMode_Phong :: AiShadingMode
pattern AiShadingMode_Phong = AiShadingMode 0x3
pattern AiShadingMode_Blinn :: AiShadingMode
pattern AiShadingMode_Blinn = AiShadingMode 0x4
pattern AiShadingMode_Toon :: AiShadingMode
pattern AiShadingMode_Toon = AiShadingMode 0x5
pattern AiShadingMode_OrenNayar :: AiShadingMode
pattern AiShadingMode_OrenNayar = AiShadingMode 0x6
pattern AiShadingMode_Minnaert :: AiShadingMode
pattern AiShadingMode_Minnaert = AiShadingMode 0x7
pattern AiShadingMode_CookTorrance :: AiShadingMode
pattern AiShadingMode_CookTorrance = AiShadingMode 0x8
pattern AiShadingMode_NoShading :: AiShadingMode
pattern AiShadingMode_NoShading = AiShadingMode 0x9
pattern AiShadingMode_Fresnel :: AiShadingMode
pattern AiShadingMode_Fresnel = AiShadingMode 0xa

newtype AiTextureFlags = AiTextureFlags CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiTextureFlags

pattern AiTextureFlags_Invert :: AiTextureFlags
pattern AiTextureFlags_Invert = AiTextureFlags 0x1
pattern AiTextureFlags_UseAlpha :: AiTextureFlags
pattern AiTextureFlags_UseAlpha = AiTextureFlags 0x2
pattern AiTextureFlags_IgnoreAlpha :: AiTextureFlags
pattern AiTextureFlags_IgnoreAlpha = AiTextureFlags 0x4

newtype AiBlendMode = AiBlendMode CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiBlendMode

pattern AiBlendmode_Default :: AiBlendMode
pattern AiBlendmode_Default = AiBlendMode 0x0
pattern AiBlendmode_Additive :: AiBlendMode
pattern AiBlendmode_Additive = AiBlendMode 0x1

data AiUVTransform =
  AiUVTransform {
    aiUVTransform'translation :: AiVector2D,
    aiUVTransform'scaling :: AiVector2D,
    aiUVTransform'rotation :: AiReal
  }
  deriving (Generic)
instance PrimBytes AiUVTransform

newtype AiPropertyTypeInfo = AiPropertyTypeInfo CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiPropertyTypeInfo

pattern AiPropertyTypeInfo_Float :: AiPropertyTypeInfo
pattern AiPropertyTypeInfo_Float = AiPropertyTypeInfo 0x1
pattern AiPropertyTypeInfo_Double :: AiPropertyTypeInfo
pattern AiPropertyTypeInfo_Double = AiPropertyTypeInfo 0x2
pattern AiPropertyTypeInfo_String :: AiPropertyTypeInfo
pattern AiPropertyTypeInfo_String = AiPropertyTypeInfo 0x3
pattern AiPropertyTypeInfo_Integer :: AiPropertyTypeInfo
pattern AiPropertyTypeInfo_Integer = AiPropertyTypeInfo 0x4
pattern AiPropertyTypeInfo_Buffer :: AiPropertyTypeInfo
pattern AiPropertyTypeInfo_Buffer = AiPropertyTypeInfo 0x5

data AiMaterialProperty =
  AiMaterialProperty {
    aiMaterialProperty'key :: AiString,
    aiMaterialProperty'semantic :: CUInt,
    aiMaterialProperty'index :: CUInt,
    aiMaterialProperty'dataLength :: CUInt,
    aiMaterialProperty'type :: AiPropertyTypeInfo,
    aiMaterialProperty'data :: Ptr CChar
  }
  deriving (Generic)
instance PrimBytes AiMaterialProperty

data AiMaterial =
  AiMaterial {
    aiMaterial'properties :: Ptr AiMaterialProperty,
    aiMaterial'numProperties :: CUInt,
    aiMaterial'numAllocated :: CUInt
  }
  deriving (Generic)
instance PrimBytes AiMaterial

data AiTexKey =
  AiTexKey {
    aiTexKey'textureType :: AiTextureType,
    aiTexKey'index :: CUInt
  }

data AiMatKey =
  AiMatKey {
    aiMatKey'name :: String,
    aiMatKey'texKey :: AiTexKey
  }

pattern AI_TEXKEY_NONE_0 :: AiTexKey
pattern AI_TEXKEY_NONE_0 = AiTexKey AiTextureType_NONE 0

pattern AI_MATKEY_NAME :: AiMatKey
pattern AI_MATKEY_NAME = AiMatKey "?mat.name" AI_TEXKEY_NONE_0
pattern AI_MATKEY_TWOSIDED :: AiMatKey
pattern AI_MATKEY_TWOSIDED = AiMatKey "$mat.twosided" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADING_MODEL :: AiMatKey
pattern AI_MATKEY_SHADING_MODEL = AiMatKey "$mat.shadingm" AI_TEXKEY_NONE_0
pattern AI_MATKEY_ENABLE_WIREFRAME :: AiMatKey
pattern AI_MATKEY_ENABLE_WIREFRAME = AiMatKey "$mat.wireframe" AI_TEXKEY_NONE_0
pattern AI_MATKEY_BLEND_FUNC :: AiMatKey
pattern AI_MATKEY_BLEND_FUNC = AiMatKey "$mat.blend" AI_TEXKEY_NONE_0
pattern AI_MATKEY_OPACITY :: AiMatKey
pattern AI_MATKEY_OPACITY = AiMatKey "$mat.opacity" AI_TEXKEY_NONE_0
pattern AI_MATKEY_TRANSPARENCYFACTOR :: AiMatKey
pattern AI_MATKEY_TRANSPARENCYFACTOR = AiMatKey "$mat.transparencyfactor" AI_TEXKEY_NONE_0
pattern AI_MATKEY_BUMPSCALING :: AiMatKey
pattern AI_MATKEY_BUMPSCALING = AiMatKey "$mat.bumpscaling" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHININESS :: AiMatKey
pattern AI_MATKEY_SHININESS = AiMatKey "$mat.shininess" AI_TEXKEY_NONE_0
pattern AI_MATKEY_REFLECTIVITY :: AiMatKey
pattern AI_MATKEY_REFLECTIVITY = AiMatKey "$mat.reflectivity" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHININESS_STRENGTH :: AiMatKey
pattern AI_MATKEY_SHININESS_STRENGTH = AiMatKey "$mat.shinpercent" AI_TEXKEY_NONE_0
pattern AI_MATKEY_REFRACTI :: AiMatKey
pattern AI_MATKEY_REFRACTI = AiMatKey "$mat.refracti" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_DIFFUSE :: AiMatKey
pattern AI_MATKEY_COLOR_DIFFUSE = AiMatKey "$clr.diffuse" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_AMBIENT :: AiMatKey
pattern AI_MATKEY_COLOR_AMBIENT = AiMatKey "$clr.ambient" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_SPECULAR :: AiMatKey
pattern AI_MATKEY_COLOR_SPECULAR = AiMatKey "$clr.specular" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_EMISSIVE :: AiMatKey
pattern AI_MATKEY_COLOR_EMISSIVE = AiMatKey "$clr.emissive" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_TRANSPARENT :: AiMatKey
pattern AI_MATKEY_COLOR_TRANSPARENT = AiMatKey "$clr.transparent" AI_TEXKEY_NONE_0
pattern AI_MATKEY_COLOR_REFLECTIVE :: AiMatKey
pattern AI_MATKEY_COLOR_REFLECTIVE = AiMatKey "$clr.reflective" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLOBAL_BACKGROUND_IMAGE :: AiMatKey
pattern AI_MATKEY_GLOBAL_BACKGROUND_IMAGE = AiMatKey "?bg.global" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLOBAL_SHADERLANG :: AiMatKey
pattern AI_MATKEY_GLOBAL_SHADERLANG = AiMatKey "?sh.lang" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_VERTEX :: AiMatKey
pattern AI_MATKEY_SHADER_VERTEX = AiMatKey "?sh.vs" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_FRAGMENT :: AiMatKey
pattern AI_MATKEY_SHADER_FRAGMENT = AiMatKey "?sh.fs" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_GEO :: AiMatKey
pattern AI_MATKEY_SHADER_GEO = AiMatKey "?sh.gs" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_TESSELATION :: AiMatKey
pattern AI_MATKEY_SHADER_TESSELATION = AiMatKey "?sh.ts" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_PRIMITIVE :: AiMatKey
pattern AI_MATKEY_SHADER_PRIMITIVE = AiMatKey "?sh.ps" AI_TEXKEY_NONE_0
pattern AI_MATKEY_SHADER_COMPUTE :: AiMatKey
pattern AI_MATKEY_SHADER_COMPUTE = AiMatKey "?sh.cs" AI_TEXKEY_NONE_0

pattern AI_MATKEY_TEXTURE_BASE :: String
pattern AI_MATKEY_TEXTURE_BASE = "$tex.file"
pattern AI_MATKEY_UVWSRC_BASE :: String
pattern AI_MATKEY_UVWSRC_BASE = "$tex.uvwsrc"
pattern AI_MATKEY_TEXOP_BASE :: String
pattern AI_MATKEY_TEXOP_BASE = "$tex.op"
pattern AI_MATKEY_MAPPING_BASE :: String
pattern AI_MATKEY_MAPPING_BASE = "$tex.mapping"
pattern AI_MATKEY_TEXBLEND_BASE :: String
pattern AI_MATKEY_TEXBLEND_BASE = "$tex.blend"
pattern AI_MATKEY_MAPPINGMODE_U_BASE :: String
pattern AI_MATKEY_MAPPINGMODE_U_BASE = "$tex.mapmodeu"
pattern AI_MATKEY_MAPPINGMODE_V_BASE :: String
pattern AI_MATKEY_MAPPINGMODE_V_BASE = "$tex.mapmodev"
pattern AI_MATKEY_TEXMAP_AXIS_BASE :: String
pattern AI_MATKEY_TEXMAP_AXIS_BASE = "$tex.mapaxis"
pattern AI_MATKEY_UVTRANSFORM_BASE :: String
pattern AI_MATKEY_UVTRANSFORM_BASE = "$tex.uvtrafo"
pattern AI_MATKEY_TEXFLAGS_BASE :: String
pattern AI_MATKEY_TEXFLAGS_BASE = "$tex.flags"

pattern AI_TEXKEY_DIFFUSE :: CUInt -> AiTexKey
pattern AI_TEXKEY_DIFFUSE index = AiTexKey AiTextureType_DIFFUSE index
pattern AI_TEXKEY_SPECULAR :: CUInt -> AiTexKey
pattern AI_TEXKEY_SPECULAR index = AiTexKey AiTextureType_SPECULAR index
pattern AI_TEXKEY_AMBIENT :: CUInt -> AiTexKey
pattern AI_TEXKEY_AMBIENT index = AiTexKey AiTextureType_AMBIENT index
pattern AI_TEXKEY_EMISSIVE :: CUInt -> AiTexKey
pattern AI_TEXKEY_EMISSIVE index = AiTexKey AiTextureType_EMISSIVE index
pattern AI_TEXKEY_NORMALS :: CUInt -> AiTexKey
pattern AI_TEXKEY_NORMALS index = AiTexKey AiTextureType_NORMALS index
pattern AI_TEXKEY_HEIGHT :: CUInt -> AiTexKey
pattern AI_TEXKEY_HEIGHT index = AiTexKey AiTextureType_HEIGHT index
pattern AI_TEXKEY_SHININESS :: CUInt -> AiTexKey
pattern AI_TEXKEY_SHININESS index = AiTexKey AiTextureType_SHININESS index
pattern AI_TEXKEY_OPACITY :: CUInt -> AiTexKey
pattern AI_TEXKEY_OPACITY index = AiTexKey AiTextureType_OPACITY index
pattern AI_TEXKEY_DISPLACEMENT :: CUInt -> AiTexKey
pattern AI_TEXKEY_DISPLACEMENT index = AiTexKey AiTextureType_DISPLACEMENT index
pattern AI_TEXKEY_LIGHTMAP :: CUInt -> AiTexKey
pattern AI_TEXKEY_LIGHTMAP index = AiTexKey AiTextureType_LIGHTMAP index
pattern AI_TEXKEY_REFLECTION :: CUInt -> AiTexKey
pattern AI_TEXKEY_REFLECTION index = AiTexKey AiTextureType_REFLECTION index

pattern AI_MATKEY_TEXTURE :: AiTexKey -> AiMatKey
pattern AI_MATKEY_TEXTURE texKey = AiMatKey AI_MATKEY_TEXTURE_BASE texKey

pattern AI_MATKEY_TEXTURE_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_DIFFUSE index = AI_MATKEY_TEXTURE (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_TEXTURE_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_SPECULAR index = AI_MATKEY_TEXTURE (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_TEXTURE_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_AMBIENT index = AI_MATKEY_TEXTURE (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_TEXTURE_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_EMISSIVE index = AI_MATKEY_TEXTURE (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_TEXTURE_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_NORMALS index = AI_MATKEY_TEXTURE (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_TEXTURE_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_HEIGHT index = AI_MATKEY_TEXTURE (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_TEXTURE_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_SHININESS index = AI_MATKEY_TEXTURE (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_TEXTURE_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_OPACITY index = AI_MATKEY_TEXTURE (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_TEXTURE_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_DISPLACEMENT index = AI_MATKEY_TEXTURE (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_TEXTURE_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_LIGHTMAP index = AI_MATKEY_TEXTURE (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_TEXTURE_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXTURE_REFLECTION index = AI_MATKEY_TEXTURE (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_UVWSRC :: AiTexKey -> AiMatKey
pattern AI_MATKEY_UVWSRC texKey = AiMatKey AI_MATKEY_UVWSRC_BASE texKey

pattern AI_MATKEY_UVWSRC_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_DIFFUSE index = AI_MATKEY_UVWSRC (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_UVWSRC_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_SPECULAR index = AI_MATKEY_UVWSRC (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_UVWSRC_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_AMBIENT index = AI_MATKEY_UVWSRC (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_UVWSRC_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_EMISSIVE index = AI_MATKEY_UVWSRC (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_UVWSRC_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_NORMALS index = AI_MATKEY_UVWSRC (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_UVWSRC_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_HEIGHT index = AI_MATKEY_UVWSRC (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_UVWSRC_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_SHININESS index = AI_MATKEY_UVWSRC (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_UVWSRC_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_OPACITY index = AI_MATKEY_UVWSRC (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_UVWSRC_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_DISPLACEMENT index = AI_MATKEY_UVWSRC (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_UVWSRC_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_LIGHTMAP index = AI_MATKEY_UVWSRC (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_UVWSRC_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_UVWSRC_REFLECTION index = AI_MATKEY_UVWSRC (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_TEXOP :: AiTexKey -> AiMatKey
pattern AI_MATKEY_TEXOP texKey = AiMatKey AI_MATKEY_TEXOP_BASE texKey

pattern AI_MATKEY_TEXOP_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_DIFFUSE index = AI_MATKEY_TEXOP (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_TEXOP_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_SPECULAR index = AI_MATKEY_TEXOP (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_TEXOP_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_AMBIENT index = AI_MATKEY_TEXOP (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_TEXOP_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_EMISSIVE index = AI_MATKEY_TEXOP (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_TEXOP_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_NORMALS index = AI_MATKEY_TEXOP (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_TEXOP_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_HEIGHT index = AI_MATKEY_TEXOP (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_TEXOP_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_SHININESS index = AI_MATKEY_TEXOP (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_TEXOP_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_OPACITY index = AI_MATKEY_TEXOP (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_TEXOP_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_DISPLACEMENT index = AI_MATKEY_TEXOP (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_TEXOP_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_LIGHTMAP index = AI_MATKEY_TEXOP (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_TEXOP_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXOP_REFLECTION index = AI_MATKEY_TEXOP (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_MAPPING :: AiTexKey -> AiMatKey
pattern AI_MATKEY_MAPPING texKey = AiMatKey AI_MATKEY_MAPPING_BASE texKey

pattern AI_MATKEY_MAPPING_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_DIFFUSE index = AI_MATKEY_MAPPING (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_MAPPING_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_SPECULAR index = AI_MATKEY_MAPPING (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_MAPPING_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_AMBIENT index = AI_MATKEY_MAPPING (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_MAPPING_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_EMISSIVE index = AI_MATKEY_MAPPING (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_MAPPING_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_NORMALS index = AI_MATKEY_MAPPING (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_MAPPING_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_HEIGHT index = AI_MATKEY_MAPPING (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_MAPPING_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_SHININESS index = AI_MATKEY_MAPPING (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_MAPPING_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_OPACITY index = AI_MATKEY_MAPPING (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_MAPPING_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_DISPLACEMENT index = AI_MATKEY_MAPPING (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_MAPPING_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_LIGHTMAP index = AI_MATKEY_MAPPING (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_MAPPING_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPING_REFLECTION index = AI_MATKEY_MAPPING (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_TEXBLEND :: AiTexKey -> AiMatKey
pattern AI_MATKEY_TEXBLEND texKey = AiMatKey AI_MATKEY_TEXBLEND_BASE texKey

pattern AI_MATKEY_TEXBLEND_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_DIFFUSE index = AI_MATKEY_TEXBLEND (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_TEXBLEND_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_SPECULAR index = AI_MATKEY_TEXBLEND (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_TEXBLEND_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_AMBIENT index = AI_MATKEY_TEXBLEND (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_TEXBLEND_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_EMISSIVE index = AI_MATKEY_TEXBLEND (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_TEXBLEND_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_NORMALS index = AI_MATKEY_TEXBLEND (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_TEXBLEND_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_HEIGHT index = AI_MATKEY_TEXBLEND (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_TEXBLEND_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_SHININESS index = AI_MATKEY_TEXBLEND (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_TEXBLEND_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_OPACITY index = AI_MATKEY_TEXBLEND (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_TEXBLEND_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_DISPLACEMENT index = AI_MATKEY_TEXBLEND (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_TEXBLEND_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_LIGHTMAP index = AI_MATKEY_TEXBLEND (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_TEXBLEND_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXBLEND_REFLECTION index = AI_MATKEY_TEXBLEND (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_MAPPINGMODE_U :: AiTexKey -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U texKey = AiMatKey AI_MATKEY_MAPPINGMODE_U_BASE texKey

pattern AI_MATKEY_MAPPINGMODE_U_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_DIFFUSE index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_MAPPINGMODE_U_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_SPECULAR index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_MAPPINGMODE_U_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_AMBIENT index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_MAPPINGMODE_U_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_EMISSIVE index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_MAPPINGMODE_U_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_NORMALS index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_MAPPINGMODE_U_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_HEIGHT index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_MAPPINGMODE_U_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_SHININESS index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_MAPPINGMODE_U_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_OPACITY index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_MAPPINGMODE_U_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_DISPLACEMENT index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_MAPPINGMODE_U_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_LIGHTMAP index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_MAPPINGMODE_U_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_REFLECTION index = AI_MATKEY_MAPPINGMODE_U (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_MAPPINGMODE_V :: AiTexKey -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V texKey = AiMatKey AI_MATKEY_MAPPINGMODE_V_BASE texKey

pattern AI_MATKEY_MAPPINGMODE_V_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_DIFFUSE index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_MAPPINGMODE_V_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_SPECULAR index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_MAPPINGMODE_V_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_AMBIENT index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_MAPPINGMODE_V_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_EMISSIVE index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_MAPPINGMODE_V_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_NORMALS index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_MAPPINGMODE_V_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_HEIGHT index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_MAPPINGMODE_V_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_SHININESS index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_MAPPINGMODE_V_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_OPACITY index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_MAPPINGMODE_V_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_DISPLACEMENT index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_MAPPINGMODE_V_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_LIGHTMAP index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_MAPPINGMODE_V_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_REFLECTION index = AI_MATKEY_MAPPINGMODE_V (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_TEXMAP_AXIS :: AiTexKey -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS texKey = AiMatKey AI_MATKEY_TEXMAP_AXIS_BASE texKey

pattern AI_MATKEY_TEXMAP_AXIS_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_DIFFUSE index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_TEXMAP_AXIS_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_SPECULAR index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_TEXMAP_AXIS_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_AMBIENT index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_TEXMAP_AXIS_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_EMISSIVE index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_TEXMAP_AXIS_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_NORMALS index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_TEXMAP_AXIS_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_HEIGHT index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_TEXMAP_AXIS_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_SHININESS index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_TEXMAP_AXIS_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_OPACITY index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_TEXMAP_AXIS_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_DISPLACEMENT index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_TEXMAP_AXIS_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_LIGHTMAP index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_TEXMAP_AXIS_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_REFLECTION index = AI_MATKEY_TEXMAP_AXIS (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_UVTRANSFORM :: AiTexKey -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM texKey = AiMatKey AI_MATKEY_UVTRANSFORM_BASE texKey

pattern AI_MATKEY_UVTRANSFORM_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_DIFFUSE index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_UVTRANSFORM_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_SPECULAR index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_UVTRANSFORM_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_AMBIENT index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_UVTRANSFORM_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_EMISSIVE index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_UVTRANSFORM_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_NORMALS index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_UVTRANSFORM_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_HEIGHT index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_UVTRANSFORM_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_SHININESS index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_UVTRANSFORM_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_OPACITY index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_UVTRANSFORM_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_DISPLACEMENT index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_UVTRANSFORM_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_LIGHTMAP index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_UVTRANSFORM_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_REFLECTION index = AI_MATKEY_UVTRANSFORM (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_TEXFLAGS :: AiTexKey -> AiMatKey
pattern AI_MATKEY_TEXFLAGS texKey = AiMatKey AI_MATKEY_TEXFLAGS_BASE texKey

pattern AI_MATKEY_TEXFLAGS_DIFFUSE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_DIFFUSE index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_DIFFUSE index)
pattern AI_MATKEY_TEXFLAGS_SPECULAR :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_SPECULAR index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_SPECULAR index)
pattern AI_MATKEY_TEXFLAGS_AMBIENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_AMBIENT index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_AMBIENT index)
pattern AI_MATKEY_TEXFLAGS_EMISSIVE :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_EMISSIVE index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_EMISSIVE index)
pattern AI_MATKEY_TEXFLAGS_NORMALS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_NORMALS index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_NORMALS index)
pattern AI_MATKEY_TEXFLAGS_HEIGHT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_HEIGHT index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_HEIGHT index)
pattern AI_MATKEY_TEXFLAGS_SHININESS :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_SHININESS index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_SHININESS index)
pattern AI_MATKEY_TEXFLAGS_OPACITY :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_OPACITY index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_OPACITY index)
pattern AI_MATKEY_TEXFLAGS_DISPLACEMENT :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_DISPLACEMENT index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_DISPLACEMENT index)
pattern AI_MATKEY_TEXFLAGS_LIGHTMAP :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_LIGHTMAP index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_LIGHTMAP index)
pattern AI_MATKEY_TEXFLAGS_REFLECTION :: CUInt -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_REFLECTION index = AI_MATKEY_TEXFLAGS (AI_TEXKEY_REFLECTION index)

pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_BASE_COLOR_FACTOR :: AiMatKey
pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_BASE_COLOR_FACTOR = AiMatKey "$mat.gltf.pbrMetallicRoughness.baseColorFactor" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_METALLIC_FACTOR :: AiMatKey
pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_METALLIC_FACTOR = AiMatKey "$mat.gltf.pbrMetallicRoughness.metallicFactor" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_ROUGHNESS_FACTOR :: AiMatKey
pattern AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_ROUGHNESS_FACTOR = AiMatKey "$mat.gltf.pbrMetallicRoughness.roughnessFactor" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_ALPHAMODE :: AiMatKey
pattern AI_MATKEY_GLTF_ALPHAMODE = AiMatKey "$mat.gltf.alphaMode" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_ALPHACUTOFF :: AiMatKey
pattern AI_MATKEY_GLTF_ALPHACUTOFF = AiMatKey "$mat.gltf.alphaCutoff" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_PBRSPECULARGLOSSINESS :: AiMatKey
pattern AI_MATKEY_GLTF_PBRSPECULARGLOSSINESS = AiMatKey "$mat.gltf.pbrSpecularGlossiness" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_PBRSPECULARGLOSSINESS_GLOSSINESS_FACTOR :: AiMatKey
pattern AI_MATKEY_GLTF_PBRSPECULARGLOSSINESS_GLOSSINESS_FACTOR = AiMatKey "$mat.gltf.pbrMetallicRoughness.glossinessFactor" AI_TEXKEY_NONE_0
pattern AI_MATKEY_GLTF_UNLIT :: AiMatKey
pattern AI_MATKEY_GLTF_UNLIT = AiMatKey "$mat.gltf.unlit" AI_TEXKEY_NONE_0

-- called AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_BASE_COLOR_TEXTURE in assimp
pattern AI_TEXKEY_GLTF_PBRMETALLICROUGHNESS_BASE_COLOR_TEXTURE :: AiTexKey
pattern AI_TEXKEY_GLTF_PBRMETALLICROUGHNESS_BASE_COLOR_TEXTURE = AiTexKey AiTextureType_DIFFUSE 1

-- called AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_METALLICROUGHNESS_TEXTURE in assimp
pattern AI_TEXKEY_GLTF_PBRMETALLICROUGHNESS_METALLICROUGHNESS_TEXTURE :: AiTexKey
pattern AI_TEXKEY_GLTF_PBRMETALLICROUGHNESS_METALLICROUGHNESS_TEXTURE = AiTexKey AiTextureType_UNKNOWN 0

pattern AI_MATKEY_GLTF_TEXTURE_TEXCOORD_BASE :: String
pattern AI_MATKEY_GLTF_TEXTURE_TEXCOORD_BASE = "$tex.file.texCoord"
pattern AI_MATKEY_GLTF_MAPPINGNAME_BASE :: String
pattern AI_MATKEY_GLTF_MAPPINGNAME_BASE = "$tex.mappingname"
pattern AI_MATKEY_GLTF_MAPPINGID_BASE :: String
pattern AI_MATKEY_GLTF_MAPPINGID_BASE = "$tex.mappingid"
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MAG_BASE :: String
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MAG_BASE = "$tex.mappingfiltermag"
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MIN_BASE :: String
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MIN_BASE = "$tex.mappingfiltermin"
pattern AI_MATKEY_GLTF_SCALE_BASE :: String
pattern AI_MATKEY_GLTF_SCALE_BASE = "$tex.scale"
pattern AI_MATKEY_GLTF_STRENGTH_BASE :: String
pattern AI_MATKEY_GLTF_STRENGTH_BASE = "$tex.strength"

pattern AI_MATKEY_GLTF_TEXTURE_TEXCOORD :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_TEXTURE_TEXCOORD texKey = AiMatKey AI_MATKEY_GLTF_TEXTURE_TEXCOORD_BASE texKey
pattern AI_MATKEY_GLTF_MAPPINGNAME :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_MAPPINGNAME texKey = AiMatKey AI_MATKEY_GLTF_MAPPINGNAME_BASE texKey
pattern AI_MATKEY_GLTF_MAPPINGID :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_MAPPINGID texKey = AiMatKey AI_MATKEY_GLTF_MAPPINGID_BASE texKey
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MAG :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MAG texKey = AiMatKey AI_MATKEY_GLTF_MAPPINGFILTER_MAG_BASE texKey
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MIN :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_MAPPINGFILTER_MIN texKey = AiMatKey AI_MATKEY_GLTF_MAPPINGFILTER_MIN_BASE texKey
pattern AI_MATKEY_GLTF_TEXTURE_SCALE :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_TEXTURE_SCALE texKey = AiMatKey AI_MATKEY_GLTF_SCALE_BASE texKey
pattern AI_MATKEY_GLTF_TEXTURE_STRENGTH :: AiTexKey -> AiMatKey
pattern AI_MATKEY_GLTF_TEXTURE_STRENGTH texKey = AiMatKey AI_MATKEY_GLTF_STRENGTH_BASE texKey

foreign import ccall "aiGetMaterialProperty" _aiGetMaterialProperty ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr (Ptr AiMaterialProperty) {-^ pPropOut -} ->
  IO AiReturn

aiGetMaterialProperty ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr (Ptr AiMaterialProperty) {-^ pPropOut -} ->
  IO AiReturn
aiGetMaterialProperty pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pPropOut =
  withCString key $ \keyPtr -> _aiGetMaterialProperty pMat keyPtr typeId index pPropOut
{-# INLINE aiGetMaterialProperty #-}

foreign import ccall "aiGetMaterialFloatArray" _aiGetMaterialFloatArray ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr AiReal {-^ pOut -} ->
  Ptr CUInt {-^ pMax -} ->
  IO AiReturn

aiGetMaterialFloatArray ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiReal {-^ pOut -} ->
  Ptr CUInt {-^ pMax -} ->
  IO AiReturn
aiGetMaterialFloatArray pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pOut pMax =
  withCString key $ \keyPtr -> _aiGetMaterialFloatArray pMat keyPtr typeId index pOut pMax
{-# INLINE aiGetMaterialFloatArray #-}

aiGetMaterialFloat ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiReal {-^ pOut -} ->
  IO AiReturn
aiGetMaterialFloat pMat matKey pOut = aiGetMaterialFloatArray pMat matKey pOut nullPtr
{-# INLINE aiGetMaterialFloat #-}

foreign import ccall "aiGetMaterialIntegerArray" _aiGetMaterialIntegerArray ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr CInt {-^ pOut -} ->
  Ptr CUInt {-^ pMax -} ->
  IO AiReturn

aiGetMaterialIntegerArray ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr CInt {-^ pOut -} ->
  Ptr CUInt {-^ pMax -} ->
  IO AiReturn
aiGetMaterialIntegerArray pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pOut pMax =
  withCString key $ \keyPtr -> _aiGetMaterialIntegerArray pMat keyPtr typeId index pOut pMax
{-# INLINE aiGetMaterialIntegerArray #-}

aiGetMaterialInteger ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr CInt {-^ pOut -} ->
  IO AiReturn
aiGetMaterialInteger pMat matKey pOut = aiGetMaterialIntegerArray pMat matKey pOut nullPtr
{-# INLINE aiGetMaterialInteger #-}

foreign import ccall "aiGetMaterialColor" _aiGetMaterialColor ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr AiColor4D {-^ pOut -} ->
  IO AiReturn

aiGetMaterialColor ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiColor4D {-^ pOut -} ->
  IO AiReturn
aiGetMaterialColor pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialColor pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialColor #-}

foreign import ccall "aiGetMaterialUVTransform" _aiGetMaterialUVTransform ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr AiUVTransform {-^ pOut -} ->
  IO AiReturn

aiGetMaterialUVTransform ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiUVTransform {-^ pOut -} ->
  IO AiReturn
aiGetMaterialUVTransform pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialUVTransform pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialUVTransform #-}

foreign import ccall "aiGetMaterialString" _aiGetMaterialString ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  CUInt {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr AiString {-^ pOut -} ->
  IO AiReturn

aiGetMaterialString ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiString {-^ pOut -} ->
  IO AiReturn
aiGetMaterialString pMat (AiMatKey key (AiTexKey (AiTextureType typeId) index)) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialString pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialString #-}

foreign import ccall "aiGetMaterialTextureCount" aiGetMaterialTextureCount ::
  Ptr AiMaterial {-^ pMat -} ->
  AiTextureType {-^ type -} ->
  IO CUInt

foreign import ccall "aiGetMaterialTexture" _aiGetMaterialTexture::
  Ptr AiMaterial {-^ pMat -} ->
  AiTextureType {-^ type -} ->
  CUInt {-^ index -} ->
  Ptr AiString {-^ path -} ->
  Ptr AiTextureMapping {-^ mapping -} ->
  Ptr CUInt {-^ uvindex -} ->
  Ptr AiReal {-^ blend -} ->
  Ptr AiTextureOp {-^ op -} ->
  Ptr AiTextureMapMode {-^ mapmode -} ->
  Ptr CUInt {-^ flags -} ->
  IO AiReturn

aiGetMaterialTexture ::
  Ptr AiMaterial {-^ pMat -} ->
  AiTexKey {-^ texKey -} ->
  Ptr AiString {-^ path -} ->
  Ptr AiTextureMapping {-^ mapping -} ->
  Ptr CUInt {-^ uvindex -} ->
  Ptr AiReal {-^ blend -} ->
  Ptr AiTextureOp {-^ op -} ->
  Ptr AiTextureMapMode {-^ mapmode -} ->
  Ptr CUInt {-^ flags -} ->
  IO AiReturn
aiGetMaterialTexture pMat (AiTexKey textureType index) path mapping uvindex blend op mapmode flags =
  _aiGetMaterialTexture pMat textureType index path mapping uvindex blend op mapmode flags
{-# INLINE aiGetMaterialTexture #-}
