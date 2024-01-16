{-# LANGUAGE MagicHash #-}

#define THE_HEADER "assimp/config.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Config where

import Foreign.C.String
import Foreign.C.Types

#{cstring_uppercase "AI_CONFIG_GLOB_MEASURE_TIME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_NO_SKELETON_MESHES"}
#{cstring_uppercase "AI_CONFIG_PP_SBBC_MAX_BONES"}
#{cint_uppercase "AI_SBBC_DEFAULT_MAX_BONES"}
#{cstring_uppercase "AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE"}
#{cstring_uppercase "AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX"}
#{cstring_uppercase "AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_COLORMAP"}
#{cstring_uppercase "AI_CONFIG_PP_RRM_EXCLUDE_LIST"}
#{cstring_uppercase "AI_CONFIG_PP_PTV_KEEP_HIERARCHY"}
#{cstring_uppercase "AI_CONFIG_PP_PTV_NORMALIZE"}
#{cstring_uppercase "AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION"}
#{cstring_uppercase "AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION"}
#{cstring_uppercase "AI_CONFIG_PP_FD_REMOVE"}
#{cstring_uppercase "AI_CONFIG_PP_FD_CHECKAREA"}
#{cstring_uppercase "AI_CONFIG_PP_OG_EXCLUDE_LIST"}
#{cstring_uppercase "AI_CONFIG_PP_SLM_TRIANGLE_LIMIT"}
#{cint_uppercase "AI_SLM_DEFAULT_MAX_TRIANGLES"}
#{cstring_uppercase "AI_CONFIG_PP_SLM_VERTEX_LIMIT"}
#{cint_uppercase "AI_SLM_DEFAULT_MAX_VERTICES"}
#{cstring_uppercase "AI_CONFIG_PP_LBW_MAX_WEIGHTS"}
#{cint_uppercase "AI_LMW_MAX_WEIGHTS"}
#{cstring_uppercase "AI_CONFIG_PP_DB_THRESHOLD"}
#{cfloat_uppercase "AI_DEBONE_THRESHOLD"}
#{cstring_uppercase "AI_CONFIG_PP_DB_ALL_OR_NONE"}
#{cint_uppercase "PP_ICL_PTCACHE_SIZE"}
#{cstring_uppercase "AI_CONFIG_PP_ICL_PTCACHE_SIZE"}

#ifdef SWIG
#{cint "aiComponent_NORMALS", "aiComponent_NORMALS", "AiComponent_NORMALS"}
#else
#{cuint "aiComponent_NORMALS", "aiComponent_NORMALS", "AiComponent_NORMALS"}
#endif

#ifdef SWIG
#{cint "aiComponent_TANGENTS_AND_BITANGENTS", "aiComponent_TANGENTS_AND_BITANGENTS", "AiComponent_TANGENTS_AND_BITANGENTS"}
#else
#{cuint "aiComponent_TANGENTS_AND_BITANGENTS", "aiComponent_TANGENTS_AND_BITANGENTS", "AiComponent_TANGENTS_AND_BITANGENTS"}
#endif

#{cint "aiComponent_COLORS", "aiComponent_COLORS", "AiComponent_COLORS"}
#{cint "aiComponent_TEXCOORDS", "aiComponent_TEXCOORDS", "AiComponent_TEXCOORDS"}
#{cint "aiComponent_BONEWEIGHTS", "aiComponent_BONEWEIGHTS", "AiComponent_BONEWEIGHTS"}
#{cint "aiComponent_ANIMATIONS", "aiComponent_ANIMATIONS", "AiComponent_ANIMATIONS"}
#{cint "aiComponent_TEXTURES", "aiComponent_TEXTURES", "AiComponent_TEXTURES"}
#{cint "aiComponent_LIGHTS", "aiComponent_LIGHTS", "AiComponent_LIGHTS"}
#{cint "aiComponent_CAMERAS", "aiComponent_CAMERAS", "AiComponent_CAMERAS"}
#{cint "aiComponent_MESHES", "aiComponent_MESHES", "AiComponent_MESHES"}
#{cint "aiComponent_MATERIALS", "aiComponent_MATERIALS", "AiComponent_MATERIALS"}

foreign import capi "assimp/config.h aiComponent_COLORSn" aiComponent_COLORSn :: CUInt -> CUInt
foreign import capi "assimp/config.h aiComponent_TEXCOORDSn" aiComponent_TEXCOORDSn :: CUInt -> CUInt

#{cstring_uppercase "AI_CONFIG_PP_RVC_FLAGS"}
#{cstring_uppercase "AI_CONFIG_PP_SBP_REMOVE"}
#{cstring_uppercase "AI_CONFIG_PP_FID_ANIM_ACCURACY"}
#{cstring_uppercase "AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS"}

#{cint_uppercase "AI_UVTRAFO_SCALING"}
#{cint_uppercase "AI_UVTRAFO_ROTATION"}
#{cint_uppercase "AI_UVTRAFO_TRANSLATION"}
#{cint_uppercase "AI_UVTRAFO_ALL"}

#{cstring_uppercase "AI_CONFIG_PP_TUV_EVALUATE"}
#{cstring_uppercase "AI_CONFIG_FAVOUR_SPEED"}
#{cstring_uppercase "AI_CONFIG_IMPORT_SCHEMA_DOCUMENT_PROVIDER"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_MATERIALS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_TEXTURES"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_CAMERAS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_LIGHTS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_READ_WEIGHTS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_STRICT_MODE"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES"}
#{cstring_uppercase "AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING"}
#{cstring_uppercase "AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES"}
#{cstring_uppercase "AI_CONFIG_FBX_CONVERT_TO_M"}
#{cstring_uppercase "AI_CONFIG_FBX_USE_SKELETON_BONE_CONTAINER"}

#{cstring_uppercase "AI_CONFIG_IMPORT_GLOBAL_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD3_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD2_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDC_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_SMD_KEYFRAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_UNREAL_KEYFRAME"}

#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO"}
#{cstring_uppercase "AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST"}
#{cstring_uppercase "AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL"}
#{cstring_uppercase "AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION"}
#{cstring_uppercase "AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_TER_MAKE_UVS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD3_SKIN_NAME"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD3_LOAD_SHADERS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD3_SHADER_SRC"}
#{cstring_uppercase "AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY"}
#{cstring_uppercase "AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD"}
#{cstring_uppercase "AI_CONFIG_IMPORT_LWS_ANIM_START"}
#{cstring_uppercase "AI_CONFIG_IMPORT_LWS_ANIM_END"}
#{cstring_uppercase "AI_CONFIG_IMPORT_IRR_ANIM_FPS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE"}
#{cstring_uppercase "AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME"}
#{cstring_uppercase "AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT"}
#{cstring_uppercase "AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS"}
#{cstring_uppercase "AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION"}
#{cstring_uppercase "AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE"}
#{cfloat_uppercase "AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE"}
#{cstring_uppercase "AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION"}
#{cint_uppercase "AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION"}
#{cstring_uppercase "AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION"}
#{cstring_uppercase "AI_CONFIG_IMPORT_COLLADA_IGNORE_UNIT_SIZE"}
#{cstring_uppercase "AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES"}
#{cstring_uppercase "AI_CONFIG_EXPORT_XFILE_64BIT"}
#{cstring_uppercase "AI_CONFIG_EXPORT_POINT_CLOUDS"}
#{cstring_uppercase "AI_CONFIG_USE_GLTF_PBR_SPECULAR_GLOSSINESS"}
#{cstring_uppercase "AI_CONFIG_EXPORT_BLOB_NAME"}
#{cstring_uppercase "AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY"}
#{cfloat_uppercase "AI_CONFIG_GLOBAL_SCALE_FACTOR_DEFAULT"}
#{cstring_uppercase "AI_CONFIG_APP_SCALE_KEY"}
