{-# LANGUAGE MagicHash #-}

#define THE_HEADER "assimp/config.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Config where

import Foreign.C.String
import Foreign.C.Types

#{cstring "AI_CONFIG_GLOB_MEASURE_TIME", "aiConfigGlobMeasureTime"}
#{cstring "AI_CONFIG_IMPORT_NO_SKELETON_MESHES", "aiConfigImportNoSkeletonMeshes"}
#{cstring "AI_CONFIG_PP_SBBC_MAX_BONES", "aiConfigPpSbbcMaxBones"}
#{cint "AI_SBBC_DEFAULT_MAX_BONES", "aiSbbcDefaultMaxBones", "AiSbbcDefaultMaxBones"}
#{cstring "AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE", "aiConfigPpCtMaxSmoothingAngle"}
#{cstring "AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX", "aiConfigPpCtTextureChannelIndex"}
#{cstring "AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE", "aiConfigPpGsnMaxSmoothingAngle"}
#{cstring "AI_CONFIG_IMPORT_MDL_COLORMAP", "aiConfigImportMdlColormap"}
#{cstring "AI_CONFIG_PP_RRM_EXCLUDE_LIST", "aiConfigPpRrmExcludeList"}
#{cstring "AI_CONFIG_PP_PTV_KEEP_HIERARCHY", "aiConfigPpPtvKeepHierarchy"}
#{cstring "AI_CONFIG_PP_PTV_NORMALIZE", "aiConfigPpPtvNormalize"}
#{cstring "AI_CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION", "aiConfigPpPtvAddRootTransformation"}
#{cstring "AI_CONFIG_PP_PTV_ROOT_TRANSFORMATION", "aiConfigPpPtvRootTransformation"}
#{cstring "AI_CONFIG_PP_FD_REMOVE", "aiConfigPpFdRemove"}
#{cstring "AI_CONFIG_PP_FD_CHECKAREA", "aiConfigPpFdCheckarea"}
#{cstring "AI_CONFIG_PP_OG_EXCLUDE_LIST", "aiConfigPpOgExcludeList"}
#{cstring "AI_CONFIG_PP_SLM_TRIANGLE_LIMIT", "aiConfigPpSlmTriangleLimit"}
#{cint "AI_SLM_DEFAULT_MAX_TRIANGLES", "aiSlmDefaultMaxTriangles", "AiSlmDefaultMaxTriangles"}
#{cstring "AI_CONFIG_PP_SLM_VERTEX_LIMIT", "aiConfigPpSlmVertexLimit"}
#{cint "AI_SLM_DEFAULT_MAX_VERTICES", "aiSlmDefaultMaxVertices", "AiSlmDefaultMaxVertices"}
#{cstring "AI_CONFIG_PP_LBW_MAX_WEIGHTS", "aiConfigPpLbwMaxWeights"}
#{cint "AI_LMW_MAX_WEIGHTS", "aiLmwMaxWeights", "AiLmwMaxWeights"}
#{cstring "AI_CONFIG_PP_DB_THRESHOLD", "aiConfigPpDbThreshold"}
#{cfloat "AI_DEBONE_THRESHOLD", "aiDeboneThreshold"}
#{cstring "AI_CONFIG_PP_DB_ALL_OR_NONE", "aiConfigPpDbAllOrNone"}
#{cint "PP_ICL_PTCACHE_SIZE", "ppIclPtcacheSize", "PpIclPtcacheSize"}
#{cstring "AI_CONFIG_PP_ICL_PTCACHE_SIZE", "aiConfigPpIclPtcacheSize"}


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

#{importfunction "aiComponent_COLORSn", "aiComponent_COLORSn", "CUInt -> CUInt"}
#{importfunction "aiComponent_TEXCOORDSn", "aiComponent_TEXCOORDSn", "CUInt -> CUInt"}

#{cstring "AI_CONFIG_PP_RVC_FLAGS", "aiConfigPpRvcFlags"}
#{cstring "AI_CONFIG_PP_SBP_REMOVE", "aiConfigPpSbpRemove"}
#{cstring "AI_CONFIG_PP_FID_ANIM_ACCURACY", "aiConfigPpFidAnimAccuracy"}
#{cstring "AI_CONFIG_PP_FID_IGNORE_TEXTURECOORDS", "aiConfigPpFidIgnoreTexturecoords"}

#{cint "AI_UVTRAFO_SCALING", "aiUvtrafoScaling", "AiUvtrafoScaling"}
#{cint "AI_UVTRAFO_ROTATION", "aiUvtrafoRotation", "AiUvtrafoRotation"}
#{cint "AI_UVTRAFO_TRANSLATION", "aiUvtrafoTranslation", "AiUvtrafoTranslation"}
#{cint "AI_UVTRAFO_ALL", "aiUvtrafoAll", "AiUvtrafoAll"}

#{cstring "AI_CONFIG_PP_TUV_EVALUATE", "aiConfigPpTuvEvaluate"}
#{cstring "AI_CONFIG_FAVOUR_SPEED", "aiConfigFavourSpeed"}
#{cstring "AI_CONFIG_IMPORT_SCHEMA_DOCUMENT_PROVIDER", "aiConfigImportSchemaDocumentProvider"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS", "aiConfigImportFbxReadAllGeometryLayers"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_ALL_MATERIALS", "aiConfigImportFbxReadAllMaterials"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_MATERIALS", "aiConfigImportFbxReadMaterials"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_TEXTURES", "aiConfigImportFbxReadTextures"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_CAMERAS", "aiConfigImportFbxReadCameras"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_LIGHTS", "aiConfigImportFbxReadLights"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_ANIMATIONS", "aiConfigImportFbxReadAnimations"}
#{cstring "AI_CONFIG_IMPORT_FBX_READ_WEIGHTS", "aiConfigImportFbxReadWeights"}
#{cstring "AI_CONFIG_IMPORT_FBX_STRICT_MODE", "aiConfigImportFbxStrictMode"}
#{cstring "AI_CONFIG_IMPORT_FBX_PRESERVE_PIVOTS", "aiConfigImportFbxPreservePivots"}
#{cstring "AI_CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES", "aiConfigImportFbxOptimizeEmptyAnimationCurves"}
#{cstring "AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING", "aiConfigImportFbxEmbeddedTexturesLegacyNaming"}
#{cstring "AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES", "aiConfigImportRemoveEmptyBones"}
#{cstring "AI_CONFIG_FBX_CONVERT_TO_M", "aiConfigFbxConvertToM"}
#{cstring "AI_CONFIG_FBX_USE_SKELETON_BONE_CONTAINER", "aiConfigFbxUseSkeletonBoneContainer"}

#{cstring "AI_CONFIG_IMPORT_GLOBAL_KEYFRAME", "aiConfigImportGlobalKeyframe"}
#{cstring "AI_CONFIG_IMPORT_MD3_KEYFRAME", "aiConfigImportMd3Keyframe"}
#{cstring "AI_CONFIG_IMPORT_MD2_KEYFRAME", "aiConfigImportMd2Keyframe"}
#{cstring "AI_CONFIG_IMPORT_MDL_KEYFRAME", "aiConfigImportMdlKeyframe"}
#{cstring "AI_CONFIG_IMPORT_MDC_KEYFRAME", "aiConfigImportMdcKeyframe"}
#{cstring "AI_CONFIG_IMPORT_SMD_KEYFRAME", "aiConfigImportSmdKeyframe"}
#{cstring "AI_CONFIG_IMPORT_UNREAL_KEYFRAME", "aiConfigImportUnrealKeyframe"}

#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATIONS", "aiConfigImportMdlHl1ReadAnimations"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_ANIMATION_EVENTS", "aiConfigImportMdlHl1ReadAnimationEvents"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_BLEND_CONTROLLERS", "aiConfigImportMdlHl1ReadBlendControllers"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_SEQUENCE_TRANSITIONS", "aiConfigImportMdlHl1ReadSequenceTransitions"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_ATTACHMENTS", "aiConfigImportMdlHl1ReadAttachments"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_BONE_CONTROLLERS", "aiConfigImportMdlHl1ReadBoneControllers"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_HITBOXES", "aiConfigImportMdlHl1ReadHitboxes"}
#{cstring "AI_CONFIG_IMPORT_MDL_HL1_READ_MISC_GLOBAL_INFO", "aiConfigImportMdlHl1ReadMiscGlobalInfo"}
#{cstring "AI_CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST", "aiConfigImportSmdLoadAnimationList"}
#{cstring "AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL", "aiConfigImportAcSeparateBfcull"}
#{cstring "AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION", "aiConfigImportAcEvalSubdivision"}
#{cstring "AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS", "aiConfigImportUnrealHandleFlags"}
#{cstring "AI_CONFIG_IMPORT_TER_MAKE_UVS", "aiConfigImportTerMakeUvs"}
#{cstring "AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS", "aiConfigImportAseReconstructNormals"}
#{cstring "AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART", "aiConfigImportMd3HandleMultipart"}
#{cstring "AI_CONFIG_IMPORT_MD3_SKIN_NAME", "aiConfigImportMd3SkinName"}
#{cstring "AI_CONFIG_IMPORT_MD3_LOAD_SHADERS", "aiConfigImportMd3LoadShaders"}
#{cstring "AI_CONFIG_IMPORT_MD3_SHADER_SRC", "aiConfigImportMd3ShaderSrc"}
#{cstring "AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY", "aiConfigImportLwoOneLayerOnly"}
#{cstring "AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD", "aiConfigImportMd5NoAnimAutoload"}
#{cstring "AI_CONFIG_IMPORT_LWS_ANIM_START", "aiConfigImportLwsAnimStart"}
#{cstring "AI_CONFIG_IMPORT_LWS_ANIM_END", "aiConfigImportLwsAnimEnd"}
#{cstring "AI_CONFIG_IMPORT_IRR_ANIM_FPS", "aiConfigImportIrrAnimFps"}
#{cstring "AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE", "aiConfigImportOgreMaterialFile"}
#{cstring "AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME", "aiConfigImportOgreTexturetypeFromFilename"}
#{cstring "AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT", "aiConfigAndroidJniAssimpManagerSupport"}
#{cstring "AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS", "aiConfigImportIfcSkipSpaceRepresentations"}
#{cstring "AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION", "aiConfigImportIfcCustomTriangulation"}
#{cstring "AI_CONFIG_IMPORT_IFC_SMOOTHING_ANGLE", "aiConfigImportIfcSmoothingAngle"}
#{cfloat "AI_IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE", "aiImportIfcDefaultSmoothingAngle"}
#{cstring "AI_CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION", "aiConfigImportIfcCylindricalTessellation"}
#{cint "AI_IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION", "aiImportIfcDefaultCylindricalTessellation", "AiImportIfcDefaultCylindricalTessellation"}
#{cstring "AI_CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION", "aiConfigImportColladaIgnoreUpDirection"}
#{cstring "AI_CONFIG_IMPORT_COLLADA_IGNORE_UNIT_SIZE", "aiConfigImportColladaIgnoreUnitSize"}
#{cstring "AI_CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES", "aiConfigImportColladaUseColladaNames"}
#{cstring "AI_CONFIG_EXPORT_XFILE_64BIT", "aiConfigExportXfile64bit"}
#{cstring "AI_CONFIG_EXPORT_POINT_CLOUDS", "aiConfigExportPointClouds"}
#{cstring "AI_CONFIG_USE_GLTF_PBR_SPECULAR_GLOSSINESS", "aiConfigUseGltfPbrSpecularGlossiness"}
#{cstring "AI_CONFIG_EXPORT_BLOB_NAME", "aiConfigExportBlobName"}
#{cstring "AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY", "aiConfigGlobalScaleFactorKey"}
#{cfloat "AI_CONFIG_GLOBAL_SCALE_FACTOR_DEFAULT", "aiConfigGlobalScaleFactorDefault"}
#{cstring "AI_CONFIG_APP_SCALE_KEY", "aiConfigAppScaleKey"}
