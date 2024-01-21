#define THE_HEADER "assimp/postprocess.h"
#include THE_HEADER

module Graphics.Formats.Assimp.PostProcess (
  AiPostProcessSteps(..),
  aiProcess_CalcTangentSpace, pattern AiProcess_CalcTangentSpace,
  aiProcess_JoinIdenticalVertices, pattern AiProcess_JoinIdenticalVertices,
  aiProcess_MakeLeftHanded, pattern AiProcess_MakeLeftHanded,
  aiProcess_Triangulate, pattern AiProcess_Triangulate,
  aiProcess_RemoveComponent, pattern AiProcess_RemoveComponent,
  aiProcess_GenNormals, pattern AiProcess_GenNormals,
  aiProcess_GenSmoothNormals, pattern AiProcess_GenSmoothNormals,
  aiProcess_SplitLargeMeshes, pattern AiProcess_SplitLargeMeshes,
  aiProcess_PreTransformVertices, pattern AiProcess_PreTransformVertices,
  aiProcess_LimitBoneWeights, pattern AiProcess_LimitBoneWeights,
  aiProcess_ValidateDataStructure, pattern AiProcess_ValidateDataStructure,
  aiProcess_ImproveCacheLocality, pattern AiProcess_ImproveCacheLocality,
  aiProcess_RemoveRedundantMaterials, pattern AiProcess_RemoveRedundantMaterials,
  aiProcess_FixInfacingNormals, pattern AiProcess_FixInfacingNormals,
  aiProcess_PopulateArmatureData, pattern AiProcess_PopulateArmatureData,
  aiProcess_SortByPType, pattern AiProcess_SortByPType,
  aiProcess_FindDegenerates, pattern AiProcess_FindDegenerates,
  aiProcess_FindInvalidData, pattern AiProcess_FindInvalidData,
  aiProcess_GenUVCoords, pattern AiProcess_GenUVCoords,
  aiProcess_TransformUVCoords, pattern AiProcess_TransformUVCoords,
  aiProcess_FindInstances, pattern AiProcess_FindInstances,
  aiProcess_OptimizeMeshes, pattern AiProcess_OptimizeMeshes,
  aiProcess_OptimizeGraph, pattern AiProcess_OptimizeGraph,
  aiProcess_FlipUVs, pattern AiProcess_FlipUVs,
  aiProcess_FlipWindingOrder, pattern AiProcess_FlipWindingOrder,
  aiProcess_SplitByBoneCount, pattern AiProcess_SplitByBoneCount,
  aiProcess_Debone, pattern AiProcess_Debone,
  aiProcess_GlobalScale, pattern AiProcess_GlobalScale,
  aiProcess_EmbedTextures, pattern AiProcess_EmbedTextures,
  aiProcess_ForceGenNormals, pattern AiProcess_ForceGenNormals,
  aiProcess_DropNormals, pattern AiProcess_DropNormals,
  aiProcess_GenBoundingBoxes, pattern AiProcess_GenBoundingBoxes,
  aiProcess_ConvertToLeftHanded, pattern AiProcess_ConvertToLeftHanded,
  aiProcessPreset_TargetRealtime_Fast, pattern AiProcessPreset_TargetRealtime_Fast,
  aiProcessPreset_TargetRealtime_Quality, pattern AiProcessPreset_TargetRealtime_Quality,
  aiProcessPreset_TargetRealtime_MaxQuality, pattern AiProcessPreset_TargetRealtime_MaxQuality,
) where

import Data.IntWord

#{cenum enum aiPostProcessSteps, AiPostProcessSteps}
#{cenumerant_ AiPostProcessSteps, aiProcess_CalcTangentSpace, AiProcess_CalcTangentSpace}
#{cenumerant_ AiPostProcessSteps, aiProcess_JoinIdenticalVertices, AiProcess_JoinIdenticalVertices}
#{cenumerant_ AiPostProcessSteps, aiProcess_MakeLeftHanded, AiProcess_MakeLeftHanded}
#{cenumerant_ AiPostProcessSteps, aiProcess_Triangulate, AiProcess_Triangulate}
#{cenumerant_ AiPostProcessSteps, aiProcess_RemoveComponent, AiProcess_RemoveComponent}
#{cenumerant_ AiPostProcessSteps, aiProcess_GenNormals, AiProcess_GenNormals}
#{cenumerant_ AiPostProcessSteps, aiProcess_GenSmoothNormals, AiProcess_GenSmoothNormals}
#{cenumerant_ AiPostProcessSteps, aiProcess_SplitLargeMeshes, AiProcess_SplitLargeMeshes}
#{cenumerant_ AiPostProcessSteps, aiProcess_PreTransformVertices, AiProcess_PreTransformVertices}
#{cenumerant_ AiPostProcessSteps, aiProcess_LimitBoneWeights, AiProcess_LimitBoneWeights}
#{cenumerant_ AiPostProcessSteps, aiProcess_ValidateDataStructure, AiProcess_ValidateDataStructure}
#{cenumerant_ AiPostProcessSteps, aiProcess_ImproveCacheLocality, AiProcess_ImproveCacheLocality}
#{cenumerant_ AiPostProcessSteps, aiProcess_RemoveRedundantMaterials, AiProcess_RemoveRedundantMaterials}
#{cenumerant_ AiPostProcessSteps, aiProcess_FixInfacingNormals, AiProcess_FixInfacingNormals}
#{cenumerant_ AiPostProcessSteps, aiProcess_PopulateArmatureData, AiProcess_PopulateArmatureData}
#{cenumerant_ AiPostProcessSteps, aiProcess_SortByPType, AiProcess_SortByPType}
#{cenumerant_ AiPostProcessSteps, aiProcess_FindDegenerates, AiProcess_FindDegenerates}
#{cenumerant_ AiPostProcessSteps, aiProcess_FindInvalidData, AiProcess_FindInvalidData}
#{cenumerant_ AiPostProcessSteps, aiProcess_GenUVCoords, AiProcess_GenUVCoords}
#{cenumerant_ AiPostProcessSteps, aiProcess_TransformUVCoords, AiProcess_TransformUVCoords}
#{cenumerant_ AiPostProcessSteps, aiProcess_FindInstances, AiProcess_FindInstances}
#{cenumerant_ AiPostProcessSteps, aiProcess_OptimizeMeshes, AiProcess_OptimizeMeshes}
#{cenumerant_ AiPostProcessSteps, aiProcess_OptimizeGraph, AiProcess_OptimizeGraph}
#{cenumerant_ AiPostProcessSteps, aiProcess_FlipUVs, AiProcess_FlipUVs}
#{cenumerant_ AiPostProcessSteps, aiProcess_FlipWindingOrder, AiProcess_FlipWindingOrder}
#{cenumerant_ AiPostProcessSteps, aiProcess_SplitByBoneCount, AiProcess_SplitByBoneCount}
#{cenumerant_ AiPostProcessSteps, aiProcess_Debone, AiProcess_Debone}
#{cenumerant_ AiPostProcessSteps, aiProcess_GlobalScale, AiProcess_GlobalScale}
#{cenumerant_ AiPostProcessSteps, aiProcess_EmbedTextures, AiProcess_EmbedTextures}
#{cenumerant_ AiPostProcessSteps, aiProcess_ForceGenNormals, AiProcess_ForceGenNormals}
#{cenumerant_ AiPostProcessSteps, aiProcess_DropNormals, AiProcess_DropNormals}
#{cenumerant_ AiPostProcessSteps, aiProcess_GenBoundingBoxes, AiProcess_GenBoundingBoxes}

#{cenumerant_ AiPostProcessSteps, aiProcess_ConvertToLeftHanded, AiProcess_ConvertToLeftHanded}
#{cenumerant_ AiPostProcessSteps, aiProcessPreset_TargetRealtime_Fast, AiProcessPreset_TargetRealtime_Fast}
#{cenumerant_ AiPostProcessSteps, aiProcessPreset_TargetRealtime_Quality, AiProcessPreset_TargetRealtime_Quality}
#{cenumerant_ AiPostProcessSteps, aiProcessPreset_TargetRealtime_MaxQuality, AiProcessPreset_TargetRealtime_MaxQuality}
