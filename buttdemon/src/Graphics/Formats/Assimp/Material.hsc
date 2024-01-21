#define THE_HEADER "assimp/material.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Material (
  aiDefaultMaterialName,
  AiTextureOp(..),
  aiTextureOp_Multiply, pattern AiTextureOp_Multiply,
  aiTextureOp_Add, pattern AiTextureOp_Add,
  aiTextureOp_Subtract, pattern AiTextureOp_Subtract,
  aiTextureOp_Divide, pattern AiTextureOp_Divide,
  aiTextureOp_SmoothAdd, pattern AiTextureOp_SmoothAdd,
  aiTextureOp_SignedAdd, pattern AiTextureOp_SignedAdd,
  AiTextureMapMode(..),
  aiTextureMapMode_Wrap, pattern AiTextureMapMode_Wrap,
  aiTextureMapMode_Clamp, pattern AiTextureMapMode_Clamp,
  aiTextureMapMode_Decal, pattern AiTextureMapMode_Decal,
  aiTextureMapMode_Mirror, pattern AiTextureMapMode_Mirror,
  AiTextureMapping(..),
  aiTextureMapping_UV, pattern AiTextureMapping_UV,
  aiTextureMapping_SPHERE, pattern AiTextureMapping_SPHERE,
  aiTextureMapping_CYLINDER, pattern AiTextureMapping_CYLINDER,
  aiTextureMapping_BOX, pattern AiTextureMapping_BOX,
  aiTextureMapping_PLANE, pattern AiTextureMapping_PLANE,
  aiTextureMapping_OTHER, pattern AiTextureMapping_OTHER,
  AiTextureType(..),
  aiTextureType_NONE, pattern AiTextureType_NONE,
  aiTextureType_DIFFUSE, pattern AiTextureType_DIFFUSE,
  aiTextureType_SPECULAR, pattern AiTextureType_SPECULAR,
  aiTextureType_AMBIENT, pattern AiTextureType_AMBIENT,
  aiTextureType_EMISSIVE, pattern AiTextureType_EMISSIVE,
  aiTextureType_HEIGHT, pattern AiTextureType_HEIGHT,
  aiTextureType_NORMALS, pattern AiTextureType_NORMALS,
  aiTextureType_SHININESS, pattern AiTextureType_SHININESS,
  aiTextureType_OPACITY, pattern AiTextureType_OPACITY,
  aiTextureType_DISPLACEMENT, pattern AiTextureType_DISPLACEMENT,
  aiTextureType_LIGHTMAP, pattern AiTextureType_LIGHTMAP,
  aiTextureType_REFLECTION, pattern AiTextureType_REFLECTION,
  aiTextureType_BASE_COLOR, pattern AiTextureType_BASE_COLOR,
  aiTextureType_NORMAL_CAMERA, pattern AiTextureType_NORMAL_CAMERA,
  aiTextureType_EMISSION_COLOR, pattern AiTextureType_EMISSION_COLOR,
  aiTextureType_METALNESS, pattern AiTextureType_METALNESS,
  aiTextureType_DIFFUSE_ROUGHNESS, pattern AiTextureType_DIFFUSE_ROUGHNESS,
  aiTextureType_AMBIENT_OCCLUSION, pattern AiTextureType_AMBIENT_OCCLUSION,
  aiTextureType_SHEEN, pattern AiTextureType_SHEEN,
  aiTextureType_CLEARCOAT, pattern AiTextureType_CLEARCOAT,
  aiTextureType_TRANSMISSION, pattern AiTextureType_TRANSMISSION,
  aiTextureType_UNKNOWN, pattern AiTextureType_UNKNOWN,
  aiTextureTypeToString,
  AiShadingMode(..),
  aiShadingMode_Flat, pattern AiShadingMode_Flat,
  aiShadingMode_Gouraud, pattern AiShadingMode_Gouraud,
  aiShadingMode_Phong, pattern AiShadingMode_Phong,
  aiShadingMode_Blinn, pattern AiShadingMode_Blinn,
  aiShadingMode_Toon, pattern AiShadingMode_Toon,
  aiShadingMode_OrenNayar, pattern AiShadingMode_OrenNayar,
  aiShadingMode_Minnaert, pattern AiShadingMode_Minnaert,
  aiShadingMode_CookTorrance, pattern AiShadingMode_CookTorrance,
  aiShadingMode_NoShading, pattern AiShadingMode_NoShading,
  aiShadingMode_Unlit, pattern AiShadingMode_Unlit,
  aiShadingMode_Fresnel, pattern AiShadingMode_Fresnel,
  aiShadingMode_PBR_BRDF, pattern AiShadingMode_PBR_BRDF,
  AiTextureFlags(..),
  aiTextureFlags_Invert, pattern AiTextureFlags_Invert,
  aiTextureFlags_UseAlpha, pattern AiTextureFlags_UseAlpha,
  aiTextureFlags_IgnoreAlpha, pattern AiTextureFlags_IgnoreAlpha,
  AiBlendMode(..),
  aiBlendMode_Default, pattern AiBlendMode_Default,
  aiBlendMode_Additive, pattern AiBlendMode_Additive,
  AiUVTransform,
  AiPropertyTypeInfo(..),
  aiPTI_Float, pattern AiPTI_Float,
  aiPTI_Double, pattern AiPTI_Double,
  aiPTI_String, pattern AiPTI_String,
  aiPTI_Integer, pattern AiPTI_Integer,
  aiPTI_Buffer, pattern AiPTI_Buffer,
  AiMaterialProperty,
  AiMaterial,
  AiMatKey(..),
  AiTextureKey(..),
  aiMatkeyName,
  aiMatkeyTwosided,
  aiMatkeyShadingModel,
  aiMatkeyEnableWireframe,
  aiMatkeyBlendFunc,
  aiMatkeyOpacity,
  aiMatkeyTransparencyfactor,
  aiMatkeyBumpscaling,
  aiMatkeyShininess,
  aiMatkeyReflectivity,
  aiMatkeyShininessStrength,
  aiMatkeyRefracti,
  aiMatkeyColorDiffuse,
  aiMatkeyColorAmbient,
  aiMatkeyColorSpecular,
  aiMatkeyColorEmissive,
  aiMatkeyColorTransparent,
  aiMatkeyColorReflective,
  aiMatkeyGlobalBackgroundImage,
  aiMatkeyGlobalShaderlang,
  aiMatkeyShaderVertex,
  aiMatkeyShaderFragment,
  aiMatkeyShaderGeo,
  aiMatkeyShaderTesselation,
  aiMatkeyShaderPrimitive,
  aiMatkeyShaderCompute,
  aiMatkeyUseColorMap,
  aiMatkeyBaseColor,
  aiMatkeyBaseColorTexture,
  aiMatkeyUseMetallicMap,
  aiMatkeyMetallicFactor,
  aiMatkeyMetallicTexture,
  aiMatkeyUseRoughnessMap,
  aiMatkeyRoughnessFactor,
  aiMatkeyRoughnessTexture,
  aiMatkeyAnisotropyFactor,
  aiMatkeySpecularFactor,
  aiMatkeyGlossinessFactor,
  aiMatkeySheenColorFactor,
  aiMatkeySheenRoughnessFactor,
  aiMatkeySheenColorTexture,
  aiMatkeySheenRoughnessTexture,
  aiMatkeyClearcoatFactor,
  aiMatkeyClearcoatRoughnessFactor,
  aiMatkeyClearcoatTexture,
  aiMatkeyClearcoatRoughnessTexture,
  aiMatkeyClearcoatNormalTexture,
  aiMatkeyTransmissionFactor,
  aiMatkeyTransmissionTexture,
  aiMatkeyVolumeThicknessFactor,
  aiMatkeyVolumeThicknessTexture,
  aiMatkeyVolumeAttenuationDistance,
  aiMatkeyVolumeAttenuationColor,
  aiMatkeyUseEmissiveMap,
  aiMatkeyEmissiveIntensity,
  aiMatkeyUseAoMap,
  aiMatkeyTextureBase,
  aiMatkeyUvwsrcBase,
  aiMatkeyTexopBase,
  aiMatkeyMappingBase,
  aiMatkeyTexblendBase,
  aiMatkeyMappingmodeUBase,
  aiMatkeyMappingmodeVBase,
  aiMatkeyTexmapAxisBase,
  aiMatkeyUvtransformBase,
  aiMatkeyTexflagsBase,
  aiTextureKeyToMatKey,
  aiGetMaterialProperty,
  aiGetMaterialFloatArray,
  aiGetMaterialFloat,
  aiGetMaterialIntegerArray,
  aiGetMaterialInteger,
  aiGetMaterialColor,
  aiGetMaterialUVTransform,
  aiGetMaterialString,
  aiGetMaterialTextureCount,
  aiGetMaterialTexture,
  withAiMatKey,
  withAiTextureKey,
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import GHC.Ptr
import Graphics.Formats.Assimp.Types

#{cstring AI_DEFAULT_MATERIAL_NAME, aiDefaultMaterialName}

#{cenum enum aiTextureOp, AiTextureOp}
#{cenumerant_ AiTextureOp, aiTextureOp_Multiply, AiTextureOp_Multiply}
#{cenumerant_ AiTextureOp, aiTextureOp_Add, AiTextureOp_Add}
#{cenumerant_ AiTextureOp, aiTextureOp_Subtract, AiTextureOp_Subtract}
#{cenumerant_ AiTextureOp, aiTextureOp_Divide, AiTextureOp_Divide}
#{cenumerant_ AiTextureOp, aiTextureOp_SmoothAdd, AiTextureOp_SmoothAdd}
#{cenumerant_ AiTextureOp, aiTextureOp_SignedAdd, AiTextureOp_SignedAdd}

#{cenum enum aiTextureMapMode, AiTextureMapMode}
#{cenumerant_ AiTextureMapMode, aiTextureMapMode_Wrap, AiTextureMapMode_Wrap}
#{cenumerant_ AiTextureMapMode, aiTextureMapMode_Clamp, AiTextureMapMode_Clamp}
#{cenumerant_ AiTextureMapMode, aiTextureMapMode_Decal, AiTextureMapMode_Decal}
#{cenumerant_ AiTextureMapMode, aiTextureMapMode_Mirror, AiTextureMapMode_Mirror}

#{cenum enum aiTextureMapping, AiTextureMapping}
#{cenumerant_ AiTextureMapping, aiTextureMapping_UV, AiTextureMapping_UV}
#{cenumerant_ AiTextureMapping, aiTextureMapping_SPHERE, AiTextureMapping_SPHERE}
#{cenumerant_ AiTextureMapping, aiTextureMapping_CYLINDER, AiTextureMapping_CYLINDER}
#{cenumerant_ AiTextureMapping, aiTextureMapping_BOX, AiTextureMapping_BOX}
#{cenumerant_ AiTextureMapping, aiTextureMapping_PLANE, AiTextureMapping_PLANE}
#{cenumerant_ AiTextureMapping, aiTextureMapping_OTHER, AiTextureMapping_OTHER}

#{cenum enum aiTextureType, AiTextureType}
#{cenumerant_ AiTextureType, aiTextureType_NONE, AiTextureType_NONE}
#{cenumerant_ AiTextureType, aiTextureType_DIFFUSE, AiTextureType_DIFFUSE}
#{cenumerant_ AiTextureType, aiTextureType_SPECULAR, AiTextureType_SPECULAR}
#{cenumerant_ AiTextureType, aiTextureType_AMBIENT, AiTextureType_AMBIENT}
#{cenumerant_ AiTextureType, aiTextureType_EMISSIVE, AiTextureType_EMISSIVE}
#{cenumerant_ AiTextureType, aiTextureType_HEIGHT, AiTextureType_HEIGHT}
#{cenumerant_ AiTextureType, aiTextureType_NORMALS, AiTextureType_NORMALS}
#{cenumerant_ AiTextureType, aiTextureType_SHININESS, AiTextureType_SHININESS}
#{cenumerant_ AiTextureType, aiTextureType_OPACITY, AiTextureType_OPACITY}
#{cenumerant_ AiTextureType, aiTextureType_DISPLACEMENT, AiTextureType_DISPLACEMENT}
#{cenumerant_ AiTextureType, aiTextureType_LIGHTMAP, AiTextureType_LIGHTMAP}
#{cenumerant_ AiTextureType, aiTextureType_REFLECTION, AiTextureType_REFLECTION}
#{cenumerant_ AiTextureType, aiTextureType_BASE_COLOR, AiTextureType_BASE_COLOR}
#{cenumerant_ AiTextureType, aiTextureType_NORMAL_CAMERA, AiTextureType_NORMAL_CAMERA}
#{cenumerant_ AiTextureType, aiTextureType_EMISSION_COLOR, AiTextureType_EMISSION_COLOR}
#{cenumerant_ AiTextureType, aiTextureType_METALNESS, AiTextureType_METALNESS}
#{cenumerant_ AiTextureType, aiTextureType_DIFFUSE_ROUGHNESS, AiTextureType_DIFFUSE_ROUGHNESS}
#{cenumerant_ AiTextureType, aiTextureType_AMBIENT_OCCLUSION, AiTextureType_AMBIENT_OCCLUSION}
#{cenumerant_ AiTextureType, aiTextureType_SHEEN, AiTextureType_SHEEN}
#{cenumerant_ AiTextureType, aiTextureType_CLEARCOAT, AiTextureType_CLEARCOAT}
#{cenumerant_ AiTextureType, aiTextureType_TRANSMISSION, AiTextureType_TRANSMISSION}
#{cenumerant_ AiTextureType, aiTextureType_UNKNOWN, AiTextureType_UNKNOWN}

#{importfunction_ aiTextureTypeToString, AiTextureType -> IO (ConstPtr CChar)}

#{cenum enum aiShadingMode, AiShadingMode}
#{cenumerant_ AiShadingMode, aiShadingMode_Flat, AiShadingMode_Flat}
#{cenumerant_ AiShadingMode, aiShadingMode_Gouraud, AiShadingMode_Gouraud}
#{cenumerant_ AiShadingMode, aiShadingMode_Phong, AiShadingMode_Phong}
#{cenumerant_ AiShadingMode, aiShadingMode_Blinn, AiShadingMode_Blinn}
#{cenumerant_ AiShadingMode, aiShadingMode_Toon, AiShadingMode_Toon}
#{cenumerant_ AiShadingMode, aiShadingMode_OrenNayar, AiShadingMode_OrenNayar}
#{cenumerant_ AiShadingMode, aiShadingMode_Minnaert, AiShadingMode_Minnaert}
#{cenumerant_ AiShadingMode, aiShadingMode_CookTorrance, AiShadingMode_CookTorrance}
#{cenumerant_ AiShadingMode, aiShadingMode_NoShading, AiShadingMode_NoShading}
#{cenumerant_ AiShadingMode, aiShadingMode_Unlit, AiShadingMode_Unlit}
#{cenumerant_ AiShadingMode, aiShadingMode_Fresnel, AiShadingMode_Fresnel}
#{cenumerant_ AiShadingMode, aiShadingMode_PBR_BRDF, AiShadingMode_PBR_BRDF}

#{cenum enum aiTextureFlags, AiTextureFlags}
#{cenumerant_ AiTextureFlags, aiTextureFlags_Invert, AiTextureFlags_Invert}
#{cenumerant_ AiTextureFlags, aiTextureFlags_UseAlpha, AiTextureFlags_UseAlpha}
#{cenumerant_ AiTextureFlags, aiTextureFlags_IgnoreAlpha, AiTextureFlags_IgnoreAlpha}

#{cenum enum aiBlendMode, AiBlendMode}
#{cenumerant_ AiBlendMode, aiBlendMode_Default, AiBlendMode_Default}
#{cenumerant_ AiBlendMode, aiBlendMode_Additive, AiBlendMode_Additive}

#{cstruct struct aiUVTransform, AiUVTransform}
#{cstructfield struct aiUVTransform, AiUVTransform, mTranslation, AiVector2D}
#{cstructfield struct aiUVTransform, AiUVTransform, mScaling, AiVector2D}
#{cstructfield struct aiUVTransform, AiUVTransform, mRotation, AiReal}

#{cenum enum aiPropertyTypeInfo, AiPropertyTypeInfo}
#{cenumerant_ AiPropertyTypeInfo, aiPTI_Float, AiPTI_Float}
#{cenumerant_ AiPropertyTypeInfo, aiPTI_Double, AiPTI_Double}
#{cenumerant_ AiPropertyTypeInfo, aiPTI_String, AiPTI_String}
#{cenumerant_ AiPropertyTypeInfo, aiPTI_Integer, AiPTI_Integer}
#{cenumerant_ AiPropertyTypeInfo, aiPTI_Buffer, AiPTI_Buffer}

#{cstruct struct aiMaterialProperty, AiMaterialProperty}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mKey, AiString}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mSemantic, CUInt}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mIndex, CUInt}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mDataLength, CUInt}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mType, AiPropertyTypeInfo}
#{cstructfield struct aiMaterialProperty, AiMaterialProperty, mData, Ptr CChar}

#{cstruct struct aiMaterial, AiMaterial}
#{cstructfield struct aiMaterial, AiMaterial, mProperties, Ptr (Ptr AiMaterialProperty)}
#{cstructfield struct aiMaterial, AiMaterial, mNumProperties, CUInt}
#{cstructfield struct aiMaterial, AiMaterial, mNumAllocated, CUInt}

data AiMatKey =
  AiMatKey {
    name :: CString,
    textureType :: CUInt,
    index :: CUInt
  }

data AiTextureKey =
  AiTextureKey {
    textureType :: AiTextureType,
    index :: CUInt
  }

#{matkey AI_MATKEY_NAME, aiMatkeyName}
#{matkey AI_MATKEY_TWOSIDED, aiMatkeyTwosided}
#{matkey AI_MATKEY_SHADING_MODEL, aiMatkeyShadingModel}
#{matkey AI_MATKEY_ENABLE_WIREFRAME, aiMatkeyEnableWireframe}
#{matkey AI_MATKEY_BLEND_FUNC, aiMatkeyBlendFunc}
#{matkey AI_MATKEY_OPACITY, aiMatkeyOpacity}
#{matkey AI_MATKEY_TRANSPARENCYFACTOR, aiMatkeyTransparencyfactor}
#{matkey AI_MATKEY_BUMPSCALING, aiMatkeyBumpscaling}
#{matkey AI_MATKEY_SHININESS, aiMatkeyShininess}
#{matkey AI_MATKEY_REFLECTIVITY, aiMatkeyReflectivity}
#{matkey AI_MATKEY_SHININESS_STRENGTH, aiMatkeyShininessStrength}
#{matkey AI_MATKEY_REFRACTI, aiMatkeyRefracti}
#{matkey AI_MATKEY_COLOR_DIFFUSE, aiMatkeyColorDiffuse}
#{matkey AI_MATKEY_COLOR_AMBIENT, aiMatkeyColorAmbient}
#{matkey AI_MATKEY_COLOR_SPECULAR, aiMatkeyColorSpecular}
#{matkey AI_MATKEY_COLOR_EMISSIVE, aiMatkeyColorEmissive}
#{matkey AI_MATKEY_COLOR_TRANSPARENT, aiMatkeyColorTransparent}
#{matkey AI_MATKEY_COLOR_REFLECTIVE, aiMatkeyColorReflective}
#{matkey AI_MATKEY_GLOBAL_BACKGROUND_IMAGE, aiMatkeyGlobalBackgroundImage}
#{matkey AI_MATKEY_GLOBAL_SHADERLANG, aiMatkeyGlobalShaderlang}
#{matkey AI_MATKEY_SHADER_VERTEX, aiMatkeyShaderVertex}
#{matkey AI_MATKEY_SHADER_FRAGMENT, aiMatkeyShaderFragment}
#{matkey AI_MATKEY_SHADER_GEO, aiMatkeyShaderGeo}
#{matkey AI_MATKEY_SHADER_TESSELATION, aiMatkeyShaderTesselation}
#{matkey AI_MATKEY_SHADER_PRIMITIVE, aiMatkeyShaderPrimitive}
#{matkey AI_MATKEY_SHADER_COMPUTE, aiMatkeyShaderCompute}
#{matkey AI_MATKEY_USE_COLOR_MAP, aiMatkeyUseColorMap}
#{matkey AI_MATKEY_BASE_COLOR, aiMatkeyBaseColor}
#{texturekey AI_MATKEY_BASE_COLOR_TEXTURE, aiMatkeyBaseColorTexture}
#{matkey AI_MATKEY_USE_METALLIC_MAP, aiMatkeyUseMetallicMap}
#{matkey AI_MATKEY_METALLIC_FACTOR, aiMatkeyMetallicFactor}
#{texturekey AI_MATKEY_METALLIC_TEXTURE, aiMatkeyMetallicTexture}
#{matkey AI_MATKEY_USE_ROUGHNESS_MAP, aiMatkeyUseRoughnessMap}
#{matkey AI_MATKEY_ROUGHNESS_FACTOR, aiMatkeyRoughnessFactor}
#{texturekey AI_MATKEY_ROUGHNESS_TEXTURE, aiMatkeyRoughnessTexture}
#{matkey AI_MATKEY_ANISOTROPY_FACTOR, aiMatkeyAnisotropyFactor}
#{matkey AI_MATKEY_SPECULAR_FACTOR, aiMatkeySpecularFactor}
#{matkey AI_MATKEY_GLOSSINESS_FACTOR, aiMatkeyGlossinessFactor}
#{matkey AI_MATKEY_SHEEN_COLOR_FACTOR, aiMatkeySheenColorFactor}
#{matkey AI_MATKEY_SHEEN_ROUGHNESS_FACTOR, aiMatkeySheenRoughnessFactor}
#{texturekey AI_MATKEY_SHEEN_COLOR_TEXTURE, aiMatkeySheenColorTexture}
#{texturekey AI_MATKEY_SHEEN_ROUGHNESS_TEXTURE, aiMatkeySheenRoughnessTexture}
#{matkey AI_MATKEY_CLEARCOAT_FACTOR, aiMatkeyClearcoatFactor}
#{matkey AI_MATKEY_CLEARCOAT_ROUGHNESS_FACTOR, aiMatkeyClearcoatRoughnessFactor}
#{texturekey AI_MATKEY_CLEARCOAT_TEXTURE, aiMatkeyClearcoatTexture}
#{texturekey AI_MATKEY_CLEARCOAT_ROUGHNESS_TEXTURE, aiMatkeyClearcoatRoughnessTexture}
#{texturekey AI_MATKEY_CLEARCOAT_NORMAL_TEXTURE, aiMatkeyClearcoatNormalTexture}
#{matkey AI_MATKEY_TRANSMISSION_FACTOR, aiMatkeyTransmissionFactor}
#{texturekey AI_MATKEY_TRANSMISSION_TEXTURE, aiMatkeyTransmissionTexture}
#{matkey AI_MATKEY_VOLUME_THICKNESS_FACTOR, aiMatkeyVolumeThicknessFactor}
#{texturekey AI_MATKEY_VOLUME_THICKNESS_TEXTURE, aiMatkeyVolumeThicknessTexture}
#{matkey AI_MATKEY_VOLUME_ATTENUATION_DISTANCE, aiMatkeyVolumeAttenuationDistance}
#{matkey AI_MATKEY_VOLUME_ATTENUATION_COLOR, aiMatkeyVolumeAttenuationColor}
#{matkey AI_MATKEY_USE_EMISSIVE_MAP, aiMatkeyUseEmissiveMap}
#{matkey AI_MATKEY_EMISSIVE_INTENSITY, aiMatkeyEmissiveIntensity}
#{matkey AI_MATKEY_USE_AO_MAP, aiMatkeyUseAoMap}
#{cstring _AI_MATKEY_TEXTURE_BASE, aiMatkeyTextureBase}
#{cstring _AI_MATKEY_UVWSRC_BASE, aiMatkeyUvwsrcBase}
#{cstring _AI_MATKEY_TEXOP_BASE, aiMatkeyTexopBase}
#{cstring _AI_MATKEY_MAPPING_BASE, aiMatkeyMappingBase}
#{cstring _AI_MATKEY_TEXBLEND_BASE, aiMatkeyTexblendBase}
#{cstring _AI_MATKEY_MAPPINGMODE_U_BASE, aiMatkeyMappingmodeUBase}
#{cstring _AI_MATKEY_MAPPINGMODE_V_BASE, aiMatkeyMappingmodeVBase}
#{cstring _AI_MATKEY_TEXMAP_AXIS_BASE, aiMatkeyTexmapAxisBase}
#{cstring _AI_MATKEY_UVTRANSFORM_BASE, aiMatkeyUvtransformBase}
#{cstring _AI_MATKEY_TEXFLAGS_BASE, aiMatkeyTexflagsBase}

aiTextureKeyToMatKey :: CString -> AiTextureKey -> AiMatKey
aiTextureKeyToMatKey name (AiTextureKey textureType index) = AiMatKey name (fromIntegral textureType) index

#{importfunction_ aiGetMaterialProperty, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr (ConstPtr AiMaterialProperty) -> IO AiReturn}
#{importfunction_ aiGetMaterialFloatArray, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr AiReal -> Ptr CUInt -> IO AiReturn}
#{importfunction_ aiGetMaterialFloat, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr AiReal -> IO AiReturn}
#{importfunction_ aiGetMaterialIntegerArray, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr CInt -> Ptr CUInt -> IO AiReturn}
#{importfunction_ aiGetMaterialInteger, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr CInt -> IO AiReturn}
#{importfunction_ aiGetMaterialColor, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr AiColor4D -> IO AiReturn}
#{importfunction_ aiGetMaterialUVTransform, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr AiUVTransform -> IO AiReturn}
#{importfunction_ aiGetMaterialString, Ptr AiMaterial -> CString -> CUInt -> CUInt -> Ptr AiString -> IO AiReturn}
#{importfunction_ aiGetMaterialTextureCount, Ptr AiMaterial -> AiTextureType -> IO CUInt}
#{importfunction_ aiGetMaterialTexture, Ptr AiMaterial -> AiTextureType -> CUInt -> Ptr AiString -> Ptr AiTextureMapping -> Ptr CUInt -> Ptr AiReal -> Ptr AiTextureOp -> Ptr AiTextureMapMode -> Ptr CUInt -> IO AiReturn}

withAiMatKey :: AiMatKey -> (CString -> CUInt -> CUInt -> a) -> a
withAiMatKey (AiMatKey n t i) cont = cont n t i

withAiTextureKey :: AiTextureKey -> (AiTextureType -> CUInt -> a) -> a
withAiTextureKey (AiTextureKey t i) cont = cont t i
