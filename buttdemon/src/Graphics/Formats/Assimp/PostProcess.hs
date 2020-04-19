{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.PostProcess where

import Data.Bits
import Foreign.C.Types
import GHC.Generics
import Numeric.PrimBytes
  
newtype AiPostProcessSteps = AiPostProcessSteps CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiPostProcessSteps

pattern AiProcess_CalcTangentSpace :: AiPostProcessSteps
pattern AiProcess_CalcTangentSpace = AiPostProcessSteps 0x1
pattern AiProcess_JoinIdenticalVertices :: AiPostProcessSteps
pattern AiProcess_JoinIdenticalVertices = AiPostProcessSteps 0x2
pattern AiProcess_MakeLeftHanded :: AiPostProcessSteps
pattern AiProcess_MakeLeftHanded = AiPostProcessSteps 0x4
pattern AiProcess_Triangulate :: AiPostProcessSteps
pattern AiProcess_Triangulate = AiPostProcessSteps 0x8
pattern AiProcess_RemoveComponent :: AiPostProcessSteps
pattern AiProcess_RemoveComponent = AiPostProcessSteps 0x10
pattern AiProcess_GenNormals :: AiPostProcessSteps
pattern AiProcess_GenNormals = AiPostProcessSteps 0x20
pattern AiProcess_GenSmoothNormals :: AiPostProcessSteps
pattern AiProcess_GenSmoothNormals = AiPostProcessSteps 0x40
pattern AiProcess_SplitLargeMeshes :: AiPostProcessSteps
pattern AiProcess_SplitLargeMeshes = AiPostProcessSteps 0x80
pattern AiProcess_PreTransformVertices :: AiPostProcessSteps
pattern AiProcess_PreTransformVertices = AiPostProcessSteps 0x100
pattern AiProcess_LimitBoneWeights :: AiPostProcessSteps
pattern AiProcess_LimitBoneWeights = AiPostProcessSteps 0x200
pattern AiProcess_ValidateDataStructure :: AiPostProcessSteps
pattern AiProcess_ValidateDataStructure = AiPostProcessSteps 0x400
pattern AiProcess_ImproveCacheLocality :: AiPostProcessSteps
pattern AiProcess_ImproveCacheLocality = AiPostProcessSteps 0x800
pattern AiProcess_RemoveRedundantMaterials :: AiPostProcessSteps
pattern AiProcess_RemoveRedundantMaterials = AiPostProcessSteps 0x1000
pattern AiProcess_FixInfacingNormals :: AiPostProcessSteps
pattern AiProcess_FixInfacingNormals = AiPostProcessSteps 0x2000
pattern AiProcess_SortByPType :: AiPostProcessSteps
pattern AiProcess_SortByPType = AiPostProcessSteps 0x8000
pattern AiProcess_FindDegenerates :: AiPostProcessSteps
pattern AiProcess_FindDegenerates = AiPostProcessSteps 0x10000
pattern AiProcess_FindInvalidData :: AiPostProcessSteps
pattern AiProcess_FindInvalidData = AiPostProcessSteps 0x20000
pattern AiProcess_GenUVCoords :: AiPostProcessSteps
pattern AiProcess_GenUVCoords = AiPostProcessSteps 0x40000
pattern AiProcess_TransformUVCoords :: AiPostProcessSteps
pattern AiProcess_TransformUVCoords = AiPostProcessSteps 0x80000
pattern AiProcess_FindInstances :: AiPostProcessSteps
pattern AiProcess_FindInstances = AiPostProcessSteps 0x100000
pattern AiProcess_OptimizeMeshes :: AiPostProcessSteps
pattern AiProcess_OptimizeMeshes = AiPostProcessSteps 0x200000
pattern AiProcess_OptimizeGraph :: AiPostProcessSteps
pattern AiProcess_OptimizeGraph = AiPostProcessSteps 0x400000
pattern AiProcess_FlipUVs :: AiPostProcessSteps
pattern AiProcess_FlipUVs = AiPostProcessSteps 0x800000
pattern AiProcess_FlipWindingOrder :: AiPostProcessSteps
pattern AiProcess_FlipWindingOrder = AiPostProcessSteps 0x1000000
pattern AiProcess_SplitByBoneCount :: AiPostProcessSteps
pattern AiProcess_SplitByBoneCount = AiPostProcessSteps 0x2000000
pattern AiProcess_Debone :: AiPostProcessSteps
pattern AiProcess_Debone = AiPostProcessSteps 0x4000000
pattern AiProcess_GlobalScale :: AiPostProcessSteps
pattern AiProcess_GlobalScale = AiPostProcessSteps 0x8000000
pattern AiProcess_EmbedTextures :: AiPostProcessSteps
pattern AiProcess_EmbedTextures = AiPostProcessSteps 0x10000000
pattern AiProcess_ForceGenNormals :: AiPostProcessSteps
pattern AiProcess_ForceGenNormals = AiPostProcessSteps 0x20000000
pattern AiProcess_DropNormals :: AiPostProcessSteps
pattern AiProcess_DropNormals = AiPostProcessSteps 0x40000000
pattern AiProcess_GenBoundingBoxes :: AiPostProcessSteps
pattern AiProcess_GenBoundingBoxes = AiPostProcessSteps 0x80000000

aiProcess_ConvertToLeftHanded :: AiPostProcessSteps
aiProcess_ConvertToLeftHanded =
  AiProcess_MakeLeftHanded .|.
  AiProcess_FlipUVs .|.
  AiProcess_FlipWindingOrder

aiProcessPreset_TargetRealtime_Fast :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_Fast =
  AiProcess_CalcTangentSpace .|.
  AiProcess_GenNormals .|.
  AiProcess_JoinIdenticalVertices .|.
  AiProcess_Triangulate .|.
  AiProcess_GenUVCoords .|.
  AiProcess_SortByPType

aiProcessPreset_TargetRealtime_Quality :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_Quality =
  AiProcess_CalcTangentSpace .|.
  AiProcess_GenSmoothNormals .|.
  AiProcess_JoinIdenticalVertices .|.
  AiProcess_ImproveCacheLocality .|.
  AiProcess_LimitBoneWeights .|.
  AiProcess_RemoveRedundantMaterials .|.
  AiProcess_SplitLargeMeshes .|.
  AiProcess_Triangulate .|.
  AiProcess_GenUVCoords .|.
  AiProcess_SortByPType .|.
  AiProcess_FindDegenerates .|.
  AiProcess_FindInvalidData

aiProcessPreset_TargetRealtime_MaxQuality :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_MaxQuality =
  aiProcessPreset_TargetRealtime_Quality .|.
  AiProcess_FindInstances .|.
  AiProcess_ValidateDataStructure .|.
  AiProcess_OptimizeMeshes
