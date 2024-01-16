{-# OPTIONS_GHC -optc-DTHE_HEADER="assimp/config.h" #-}
{-# LINE 1 "src/Graphics/Formats/Assimp/Config.hsc" #-}
{-# LANGUAGE MagicHash #-}




module Graphics.Formats.Assimp.Config where

import Foreign.C.String
import Foreign.C.Types

foreign import capi "assimp/config.h value AI_CONFIG_GLOB_MEASURE_TIME" _AI_CONFIG_GLOB_MEASURE_TIME :: CString
{-# LINE 12 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_NO_SKELETON_MESHES" _AI_CONFIG_IMPORT_NO_SKELETON_MESHES :: CString
{-# LINE 13 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_SBBC_MAX_BONES" _AI_CONFIG_PP_SBBC_MAX_BONES :: CString
{-# LINE 14 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_SBBC_DEFAULT_MAX_BONES" _AI_SBBC_DEFAULT_MAX_BONES :: CInt
pattern AI_SBBC_DEFAULT_MAX_BONES :: (Eq a, Num a) => a
pattern AI_SBBC_DEFAULT_MAX_BONES <- ((== fromIntegral _AI_SBBC_DEFAULT_MAX_BONES) -> True)
  where AI_SBBC_DEFAULT_MAX_BONES = fromIntegral _AI_SBBC_DEFAULT_MAX_BONES
{-# LINE 15 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE" _AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE :: CString
{-# LINE 16 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX" _AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX :: CString
{-# LINE 17 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE" _AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE :: CString
{-# LINE 18 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_COLORMAP" _AI_CONFIG_IMPORT_MDL_COLORMAP :: CString
{-# LINE 19 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_RRM_EXCLUDE_LIST" _AI_CONFIG_PP_RRM_EXCLUDE_LIST :: CString
{-# LINE 20 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_PTV_KEEP_HIERARCHY" _AI_CONFIG_PP_PTV_KEEP_HIERARCHY :: CString
{-# LINE 21 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_PTV_NORMALIZE" _AI_CONFIG_PP_PTV_NORMALIZE :: CString
{-# LINE 22 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION" _AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION :: CString
{-# LINE 23 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION" _AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION :: CString
{-# LINE 24 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_FD_REMOVE" _AI_CONFIG_PP_FD_REMOVE :: CString
{-# LINE 25 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_FD_CHECKAREA" _AI_CONFIG_PP_FD_CHECKAREA :: CString
{-# LINE 26 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_OG_EXCLUDE_LIST" _AI_CONFIG_PP_OG_EXCLUDE_LIST :: CString
{-# LINE 27 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_SLM_TRIANGLE_LIMIT" _AI_CONFIG_PP_SLM_TRIANGLE_LIMIT :: CString
{-# LINE 28 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_SLM_DEFAULT_MAX_TRIANGLES" _AI_SLM_DEFAULT_MAX_TRIANGLES :: CInt
pattern AI_SLM_DEFAULT_MAX_TRIANGLES :: (Eq a, Num a) => a
pattern AI_SLM_DEFAULT_MAX_TRIANGLES <- ((== fromIntegral _AI_SLM_DEFAULT_MAX_TRIANGLES) -> True)
  where AI_SLM_DEFAULT_MAX_TRIANGLES = fromIntegral _AI_SLM_DEFAULT_MAX_TRIANGLES
{-# LINE 29 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_SLM_VERTEX_LIMIT" _AI_CONFIG_PP_SLM_VERTEX_LIMIT :: CString
{-# LINE 30 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_SLM_DEFAULT_MAX_VERTICES" _AI_SLM_DEFAULT_MAX_VERTICES :: CInt
pattern AI_SLM_DEFAULT_MAX_VERTICES :: (Eq a, Num a) => a
pattern AI_SLM_DEFAULT_MAX_VERTICES <- ((== fromIntegral _AI_SLM_DEFAULT_MAX_VERTICES) -> True)
  where AI_SLM_DEFAULT_MAX_VERTICES = fromIntegral _AI_SLM_DEFAULT_MAX_VERTICES
{-# LINE 31 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_LBW_MAX_WEIGHTS" _AI_CONFIG_PP_LBW_MAX_WEIGHTS :: CString
{-# LINE 32 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_LMW_MAX_WEIGHTS" _AI_LMW_MAX_WEIGHTS :: CInt
pattern AI_LMW_MAX_WEIGHTS :: (Eq a, Num a) => a
pattern AI_LMW_MAX_WEIGHTS <- ((== fromIntegral _AI_LMW_MAX_WEIGHTS) -> True)
  where AI_LMW_MAX_WEIGHTS = fromIntegral _AI_LMW_MAX_WEIGHTS
{-# LINE 33 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_DB_THRESHOLD" _AI_CONFIG_PP_DB_THRESHOLD :: CString
{-# LINE 34 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_DEBONE_THRESHOLD" _AI_DEBONE_THRESHOLD :: CFloat
{-# LINE 35 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_DB_ALL_OR_NONE" _AI_CONFIG_PP_DB_ALL_OR_NONE :: CString
{-# LINE 36 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value PP_ICL_PTCACHE_SIZE" _PP_ICL_PTCACHE_SIZE :: CInt
pattern PP_ICL_PTCACHE_SIZE :: (Eq a, Num a) => a
pattern PP_ICL_PTCACHE_SIZE <- ((== fromIntegral _PP_ICL_PTCACHE_SIZE) -> True)
  where PP_ICL_PTCACHE_SIZE = fromIntegral _PP_ICL_PTCACHE_SIZE
{-# LINE 37 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_ICL_PTCACHE_SIZE" _AI_CONFIG_PP_ICL_PTCACHE_SIZE :: CString
{-# LINE 38 "src/Graphics/Formats/Assimp/Config.hsc" #-}


{-# LINE 42 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_NORMALS" aiComponent_NORMALS :: CUInt
pattern AiComponent_NORMALS :: (Eq a, Num a) => a
pattern AiComponent_NORMALS <- ((== fromIntegral aiComponent_NORMALS) -> True)
  where AiComponent_NORMALS = fromIntegral aiComponent_NORMALS
{-# LINE 43 "src/Graphics/Formats/Assimp/Config.hsc" #-}

{-# LINE 44 "src/Graphics/Formats/Assimp/Config.hsc" #-}


{-# LINE 48 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_TANGENTS_AND_BITANGENTS" aiComponent_TANGENTS_AND_BITANGENTS :: CUInt
pattern AiComponent_TANGENTS_AND_BITANGENTS :: (Eq a, Num a) => a
pattern AiComponent_TANGENTS_AND_BITANGENTS <- ((== fromIntegral aiComponent_TANGENTS_AND_BITANGENTS) -> True)
  where AiComponent_TANGENTS_AND_BITANGENTS = fromIntegral aiComponent_TANGENTS_AND_BITANGENTS
{-# LINE 49 "src/Graphics/Formats/Assimp/Config.hsc" #-}

{-# LINE 50 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h value aiComponent_COLORS" aiComponent_COLORS :: CInt
pattern AiComponent_COLORS :: (Eq a, Num a) => a
pattern AiComponent_COLORS <- ((== fromIntegral aiComponent_COLORS) -> True)
  where AiComponent_COLORS = fromIntegral aiComponent_COLORS
{-# LINE 52 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_TEXCOORDS" aiComponent_TEXCOORDS :: CInt
pattern AiComponent_TEXCOORDS :: (Eq a, Num a) => a
pattern AiComponent_TEXCOORDS <- ((== fromIntegral aiComponent_TEXCOORDS) -> True)
  where AiComponent_TEXCOORDS = fromIntegral aiComponent_TEXCOORDS
{-# LINE 53 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_BONEWEIGHTS" aiComponent_BONEWEIGHTS :: CInt
pattern AiComponent_BONEWEIGHTS :: (Eq a, Num a) => a
pattern AiComponent_BONEWEIGHTS <- ((== fromIntegral aiComponent_BONEWEIGHTS) -> True)
  where AiComponent_BONEWEIGHTS = fromIntegral aiComponent_BONEWEIGHTS
{-# LINE 54 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_ANIMATIONS" aiComponent_ANIMATIONS :: CInt
pattern AiComponent_ANIMATIONS :: (Eq a, Num a) => a
pattern AiComponent_ANIMATIONS <- ((== fromIntegral aiComponent_ANIMATIONS) -> True)
  where AiComponent_ANIMATIONS = fromIntegral aiComponent_ANIMATIONS
{-# LINE 55 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_TEXTURES" aiComponent_TEXTURES :: CInt
pattern AiComponent_TEXTURES :: (Eq a, Num a) => a
pattern AiComponent_TEXTURES <- ((== fromIntegral aiComponent_TEXTURES) -> True)
  where AiComponent_TEXTURES = fromIntegral aiComponent_TEXTURES
{-# LINE 56 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_LIGHTS" aiComponent_LIGHTS :: CInt
pattern AiComponent_LIGHTS :: (Eq a, Num a) => a
pattern AiComponent_LIGHTS <- ((== fromIntegral aiComponent_LIGHTS) -> True)
  where AiComponent_LIGHTS = fromIntegral aiComponent_LIGHTS
{-# LINE 57 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_CAMERAS" aiComponent_CAMERAS :: CInt
pattern AiComponent_CAMERAS :: (Eq a, Num a) => a
pattern AiComponent_CAMERAS <- ((== fromIntegral aiComponent_CAMERAS) -> True)
  where AiComponent_CAMERAS = fromIntegral aiComponent_CAMERAS
{-# LINE 58 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_MESHES" aiComponent_MESHES :: CInt
pattern AiComponent_MESHES :: (Eq a, Num a) => a
pattern AiComponent_MESHES <- ((== fromIntegral aiComponent_MESHES) -> True)
  where AiComponent_MESHES = fromIntegral aiComponent_MESHES
{-# LINE 59 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value aiComponent_MATERIALS" aiComponent_MATERIALS :: CInt
pattern AiComponent_MATERIALS :: (Eq a, Num a) => a
pattern AiComponent_MATERIALS <- ((== fromIntegral aiComponent_MATERIALS) -> True)
  where AiComponent_MATERIALS = fromIntegral aiComponent_MATERIALS
{-# LINE 60 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h aiComponent_COLORSn" aiComponent_COLORSn :: CUInt -> CUInt
foreign import capi "assimp/config.h aiComponent_TEXCOORDSn" aiComponent_TEXCOORDSn :: CUInt -> CUInt

foreign import capi "assimp/config.h value AI_CONFIG_PP_RVC_FLAGS" _AI_CONFIG_PP_RVC_FLAGS :: CString
{-# LINE 65 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_SBP_REMOVE" _AI_CONFIG_PP_SBP_REMOVE :: CString
{-# LINE 66 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_FID_ANIM_ACCURACY" _AI_CONFIG_PP_FID_ANIM_ACCURACY :: CString
{-# LINE 67 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS" _AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS :: CString
{-# LINE 68 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h value AI_UVTRAFO_SCALING" _AI_UVTRAFO_SCALING :: CInt
pattern AI_UVTRAFO_SCALING :: (Eq a, Num a) => a
pattern AI_UVTRAFO_SCALING <- ((== fromIntegral _AI_UVTRAFO_SCALING) -> True)
  where AI_UVTRAFO_SCALING = fromIntegral _AI_UVTRAFO_SCALING
{-# LINE 70 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_UVTRAFO_ROTATION" _AI_UVTRAFO_ROTATION :: CInt
pattern AI_UVTRAFO_ROTATION :: (Eq a, Num a) => a
pattern AI_UVTRAFO_ROTATION <- ((== fromIntegral _AI_UVTRAFO_ROTATION) -> True)
  where AI_UVTRAFO_ROTATION = fromIntegral _AI_UVTRAFO_ROTATION
{-# LINE 71 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_UVTRAFO_TRANSLATION" _AI_UVTRAFO_TRANSLATION :: CInt
pattern AI_UVTRAFO_TRANSLATION :: (Eq a, Num a) => a
pattern AI_UVTRAFO_TRANSLATION <- ((== fromIntegral _AI_UVTRAFO_TRANSLATION) -> True)
  where AI_UVTRAFO_TRANSLATION = fromIntegral _AI_UVTRAFO_TRANSLATION
{-# LINE 72 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_UVTRAFO_ALL" _AI_UVTRAFO_ALL :: CInt
pattern AI_UVTRAFO_ALL :: (Eq a, Num a) => a
pattern AI_UVTRAFO_ALL <- ((== fromIntegral _AI_UVTRAFO_ALL) -> True)
  where AI_UVTRAFO_ALL = fromIntegral _AI_UVTRAFO_ALL
{-# LINE 73 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h value AI_CONFIG_PP_TUV_EVALUATE" _AI_CONFIG_PP_TUV_EVALUATE :: CString
{-# LINE 75 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_FAVOUR_SPEED" _AI_CONFIG_FAVOUR_SPEED :: CString
{-# LINE 76 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_SCHEMA_DOCUMENT_PROVIDER" _AI_CONFIG_IMPORT_SCHEMA_DOCUMENT_PROVIDER :: CString
{-# LINE 77 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS" _AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS :: CString
{-# LINE 78 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS" _AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS :: CString
{-# LINE 79 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_MATERIALS" _AI_CONFIG_IMPORT_FBX_READ_MATERIALS :: CString
{-# LINE 80 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_TEXTURES" _AI_CONFIG_IMPORT_FBX_READ_TEXTURES :: CString
{-# LINE 81 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_CAMERAS" _AI_CONFIG_IMPORT_FBX_READ_CAMERAS :: CString
{-# LINE 82 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_LIGHTS" _AI_CONFIG_IMPORT_FBX_READ_LIGHTS :: CString
{-# LINE 83 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS" _AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS :: CString
{-# LINE 84 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_READ_WEIGHTS" _AI_CONFIG_IMPORT_FBX_READ_WEIGHTS :: CString
{-# LINE 85 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_STRICT_MODE" _AI_CONFIG_IMPORT_FBX_STRICT_MODE :: CString
{-# LINE 86 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS" _AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS :: CString
{-# LINE 87 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES" _AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES :: CString
{-# LINE 88 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING" _AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING :: CString
{-# LINE 89 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES" _AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES :: CString
{-# LINE 90 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_FBX_CONVERT_TO_M" _AI_CONFIG_FBX_CONVERT_TO_M :: CString
{-# LINE 91 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_FBX_USE_SKELETON_BONE_CONTAINER" _AI_CONFIG_FBX_USE_SKELETON_BONE_CONTAINER :: CString
{-# LINE 92 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_GLOBAL_KEYFRAME" _AI_CONFIG_IMPORT_GLOBAL_KEYFRAME :: CString
{-# LINE 94 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD3_KEYFRAME" _AI_CONFIG_IMPORT_MD3_KEYFRAME :: CString
{-# LINE 95 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD2_KEYFRAME" _AI_CONFIG_IMPORT_MD2_KEYFRAME :: CString
{-# LINE 96 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_KEYFRAME" _AI_CONFIG_IMPORT_MDL_KEYFRAME :: CString
{-# LINE 97 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDC_KEYFRAME" _AI_CONFIG_IMPORT_MDC_KEYFRAME :: CString
{-# LINE 98 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_SMD_KEYFRAME" _AI_CONFIG_IMPORT_SMD_KEYFRAME :: CString
{-# LINE 99 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_UNREAL_KEYFRAME" _AI_CONFIG_IMPORT_UNREAL_KEYFRAME :: CString
{-# LINE 100 "src/Graphics/Formats/Assimp/Config.hsc" #-}

foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS" _AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS :: CString
{-# LINE 102 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS" _AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS :: CString
{-# LINE 103 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS" _AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS :: CString
{-# LINE 104 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS" _AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS :: CString
{-# LINE 105 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS" _AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS :: CString
{-# LINE 106 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS" _AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS :: CString
{-# LINE 107 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES" _AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES :: CString
{-# LINE 108 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO" _AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO :: CString
{-# LINE 109 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST" _AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST :: CString
{-# LINE 110 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL" _AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL :: CString
{-# LINE 111 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION" _AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION :: CString
{-# LINE 112 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS" _AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS :: CString
{-# LINE 113 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_TER_MAKE_UVS" _AI_CONFIG_IMPORT_TER_MAKE_UVS :: CString
{-# LINE 114 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS" _AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS :: CString
{-# LINE 115 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART" _AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART :: CString
{-# LINE 116 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD3_SKIN_NAME" _AI_CONFIG_IMPORT_MD3_SKIN_NAME :: CString
{-# LINE 117 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD3_LOAD_SHADERS" _AI_CONFIG_IMPORT_MD3_LOAD_SHADERS :: CString
{-# LINE 118 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD3_SHADER_SRC" _AI_CONFIG_IMPORT_MD3_SHADER_SRC :: CString
{-# LINE 119 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY" _AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY :: CString
{-# LINE 120 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD" _AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD :: CString
{-# LINE 121 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_LWS_ANIM_START" _AI_CONFIG_IMPORT_LWS_ANIM_START :: CString
{-# LINE 122 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_LWS_ANIM_END" _AI_CONFIG_IMPORT_LWS_ANIM_END :: CString
{-# LINE 123 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_IRR_ANIM_FPS" _AI_CONFIG_IMPORT_IRR_ANIM_FPS :: CString
{-# LINE 124 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE" _AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE :: CString
{-# LINE 125 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME" _AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME :: CString
{-# LINE 126 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT" _AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT :: CString
{-# LINE 127 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS" _AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS :: CString
{-# LINE 128 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION" _AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION :: CString
{-# LINE 129 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE" _AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE :: CString
{-# LINE 130 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE" _AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE :: CFloat
{-# LINE 131 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION" _AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION :: CString
{-# LINE 132 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION" _AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION :: CInt
pattern AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION :: (Eq a, Num a) => a
pattern AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION <- ((== fromIntegral _AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION) -> True)
  where AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION = fromIntegral _AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION
{-# LINE 133 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION" _AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION :: CString
{-# LINE 134 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_COLLADA_IGNORE_UNIT_SIZE" _AI_CONFIG_IMPORT_COLLADA_IGNORE_UNIT_SIZE :: CString
{-# LINE 135 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES" _AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES :: CString
{-# LINE 136 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_EXPORT_XFILE_64BIT" _AI_CONFIG_EXPORT_XFILE_64BIT :: CString
{-# LINE 137 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_EXPORT_POINT_CLOUDS" _AI_CONFIG_EXPORT_POINT_CLOUDS :: CString
{-# LINE 138 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_USE_GLTF_PBR_SPECULAR_GLOSSINESS" _AI_CONFIG_USE_GLTF_PBR_SPECULAR_GLOSSINESS :: CString
{-# LINE 139 "src/Graphics/Formats/Assimp/Config.hsc" #-}
foreign import capi "assimp/config.h value AI_CONFIG_EXPORT_GLTF_UNLIMITED_SKINNING_BONES_PER_VERTEX" _AI_CONFIG_EXPORT_GLTF_UNLIMITED_SKINNING_BONES_PER_VERTEX :: CString
{-# LINE 140 "src/Graphics/Formats/Assimp/Config.hsc" #-}
