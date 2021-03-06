{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Config where

import Data.Bits
import Data.String
import Foreign.C.Types
import GHC.Generics
import Numeric.PrimBytes

newtype AiComponent = AiComponent CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiComponent

pattern AiComponent_NORMALS :: AiComponent
pattern AiComponent_NORMALS = AiComponent 0x2
pattern AiComponent_TANGENTS_AND_BITANGENTS :: AiComponent
pattern AiComponent_TANGENTS_AND_BITANGENTS = AiComponent 0x4
pattern AiComponent_COLORS :: AiComponent
pattern AiComponent_COLORS = AiComponent 0x8
pattern AiComponent_TEXCOORDS :: AiComponent
pattern AiComponent_TEXCOORDS = AiComponent 0x10
pattern AiComponent_BONEWEIGHTS :: AiComponent
pattern AiComponent_BONEWEIGHTS = AiComponent 0x20
pattern AiComponent_ANIMATIONS :: AiComponent
pattern AiComponent_ANIMATIONS = AiComponent 0x40
pattern AiComponent_TEXTURES :: AiComponent
pattern AiComponent_TEXTURES = AiComponent 0x80
pattern AiComponent_LIGHTS :: AiComponent
pattern AiComponent_LIGHTS = AiComponent 0x100
pattern AiComponent_CAMERAS :: AiComponent
pattern AiComponent_CAMERAS = AiComponent 0x200
pattern AiComponent_MESHES :: AiComponent
pattern AiComponent_MESHES = AiComponent 0x400
pattern AiComponent_MATERIALS :: AiComponent
pattern AiComponent_MATERIALS = AiComponent 0x800

aiComponent_COLORSn :: Int -> AiComponent
aiComponent_COLORSn = AiComponent . shift 0x100000

aiComponent_TEXCOORDSn :: Int -> AiComponent
aiComponent_TEXCOORDSn = AiComponent . shift 0x2000000

newtype AiUVTrafo = AiUVTrafo CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiUVTrafo

pattern AiUVTrafo_SCALING :: AiUVTrafo
pattern AiUVTrafo_SCALING = AiUVTrafo 0x1
pattern AiUVTrafo_ROTATION :: AiUVTrafo
pattern AiUVTrafo_ROTATION = AiUVTrafo 0x2
pattern AiUVTrafo_TRANSLATION :: AiUVTrafo
pattern AiUVTrafo_TRANSLATION = AiUVTrafo 0x4
aiUVTrafo_ALL :: AiUVTrafo
aiUVTrafo_ALL = AiUVTrafo_SCALING .|. AiUVTrafo_ROTATION .|. AiUVTrafo_TRANSLATION

pattern AI_CONFIG_GLOB_MEASURE_TIME :: (Eq a, IsString a) => a
pattern AI_CONFIG_GLOB_MEASURE_TIME = "GLOB_MEASURE_TIME"
pattern AI_CONFIG_IMPORT_NO_SKELETON_MESHES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_NO_SKELETON_MESHES = "IMPORT_NO_SKELETON_MESHES"
pattern AI_CONFIG_PP_SBBC_MAX_BONES :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_SBBC_MAX_BONES = "PP_SBBC_MAX_BONES"
pattern AI_SBBC_DEFAULT_MAX_BONES :: (Eq a, Num a) => a
pattern AI_SBBC_DEFAULT_MAX_BONES = 60
pattern AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE = "PP_CT_MAX_SMOOTHING_ANGLE"
pattern AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX = "PP_CT_TEXTURE_CHANNEL_INDEX"
pattern AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE = "PP_GSN_MAX_SMOOTHING_ANGLE"
pattern AI_CONFIG_IMPORT_MDL_COLORMAP :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_COLORMAP = "IMPORT_MDL_COLORMAP"
pattern AI_CONFIG_PP_RRM_EXCLUDE_LIST :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_RRM_EXCLUDE_LIST = "PP_RRM_EXCLUDE_LIST"
pattern AI_CONFIG_PP_PTV_KEEP_HIERARCHY :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_PTV_KEEP_HIERARCHY = "PP_PTV_KEEP_HIERARCHY"
pattern AI_CONFIG_PP_PTV_NORMALIZE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_PTV_NORMALIZE = "PP_PTV_NORMALIZE"
pattern AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION = "PP_PTV_ADD_ROOT_TRANSFORMATION"
pattern AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION = "PP_PTV_ROOT_TRANSFORMATION"
pattern AI_CONFIG_PP_FD_REMOVE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_FD_REMOVE = "PP_FD_REMOVE"
pattern AI_CONFIG_PP_FD_CHECKAREA :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_FD_CHECKAREA = "PP_FD_CHECKAREA"
pattern AI_CONFIG_PP_OG_EXCLUDE_LIST :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_OG_EXCLUDE_LIST = "PP_OG_EXCLUDE_LIST"
pattern AI_CONFIG_PP_SLM_TRIANGLE_LIMIT :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_SLM_TRIANGLE_LIMIT = "PP_SLM_TRIANGLE_LIMIT"
pattern AI_SLM_DEFAULT_MAX_TRIANGLES :: (Eq a, Num a) => a
pattern AI_SLM_DEFAULT_MAX_TRIANGLES = 1000000
pattern AI_CONFIG_PP_SLM_VERTEX_LIMIT :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_SLM_VERTEX_LIMIT = "PP_SLM_VERTEX_LIMIT"
pattern AI_SLM_DEFAULT_MAX_VERTICES :: (Eq a, Num a) => a
pattern AI_SLM_DEFAULT_MAX_VERTICES = 1000000
pattern AI_CONFIG_PP_LBW_MAX_WEIGHTS :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_LBW_MAX_WEIGHTS = "PP_LBW_MAX_WEIGHTS"
pattern AI_LMW_MAX_WEIGHTS :: (Eq a, Num a) => a
pattern AI_LMW_MAX_WEIGHTS = 4
pattern AI_CONFIG_PP_DB_THRESHOLD :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_DB_THRESHOLD = "PP_DB_THRESHOLD"
pattern AI_DEBONE_THRESHOLD :: (Eq a, Fractional a) => a
pattern AI_DEBONE_THRESHOLD = 1.0
pattern AI_CONFIG_PP_DB_ALL_OR_NONE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_DB_ALL_OR_NONE = "PP_DB_ALL_OR_NONE"
pattern PP_ICL_PTCACHE_SIZE :: (Eq a, Num a) => a
pattern PP_ICL_PTCACHE_SIZE = 12
pattern AI_CONFIG_PP_ICL_PTCACHE_SIZE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_ICL_PTCACHE_SIZE = "PP_ICL_PTCACHE_SIZE"
pattern AI_CONFIG_PP_RVC_FLAGS :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_RVC_FLAGS = "PP_RVC_FLAGS"
pattern AI_CONFIG_PP_SBP_REMOVE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_SBP_REMOVE = "PP_SBP_REMOVE"
pattern AI_CONFIG_PP_FID_ANIM_ACCURACY :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_FID_ANIM_ACCURACY = "PP_FID_ANIM_ACCURACY"
pattern AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS = "PP_FID_IGNORE_TEXTURECOORDS"
pattern AI_CONFIG_PP_TUV_EVALUATE :: (Eq a, IsString a) => a
pattern AI_CONFIG_PP_TUV_EVALUATE = "PP_TUV_EVALUATE"
pattern AI_CONFIG_FAVOUR_SPEED :: (Eq a, IsString a) => a
pattern AI_CONFIG_FAVOUR_SPEED = "FAVOUR_SPEED"
pattern AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS = "IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS"
pattern AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS = "IMPORT_FBX_READ_ALL_MATERIALS"
pattern AI_CONFIG_IMPORT_FBX_READ_MATERIALS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_MATERIALS = "IMPORT_FBX_READ_MATERIALS"
pattern AI_CONFIG_IMPORT_FBX_READ_TEXTURES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_TEXTURES = "IMPORT_FBX_READ_TEXTURES"
pattern AI_CONFIG_IMPORT_FBX_READ_CAMERAS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_CAMERAS = "IMPORT_FBX_READ_CAMERAS"
pattern AI_CONFIG_IMPORT_FBX_READ_LIGHTS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_LIGHTS = "IMPORT_FBX_READ_LIGHTS"
pattern AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS = "IMPORT_FBX_READ_ANIMATIONS"
pattern AI_CONFIG_IMPORT_FBX_STRICT_MODE :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_STRICT_MODE = "IMPORT_FBX_STRICT_MODE"
pattern AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS = "IMPORT_FBX_PRESERVE_PIVOTS"
pattern AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES = "IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES"
pattern AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING = "AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING"
pattern AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES = "AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES"
pattern AI_CONFIG_FBX_CONVERT_TO_M :: (Eq a, IsString a) => a
pattern AI_CONFIG_FBX_CONVERT_TO_M = "AI_CONFIG_FBX_CONVERT_TO_M"
pattern AI_CONFIG_IMPORT_GLOBAL_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_GLOBAL_KEYFRAME = "IMPORT_GLOBAL_KEYFRAME"
pattern AI_CONFIG_IMPORT_MD3_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD3_KEYFRAME = "IMPORT_MD3_KEYFRAME"
pattern AI_CONFIG_IMPORT_MD2_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD2_KEYFRAME = "IMPORT_MD2_KEYFRAME"
pattern AI_CONFIG_IMPORT_MDL_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_KEYFRAME = "IMPORT_MDL_KEYFRAME"
pattern AI_CONFIG_IMPORT_MDC_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDC_KEYFRAME = "IMPORT_MDC_KEYFRAME"
pattern AI_CONFIG_IMPORT_SMD_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_SMD_KEYFRAME = "IMPORT_SMD_KEYFRAME"
pattern AI_CONFIG_IMPORT_UNREAL_KEYFRAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_UNREAL_KEYFRAME = "IMPORT_UNREAL_KEYFRAME"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS = "IMPORT_MDL_HL1_READ_ANIMATIONS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS = "IMPORT_MDL_HL1_READ_ANIMATION_EVENTS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS = "IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS = "IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS = "IMPORT_MDL_HL1_READ_ATTACHMENTS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS = "IMPORT_MDL_HL1_READ_BONE_CONTROLLERS"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES = "IMPORT_MDL_HL1_READ_HITBOXES"
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO = "IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO"
pattern AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST = "IMPORT_SMD_LOAD_ANIMATION_LIST"
pattern AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL = "IMPORT_AC_SEPARATE_BFCULL"
pattern AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION = "IMPORT_AC_EVAL_SUBDIVISION"
pattern AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS = "UNREAL_HANDLE_FLAGS"
pattern AI_CONFIG_IMPORT_TER_MAKE_UVS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_TER_MAKE_UVS = "IMPORT_TER_MAKE_UVS"
pattern AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS = "IMPORT_ASE_RECONSTRUCT_NORMALS"
pattern AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART = "IMPORT_MD3_HANDLE_MULTIPART"
pattern AI_CONFIG_IMPORT_MD3_SKIN_NAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD3_SKIN_NAME = "IMPORT_MD3_SKIN_NAME"
pattern AI_CONFIG_IMPORT_MD3_SHADER_SRC :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD3_SHADER_SRC = "IMPORT_MD3_SHADER_SRC"
pattern AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY = "IMPORT_LWO_ONE_LAYER_ONLY"
pattern AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD = "IMPORT_MD5_NO_ANIM_AUTOLOAD"
pattern AI_CONFIG_IMPORT_LWS_ANIM_START :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_LWS_ANIM_START = "IMPORT_LWS_ANIM_START"
pattern AI_CONFIG_IMPORT_LWS_ANIM_END :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_LWS_ANIM_END = "IMPORT_LWS_ANIM_END"
pattern AI_CONFIG_IMPORT_IRR_ANIM_FPS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_IRR_ANIM_FPS = "IMPORT_IRR_ANIM_FPS"
pattern AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE = "IMPORT_OGRE_MATERIAL_FILE"
pattern AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME = "IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME"
pattern AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT :: (Eq a, IsString a) => a
pattern AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT = "AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT"
pattern AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS = "IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS"
pattern AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION = "IMPORT_IFC_CUSTOM_TRIANGULATION"
pattern AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE = "IMPORT_IFC_SMOOTHING_ANGLE"
pattern AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE :: (Eq a, Fractional a) => a
pattern AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE = 10.0
pattern AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION = "IMPORT_IFC_CYLINDRICAL_TESSELLATION"
pattern AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION :: (Eq a, Num a) => a
pattern AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION = 32
pattern AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION = "IMPORT_COLLADA_IGNORE_UP_DIRECTION"
pattern AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES :: (Eq a, IsString a) => a
pattern AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES = "IMPORT_COLLADA_USE_COLLADA_NAMES"
pattern AI_CONFIG_EXPORT_XFILE_64BIT :: (Eq a, IsString a) => a
pattern AI_CONFIG_EXPORT_XFILE_64BIT = "EXPORT_XFILE_64BIT"
pattern AI_CONFIG_EXPORT_POINT_CLOUDS :: (Eq a, IsString a) => a
pattern AI_CONFIG_EXPORT_POINT_CLOUDS = "EXPORT_POINT_CLOUDS"
pattern AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY :: (Eq a, IsString a) => a
pattern AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY = "GLOBAL_SCALE_FACTOR"
pattern AI_CONFIG_GLOBAL_SCALE_FACTOR_DEFAULT :: (Eq a, Fractional a) => a
pattern AI_CONFIG_GLOBAL_SCALE_FACTOR_DEFAULT = 1.0
pattern AI_CONFIG_APP_SCALE_KEY :: (Eq a, IsString a) => a
pattern AI_CONFIG_APP_SCALE_KEY = "APP_SCALE_FACTOR"
