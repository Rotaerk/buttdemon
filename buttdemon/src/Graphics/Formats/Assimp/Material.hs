{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ViewPatterns #-}

module Graphics.Formats.Assimp.Material where

import Graphics.Formats.Assimp.Types

import Data.Bits
import Data.Int
import Data.Word
import Foreign.C.String
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

pattern AI_DEFAULT_MATERIAL_NAME :: AiString
pattern AI_DEFAULT_MATERIAL_NAME = "DefaultMaterial"

newtype AiTextureOp = AiTextureOp Word32 deriving (Eq, Ord, Show, Generic)
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

newtype AiTextureMapMode = AiTextureMapMode Word32 deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiTextureMapMode

pattern AiTextureMapMode_Wrap :: AiTextureMapMode
pattern AiTextureMapMode_Wrap = AiTextureMapMode 0x0
pattern AiTextureMapMode_Clamp :: AiTextureMapMode
pattern AiTextureMapMode_Clamp = AiTextureMapMode 0x1
pattern AiTextureMapMode_Mirror :: AiTextureMapMode
pattern AiTextureMapMode_Mirror = AiTextureMapMode 0x2
pattern AiTextureMapMode_Decal :: AiTextureMapMode
pattern AiTextureMapMode_Decal = AiTextureMapMode 0x3

newtype AiTextureMapping = AiTextureMapping Word32 deriving (Eq, Ord, Show, Generic)
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

newtype AiTextureType = AiTextureType Word32 deriving (Eq, Ord, Show, Generic)
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

newtype AiShadingMode = AiShadingMode Word32 deriving (Eq, Ord, Show, Generic)
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

newtype AiTextureFlags = AiTextureFlags Word32 deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiTextureFlags

pattern AiTextureFlags_Invert :: AiTextureFlags
pattern AiTextureFlags_Invert = AiTextureFlags 0x1
pattern AiTextureFlags_UseAlpha :: AiTextureFlags
pattern AiTextureFlags_UseAlpha = AiTextureFlags 0x2
pattern AiTextureFlags_IgnoreAlpha :: AiTextureFlags
pattern AiTextureFlags_IgnoreAlpha = AiTextureFlags 0x4

newtype AiBlendMode = AiBlendMode Word32 deriving (Eq, Ord, Show, Generic)
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

newtype AiPropertyTypeInfo = AiPropertyTypeInfo Word32 deriving (Eq, Ord, Show, Generic)
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
    aiMaterialProperty'semantic :: Word32,
    aiMaterialProperty'index :: Word32,
    aiMaterialProperty'dataLength :: Word32,
    aiMaterialProperty'type :: AiPropertyTypeInfo,
    aiMaterialProperty'data :: Ptr Int8
  }
  deriving (Generic)

instance PrimBytes AiMaterialProperty

data AiMaterial =
  AiMaterial {
    aiMaterial'properties :: Ptr AiMaterialProperty,
    aiMaterial'numProperties :: Word32,
    aiMaterial'numAllocated :: Word32
  }
  deriving (Generic)

instance PrimBytes AiMaterial

data AiMatKey = AiMatKey String AiTextureType Word32

pattern AI_MATKEY_NAME :: AiMatKey
pattern AI_MATKEY_NAME = AiMatKey "?mat.name" AiTextureType_NONE 0
pattern AI_MATKEY_TWOSIDED :: AiMatKey
pattern AI_MATKEY_TWOSIDED = AiMatKey "$mat.twosided" AiTextureType_NONE 0
pattern AI_MATKEY_SHADING_MODEL :: AiMatKey
pattern AI_MATKEY_SHADING_MODEL = AiMatKey "$mat.shadingm" AiTextureType_NONE 0
pattern AI_MATKEY_ENABLE_WIREFRAME :: AiMatKey
pattern AI_MATKEY_ENABLE_WIREFRAME = AiMatKey "$mat.wireframe" AiTextureType_NONE 0
pattern AI_MATKEY_BLEND_FUNC :: AiMatKey
pattern AI_MATKEY_BLEND_FUNC = AiMatKey "$mat.blend" AiTextureType_NONE 0
pattern AI_MATKEY_OPACITY :: AiMatKey
pattern AI_MATKEY_OPACITY = AiMatKey "$mat.opacity" AiTextureType_NONE 0
pattern AI_MATKEY_TRANSPARENCYFACTOR :: AiMatKey
pattern AI_MATKEY_TRANSPARENCYFACTOR = AiMatKey "$mat.transparencyfactor" AiTextureType_NONE 0
pattern AI_MATKEY_BUMPSCALING :: AiMatKey
pattern AI_MATKEY_BUMPSCALING = AiMatKey "$mat.bumpscaling" AiTextureType_NONE 0
pattern AI_MATKEY_SHININESS :: AiMatKey
pattern AI_MATKEY_SHININESS = AiMatKey "$mat.shininess" AiTextureType_NONE 0
pattern AI_MATKEY_REFLECTIVITY :: AiMatKey
pattern AI_MATKEY_REFLECTIVITY = AiMatKey "$mat.reflectivity" AiTextureType_NONE 0
pattern AI_MATKEY_SHININESS_STRENGTH :: AiMatKey
pattern AI_MATKEY_SHININESS_STRENGTH = AiMatKey "$mat.shinpercent" AiTextureType_NONE 0
pattern AI_MATKEY_REFRACTI :: AiMatKey
pattern AI_MATKEY_REFRACTI = AiMatKey "$mat.refracti" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_DIFFUSE :: AiMatKey
pattern AI_MATKEY_COLOR_DIFFUSE = AiMatKey "$clr.diffuse" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_AMBIENT :: AiMatKey
pattern AI_MATKEY_COLOR_AMBIENT = AiMatKey "$clr.ambient" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_SPECULAR :: AiMatKey
pattern AI_MATKEY_COLOR_SPECULAR = AiMatKey "$clr.specular" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_EMISSIVE :: AiMatKey
pattern AI_MATKEY_COLOR_EMISSIVE = AiMatKey "$clr.emissive" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_TRANSPARENT :: AiMatKey
pattern AI_MATKEY_COLOR_TRANSPARENT = AiMatKey "$clr.transparent" AiTextureType_NONE 0
pattern AI_MATKEY_COLOR_REFLECTIVE :: AiMatKey
pattern AI_MATKEY_COLOR_REFLECTIVE = AiMatKey "$clr.reflective" AiTextureType_NONE 0
pattern AI_MATKEY_GLOBAL_BACKGROUND_IMAGE :: AiMatKey
pattern AI_MATKEY_GLOBAL_BACKGROUND_IMAGE = AiMatKey "?bg.global" AiTextureType_NONE 0
pattern AI_MATKEY_GLOBAL_SHADERLANG :: AiMatKey
pattern AI_MATKEY_GLOBAL_SHADERLANG = AiMatKey "?sh.lang" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_VERTEX :: AiMatKey
pattern AI_MATKEY_SHADER_VERTEX = AiMatKey "?sh.vs" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_FRAGMENT :: AiMatKey
pattern AI_MATKEY_SHADER_FRAGMENT = AiMatKey "?sh.fs" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_GEO :: AiMatKey
pattern AI_MATKEY_SHADER_GEO = AiMatKey "?sh.gs" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_TESSELATION :: AiMatKey
pattern AI_MATKEY_SHADER_TESSELATION = AiMatKey "?sh.ts" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_PRIMITIVE :: AiMatKey
pattern AI_MATKEY_SHADER_PRIMITIVE = AiMatKey "?sh.ps" AiTextureType_NONE 0
pattern AI_MATKEY_SHADER_COMPUTE :: AiMatKey
pattern AI_MATKEY_SHADER_COMPUTE = AiMatKey "?sh.cs" AiTextureType_NONE 0

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

pattern AI_MATKEY_TEXTURE :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE textureType index = AiMatKey AI_MATKEY_TEXTURE_BASE textureType index

pattern AI_MATKEY_TEXTURE_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_DIFFUSE index = AI_MATKEY_TEXTURE AiTextureType_DIFFUSE index
pattern AI_MATKEY_TEXTURE_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_SPECULAR index = AI_MATKEY_TEXTURE AiTextureType_SPECULAR index
pattern AI_MATKEY_TEXTURE_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_AMBIENT index = AI_MATKEY_TEXTURE AiTextureType_AMBIENT index
pattern AI_MATKEY_TEXTURE_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_EMISSIVE index = AI_MATKEY_TEXTURE AiTextureType_EMISSIVE index
pattern AI_MATKEY_TEXTURE_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_NORMALS index = AI_MATKEY_TEXTURE AiTextureType_NORMALS index
pattern AI_MATKEY_TEXTURE_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_HEIGHT index = AI_MATKEY_TEXTURE AiTextureType_HEIGHT index
pattern AI_MATKEY_TEXTURE_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_SHININESS index = AI_MATKEY_TEXTURE AiTextureType_SHININESS index
pattern AI_MATKEY_TEXTURE_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_OPACITY index = AI_MATKEY_TEXTURE AiTextureType_OPACITY index
pattern AI_MATKEY_TEXTURE_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_DISPLACEMENT index = AI_MATKEY_TEXTURE AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_TEXTURE_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_LIGHTMAP index = AI_MATKEY_TEXTURE AiTextureType_LIGHTMAP index
pattern AI_MATKEY_TEXTURE_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXTURE_REFLECTION index = AI_MATKEY_TEXTURE AiTextureType_REFLECTION index

pattern AI_MATKEY_UVWSRC :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC textureType index = AiMatKey AI_MATKEY_UVWSRC_BASE textureType index

pattern AI_MATKEY_UVWSRC_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_DIFFUSE index = AI_MATKEY_UVWSRC AiTextureType_DIFFUSE index
pattern AI_MATKEY_UVWSRC_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_SPECULAR index = AI_MATKEY_UVWSRC AiTextureType_SPECULAR index
pattern AI_MATKEY_UVWSRC_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_AMBIENT index = AI_MATKEY_UVWSRC AiTextureType_AMBIENT index
pattern AI_MATKEY_UVWSRC_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_EMISSIVE index = AI_MATKEY_UVWSRC AiTextureType_EMISSIVE index
pattern AI_MATKEY_UVWSRC_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_NORMALS index = AI_MATKEY_UVWSRC AiTextureType_NORMALS index
pattern AI_MATKEY_UVWSRC_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_HEIGHT index = AI_MATKEY_UVWSRC AiTextureType_HEIGHT index
pattern AI_MATKEY_UVWSRC_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_SHININESS index = AI_MATKEY_UVWSRC AiTextureType_SHININESS index
pattern AI_MATKEY_UVWSRC_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_OPACITY index = AI_MATKEY_UVWSRC AiTextureType_OPACITY index
pattern AI_MATKEY_UVWSRC_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_DISPLACEMENT index = AI_MATKEY_UVWSRC AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_UVWSRC_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_LIGHTMAP index = AI_MATKEY_UVWSRC AiTextureType_LIGHTMAP index
pattern AI_MATKEY_UVWSRC_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_UVWSRC_REFLECTION index = AI_MATKEY_UVWSRC AiTextureType_REFLECTION index

pattern AI_MATKEY_TEXOP :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP textureType index = AiMatKey AI_MATKEY_TEXOP_BASE textureType index

pattern AI_MATKEY_TEXOP_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_DIFFUSE index = AI_MATKEY_TEXOP AiTextureType_DIFFUSE index
pattern AI_MATKEY_TEXOP_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_SPECULAR index = AI_MATKEY_TEXOP AiTextureType_SPECULAR index
pattern AI_MATKEY_TEXOP_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_AMBIENT index = AI_MATKEY_TEXOP AiTextureType_AMBIENT index
pattern AI_MATKEY_TEXOP_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_EMISSIVE index = AI_MATKEY_TEXOP AiTextureType_EMISSIVE index
pattern AI_MATKEY_TEXOP_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_NORMALS index = AI_MATKEY_TEXOP AiTextureType_NORMALS index
pattern AI_MATKEY_TEXOP_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_HEIGHT index = AI_MATKEY_TEXOP AiTextureType_HEIGHT index
pattern AI_MATKEY_TEXOP_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_SHININESS index = AI_MATKEY_TEXOP AiTextureType_SHININESS index
pattern AI_MATKEY_TEXOP_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_OPACITY index = AI_MATKEY_TEXOP AiTextureType_OPACITY index
pattern AI_MATKEY_TEXOP_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_DISPLACEMENT index = AI_MATKEY_TEXOP AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_TEXOP_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_LIGHTMAP index = AI_MATKEY_TEXOP AiTextureType_LIGHTMAP index
pattern AI_MATKEY_TEXOP_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXOP_REFLECTION index = AI_MATKEY_TEXOP AiTextureType_REFLECTION index

pattern AI_MATKEY_MAPPING :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING textureType index = AiMatKey AI_MATKEY_MAPPING_BASE textureType index

pattern AI_MATKEY_MAPPING_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_DIFFUSE index = AI_MATKEY_MAPPING AiTextureType_DIFFUSE index
pattern AI_MATKEY_MAPPING_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_SPECULAR index = AI_MATKEY_MAPPING AiTextureType_SPECULAR index
pattern AI_MATKEY_MAPPING_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_AMBIENT index = AI_MATKEY_MAPPING AiTextureType_AMBIENT index
pattern AI_MATKEY_MAPPING_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_EMISSIVE index = AI_MATKEY_MAPPING AiTextureType_EMISSIVE index
pattern AI_MATKEY_MAPPING_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_NORMALS index = AI_MATKEY_MAPPING AiTextureType_NORMALS index
pattern AI_MATKEY_MAPPING_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_HEIGHT index = AI_MATKEY_MAPPING AiTextureType_HEIGHT index
pattern AI_MATKEY_MAPPING_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_SHININESS index = AI_MATKEY_MAPPING AiTextureType_SHININESS index
pattern AI_MATKEY_MAPPING_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_OPACITY index = AI_MATKEY_MAPPING AiTextureType_OPACITY index
pattern AI_MATKEY_MAPPING_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_DISPLACEMENT index = AI_MATKEY_MAPPING AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_MAPPING_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_LIGHTMAP index = AI_MATKEY_MAPPING AiTextureType_LIGHTMAP index
pattern AI_MATKEY_MAPPING_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPING_REFLECTION index = AI_MATKEY_MAPPING AiTextureType_REFLECTION index

pattern AI_MATKEY_TEXBLEND :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND textureType index = AiMatKey AI_MATKEY_TEXBLEND_BASE textureType index

pattern AI_MATKEY_TEXBLEND_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_DIFFUSE index = AI_MATKEY_TEXBLEND AiTextureType_DIFFUSE index
pattern AI_MATKEY_TEXBLEND_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_SPECULAR index = AI_MATKEY_TEXBLEND AiTextureType_SPECULAR index
pattern AI_MATKEY_TEXBLEND_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_AMBIENT index = AI_MATKEY_TEXBLEND AiTextureType_AMBIENT index
pattern AI_MATKEY_TEXBLEND_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_EMISSIVE index = AI_MATKEY_TEXBLEND AiTextureType_EMISSIVE index
pattern AI_MATKEY_TEXBLEND_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_NORMALS index = AI_MATKEY_TEXBLEND AiTextureType_NORMALS index
pattern AI_MATKEY_TEXBLEND_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_HEIGHT index = AI_MATKEY_TEXBLEND AiTextureType_HEIGHT index
pattern AI_MATKEY_TEXBLEND_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_SHININESS index = AI_MATKEY_TEXBLEND AiTextureType_SHININESS index
pattern AI_MATKEY_TEXBLEND_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_OPACITY index = AI_MATKEY_TEXBLEND AiTextureType_OPACITY index
pattern AI_MATKEY_TEXBLEND_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_DISPLACEMENT index = AI_MATKEY_TEXBLEND AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_TEXBLEND_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_LIGHTMAP index = AI_MATKEY_TEXBLEND AiTextureType_LIGHTMAP index
pattern AI_MATKEY_TEXBLEND_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXBLEND_REFLECTION index = AI_MATKEY_TEXBLEND AiTextureType_REFLECTION index

pattern AI_MATKEY_MAPPINGMODE_U :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U textureType index = AiMatKey AI_MATKEY_MAPPINGMODE_U_BASE textureType index

pattern AI_MATKEY_MAPPINGMODE_U_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_DIFFUSE index = AI_MATKEY_MAPPINGMODE_U AiTextureType_DIFFUSE index
pattern AI_MATKEY_MAPPINGMODE_U_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_SPECULAR index = AI_MATKEY_MAPPINGMODE_U AiTextureType_SPECULAR index
pattern AI_MATKEY_MAPPINGMODE_U_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_AMBIENT index = AI_MATKEY_MAPPINGMODE_U AiTextureType_AMBIENT index
pattern AI_MATKEY_MAPPINGMODE_U_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_EMISSIVE index = AI_MATKEY_MAPPINGMODE_U AiTextureType_EMISSIVE index
pattern AI_MATKEY_MAPPINGMODE_U_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_NORMALS index = AI_MATKEY_MAPPINGMODE_U AiTextureType_NORMALS index
pattern AI_MATKEY_MAPPINGMODE_U_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_HEIGHT index = AI_MATKEY_MAPPINGMODE_U AiTextureType_HEIGHT index
pattern AI_MATKEY_MAPPINGMODE_U_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_SHININESS index = AI_MATKEY_MAPPINGMODE_U AiTextureType_SHININESS index
pattern AI_MATKEY_MAPPINGMODE_U_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_OPACITY index = AI_MATKEY_MAPPINGMODE_U AiTextureType_OPACITY index
pattern AI_MATKEY_MAPPINGMODE_U_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_DISPLACEMENT index = AI_MATKEY_MAPPINGMODE_U AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_MAPPINGMODE_U_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_LIGHTMAP index = AI_MATKEY_MAPPINGMODE_U AiTextureType_LIGHTMAP index
pattern AI_MATKEY_MAPPINGMODE_U_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_U_REFLECTION index = AI_MATKEY_MAPPINGMODE_U AiTextureType_REFLECTION index

pattern AI_MATKEY_MAPPINGMODE_V :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V textureType index = AiMatKey AI_MATKEY_MAPPINGMODE_V_BASE textureType index

pattern AI_MATKEY_MAPPINGMODE_V_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_DIFFUSE index = AI_MATKEY_MAPPINGMODE_V AiTextureType_DIFFUSE index
pattern AI_MATKEY_MAPPINGMODE_V_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_SPECULAR index = AI_MATKEY_MAPPINGMODE_V AiTextureType_SPECULAR index
pattern AI_MATKEY_MAPPINGMODE_V_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_AMBIENT index = AI_MATKEY_MAPPINGMODE_V AiTextureType_AMBIENT index
pattern AI_MATKEY_MAPPINGMODE_V_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_EMISSIVE index = AI_MATKEY_MAPPINGMODE_V AiTextureType_EMISSIVE index
pattern AI_MATKEY_MAPPINGMODE_V_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_NORMALS index = AI_MATKEY_MAPPINGMODE_V AiTextureType_NORMALS index
pattern AI_MATKEY_MAPPINGMODE_V_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_HEIGHT index = AI_MATKEY_MAPPINGMODE_V AiTextureType_HEIGHT index
pattern AI_MATKEY_MAPPINGMODE_V_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_SHININESS index = AI_MATKEY_MAPPINGMODE_V AiTextureType_SHININESS index
pattern AI_MATKEY_MAPPINGMODE_V_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_OPACITY index = AI_MATKEY_MAPPINGMODE_V AiTextureType_OPACITY index
pattern AI_MATKEY_MAPPINGMODE_V_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_DISPLACEMENT index = AI_MATKEY_MAPPINGMODE_V AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_MAPPINGMODE_V_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_LIGHTMAP index = AI_MATKEY_MAPPINGMODE_V AiTextureType_LIGHTMAP index
pattern AI_MATKEY_MAPPINGMODE_V_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_MAPPINGMODE_V_REFLECTION index = AI_MATKEY_MAPPINGMODE_V AiTextureType_REFLECTION index

pattern AI_MATKEY_TEXMAP_AXIS :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS textureType index = AiMatKey AI_MATKEY_TEXMAP_AXIS_BASE textureType index

pattern AI_MATKEY_TEXMAP_AXIS_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_DIFFUSE index = AI_MATKEY_TEXMAP_AXIS AiTextureType_DIFFUSE index
pattern AI_MATKEY_TEXMAP_AXIS_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_SPECULAR index = AI_MATKEY_TEXMAP_AXIS AiTextureType_SPECULAR index
pattern AI_MATKEY_TEXMAP_AXIS_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_AMBIENT index = AI_MATKEY_TEXMAP_AXIS AiTextureType_AMBIENT index
pattern AI_MATKEY_TEXMAP_AXIS_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_EMISSIVE index = AI_MATKEY_TEXMAP_AXIS AiTextureType_EMISSIVE index
pattern AI_MATKEY_TEXMAP_AXIS_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_NORMALS index = AI_MATKEY_TEXMAP_AXIS AiTextureType_NORMALS index
pattern AI_MATKEY_TEXMAP_AXIS_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_HEIGHT index = AI_MATKEY_TEXMAP_AXIS AiTextureType_HEIGHT index
pattern AI_MATKEY_TEXMAP_AXIS_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_SHININESS index = AI_MATKEY_TEXMAP_AXIS AiTextureType_SHININESS index
pattern AI_MATKEY_TEXMAP_AXIS_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_OPACITY index = AI_MATKEY_TEXMAP_AXIS AiTextureType_OPACITY index
pattern AI_MATKEY_TEXMAP_AXIS_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_DISPLACEMENT index = AI_MATKEY_TEXMAP_AXIS AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_TEXMAP_AXIS_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_LIGHTMAP index = AI_MATKEY_TEXMAP_AXIS AiTextureType_LIGHTMAP index
pattern AI_MATKEY_TEXMAP_AXIS_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXMAP_AXIS_REFLECTION index = AI_MATKEY_TEXMAP_AXIS AiTextureType_REFLECTION index

pattern AI_MATKEY_UVTRANSFORM :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM textureType index = AiMatKey AI_MATKEY_UVTRANSFORM_BASE textureType index

pattern AI_MATKEY_UVTRANSFORM_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_DIFFUSE index = AI_MATKEY_UVTRANSFORM AiTextureType_DIFFUSE index
pattern AI_MATKEY_UVTRANSFORM_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_SPECULAR index = AI_MATKEY_UVTRANSFORM AiTextureType_SPECULAR index
pattern AI_MATKEY_UVTRANSFORM_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_AMBIENT index = AI_MATKEY_UVTRANSFORM AiTextureType_AMBIENT index
pattern AI_MATKEY_UVTRANSFORM_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_EMISSIVE index = AI_MATKEY_UVTRANSFORM AiTextureType_EMISSIVE index
pattern AI_MATKEY_UVTRANSFORM_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_NORMALS index = AI_MATKEY_UVTRANSFORM AiTextureType_NORMALS index
pattern AI_MATKEY_UVTRANSFORM_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_HEIGHT index = AI_MATKEY_UVTRANSFORM AiTextureType_HEIGHT index
pattern AI_MATKEY_UVTRANSFORM_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_SHININESS index = AI_MATKEY_UVTRANSFORM AiTextureType_SHININESS index
pattern AI_MATKEY_UVTRANSFORM_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_OPACITY index = AI_MATKEY_UVTRANSFORM AiTextureType_OPACITY index
pattern AI_MATKEY_UVTRANSFORM_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_DISPLACEMENT index = AI_MATKEY_UVTRANSFORM AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_UVTRANSFORM_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_LIGHTMAP index = AI_MATKEY_UVTRANSFORM AiTextureType_LIGHTMAP index
pattern AI_MATKEY_UVTRANSFORM_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_UVTRANSFORM_REFLECTION index = AI_MATKEY_UVTRANSFORM AiTextureType_REFLECTION index

pattern AI_MATKEY_TEXFLAGS :: AiTextureType -> Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS textureType index = AiMatKey AI_MATKEY_TEXFLAGS_BASE textureType index

pattern AI_MATKEY_TEXFLAGS_DIFFUSE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_DIFFUSE index = AI_MATKEY_TEXFLAGS AiTextureType_DIFFUSE index
pattern AI_MATKEY_TEXFLAGS_SPECULAR :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_SPECULAR index = AI_MATKEY_TEXFLAGS AiTextureType_SPECULAR index
pattern AI_MATKEY_TEXFLAGS_AMBIENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_AMBIENT index = AI_MATKEY_TEXFLAGS AiTextureType_AMBIENT index
pattern AI_MATKEY_TEXFLAGS_EMISSIVE :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_EMISSIVE index = AI_MATKEY_TEXFLAGS AiTextureType_EMISSIVE index
pattern AI_MATKEY_TEXFLAGS_NORMALS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_NORMALS index = AI_MATKEY_TEXFLAGS AiTextureType_NORMALS index
pattern AI_MATKEY_TEXFLAGS_HEIGHT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_HEIGHT index = AI_MATKEY_TEXFLAGS AiTextureType_HEIGHT index
pattern AI_MATKEY_TEXFLAGS_SHININESS :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_SHININESS index = AI_MATKEY_TEXFLAGS AiTextureType_SHININESS index
pattern AI_MATKEY_TEXFLAGS_OPACITY :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_OPACITY index = AI_MATKEY_TEXFLAGS AiTextureType_OPACITY index
pattern AI_MATKEY_TEXFLAGS_DISPLACEMENT :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_DISPLACEMENT index = AI_MATKEY_TEXFLAGS AiTextureType_DISPLACEMENT index
pattern AI_MATKEY_TEXFLAGS_LIGHTMAP :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_LIGHTMAP index = AI_MATKEY_TEXFLAGS AiTextureType_LIGHTMAP index
pattern AI_MATKEY_TEXFLAGS_REFLECTION :: Word32 -> AiMatKey
pattern AI_MATKEY_TEXFLAGS_REFLECTION index = AI_MATKEY_TEXFLAGS AiTextureType_REFLECTION index

foreign import ccall "aiGetMaterialProperty" _aiGetMaterialProperty ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr (Ptr AiMaterialProperty) {-^ pPropOut -} ->
  IO AiReturn

aiGetMaterialProperty ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr (Ptr AiMaterialProperty) {-^ pPropOut -} ->
  IO AiReturn
aiGetMaterialProperty pMat (AiMatKey key (AiTextureType typeId) index) pPropOut =
  withCString key $ \keyPtr -> _aiGetMaterialProperty pMat keyPtr typeId index pPropOut
{-# INLINE aiGetMaterialProperty #-}

foreign import ccall "aiGetMaterialFloatArray" _aiGetMaterialFloatArray ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr AiReal {-^ pOut -} ->
  Ptr Word32 {-^ pMax -} ->
  IO AiReturn

aiGetMaterialFloatArray ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiReal {-^ pOut -} ->
  Ptr Word32 {-^ pMax -} ->
  IO AiReturn
aiGetMaterialFloatArray pMat (AiMatKey key (AiTextureType typeId) index) pOut pMax =
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
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr Int32 {-^ pOut -} ->
  Ptr Word32 {-^ pMax -} ->
  IO AiReturn

aiGetMaterialIntegerArray ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr Int32 {-^ pOut -} ->
  Ptr Word32 {-^ pMax -} ->
  IO AiReturn
aiGetMaterialIntegerArray pMat (AiMatKey key (AiTextureType typeId) index) pOut pMax =
  withCString key $ \keyPtr -> _aiGetMaterialIntegerArray pMat keyPtr typeId index pOut pMax
{-# INLINE aiGetMaterialIntegerArray #-}

aiGetMaterialInteger ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr Int32 {-^ pOut -} ->
  IO AiReturn
aiGetMaterialInteger pMat matKey pOut = aiGetMaterialIntegerArray pMat matKey pOut nullPtr
{-# INLINE aiGetMaterialInteger #-}

foreign import ccall "aiGetMaterialColor" _aiGetMaterialColor ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr AiColor4D {-^ pOut -} ->
  IO AiReturn

aiGetMaterialColor ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiColor4D {-^ pOut -} ->
  IO AiReturn
aiGetMaterialColor pMat (AiMatKey key (AiTextureType typeId) index) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialColor pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialColor #-}

foreign import ccall "aiGetMaterialUVTransform" _aiGetMaterialUVTransform ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr AiUVTransform {-^ pOut -} ->
  IO AiReturn

aiGetMaterialUVTransform ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiUVTransform {-^ pOut -} ->
  IO AiReturn
aiGetMaterialUVTransform pMat (AiMatKey key (AiTextureType typeId) index) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialUVTransform pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialUVTransform #-}

foreign import ccall "aiGetMaterialString" _aiGetMaterialString ::
  Ptr AiMaterial {-^ pMat -} ->
  CString {-^ pKey -} ->
  Word32 {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr AiString {-^ pOut -} ->
  IO AiReturn

aiGetMaterialString ::
  Ptr AiMaterial {-^ pMat -} ->
  AiMatKey {-^ matKey -} ->
  Ptr AiString {-^ pOut -} ->
  IO AiReturn
aiGetMaterialString pMat (AiMatKey key (AiTextureType typeId) index) pOut =
  withCString key $ \keyPtr -> _aiGetMaterialString pMat keyPtr typeId index pOut
{-# INLINE aiGetMaterialString #-}

foreign import ccall "aiGetMaterialTextureCount" aiGetMaterialTextureCount ::
  Ptr AiMaterial {-^ pMat -} ->
  AiTextureType {-^ type -} ->
  IO Word32

foreign import ccall "aiGetMaterialTexture" aiGetMaterialTexture::
  Ptr AiMaterial {-^ pMat -} ->
  AiTextureType {-^ type -} ->
  Word32 {-^ index -} ->
  Ptr AiString {-^ path -} ->
  Ptr AiTextureMapping {-^ mapping -} ->
  Ptr Word32 {-^ uvindex -} ->
  Ptr AiReal {-^ blend -} ->
  Ptr AiTextureOp {-^ op -} ->
  Ptr AiTextureMapMode {-^ mapmode -} ->
  Ptr Word32 {-^ flags -} ->
  IO AiReturn
