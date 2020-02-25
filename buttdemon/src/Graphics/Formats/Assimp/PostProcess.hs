{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Graphics.Formats.Assimp.PostProcess where

import Data.Bits
import Foreign.C.Types
import GHC.Generics
import Numeric.PrimBytes
  
newtype AiPostProcessSteps = AiPostProcessSteps CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiPostProcessSteps

aiProcess_CalcTangentSpace :: AiPostProcessSteps
aiProcess_CalcTangentSpace = AiPostProcessSteps 0x1

aiProcess_JoinIdenticalVertices :: AiPostProcessSteps
aiProcess_JoinIdenticalVertices = AiPostProcessSteps 0x2

aiProcess_MakeLeftHanded :: AiPostProcessSteps
aiProcess_MakeLeftHanded = AiPostProcessSteps 0x4

aiProcess_Triangulate :: AiPostProcessSteps
aiProcess_Triangulate = AiPostProcessSteps 0x8

aiProcess_RemoveComponent :: AiPostProcessSteps
aiProcess_RemoveComponent = AiPostProcessSteps 0x10

aiProcess_GenNormals :: AiPostProcessSteps
aiProcess_GenNormals = AiPostProcessSteps 0x20

aiProcess_GenSmoothNormals :: AiPostProcessSteps
aiProcess_GenSmoothNormals = AiPostProcessSteps 0x40

aiProcess_SplitLargeMeshes :: AiPostProcessSteps
aiProcess_SplitLargeMeshes = AiPostProcessSteps 0x80

aiProcess_PreTransformVertices :: AiPostProcessSteps
aiProcess_PreTransformVertices = AiPostProcessSteps 0x100

aiProcess_LimitBoneWeights :: AiPostProcessSteps
aiProcess_LimitBoneWeights = AiPostProcessSteps 0x200

aiProcess_ValidateDataStructure :: AiPostProcessSteps
aiProcess_ValidateDataStructure = AiPostProcessSteps 0x400

aiProcess_ImproveCacheLocality :: AiPostProcessSteps
aiProcess_ImproveCacheLocality = AiPostProcessSteps 0x800

aiProcess_RemoveRedundantMaterials :: AiPostProcessSteps
aiProcess_RemoveRedundantMaterials = AiPostProcessSteps 0x1000

aiProcess_FixInfacingNormals :: AiPostProcessSteps
aiProcess_FixInfacingNormals = AiPostProcessSteps 0x2000

aiProcess_SortByPType :: AiPostProcessSteps
aiProcess_SortByPType = AiPostProcessSteps 0x8000

aiProcess_FindDegenerates :: AiPostProcessSteps
aiProcess_FindDegenerates = AiPostProcessSteps 0x10000

aiProcess_FindInvalidData :: AiPostProcessSteps
aiProcess_FindInvalidData = AiPostProcessSteps 0x20000

aiProcess_GenUVCoords :: AiPostProcessSteps
aiProcess_GenUVCoords = AiPostProcessSteps 0x40000

aiProcess_TransformUVCoords :: AiPostProcessSteps
aiProcess_TransformUVCoords = AiPostProcessSteps 0x80000

aiProcess_FindInstances :: AiPostProcessSteps
aiProcess_FindInstances = AiPostProcessSteps 0x100000

aiProcess_OptimizeMeshes :: AiPostProcessSteps
aiProcess_OptimizeMeshes = AiPostProcessSteps 0x200000

aiProcess_OptimizeGraph :: AiPostProcessSteps
aiProcess_OptimizeGraph = AiPostProcessSteps 0x400000

aiProcess_FlipUVs :: AiPostProcessSteps
aiProcess_FlipUVs = AiPostProcessSteps 0x800000

aiProcess_FlipWindingOrder :: AiPostProcessSteps
aiProcess_FlipWindingOrder = AiPostProcessSteps 0x1000000

aiProcess_SplitByBoneCount :: AiPostProcessSteps
aiProcess_SplitByBoneCount = AiPostProcessSteps 0x2000000

aiProcess_Debone :: AiPostProcessSteps
aiProcess_Debone = AiPostProcessSteps 0x4000000

aiProcess_GlobalScale :: AiPostProcessSteps
aiProcess_GlobalScale = AiPostProcessSteps 0x8000000

aiProcess_EmbedTextures :: AiPostProcessSteps
aiProcess_EmbedTextures = AiPostProcessSteps 0x10000000

aiProcess_ForceGenNormals :: AiPostProcessSteps
aiProcess_ForceGenNormals = AiPostProcessSteps 0x20000000

aiProcess_DropNormals :: AiPostProcessSteps
aiProcess_DropNormals = AiPostProcessSteps 0x40000000

aiProcess_GenBoundingBoxes :: AiPostProcessSteps
aiProcess_GenBoundingBoxes = AiPostProcessSteps 0x80000000

aiProcess_ConvertToLeftHanded :: AiPostProcessSteps
aiProcess_ConvertToLeftHanded =
  aiProcess_MakeLeftHanded .|.
  aiProcess_FlipUVs .|.
  aiProcess_FlipWindingOrder

aiProcessPreset_TargetRealtime_Fast :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_Fast =
  aiProcess_CalcTangentSpace .|.
  aiProcess_GenNormals .|.
  aiProcess_JoinIdenticalVertices .|.
  aiProcess_Triangulate .|.
  aiProcess_GenUVCoords .|.
  aiProcess_SortByPType

aiProcessPreset_TargetRealtime_Quality :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_Quality =
  aiProcess_CalcTangentSpace .|.
  aiProcess_GenSmoothNormals .|.
  aiProcess_JoinIdenticalVertices .|.
  aiProcess_ImproveCacheLocality .|.
  aiProcess_LimitBoneWeights .|.
  aiProcess_RemoveRedundantMaterials .|.
  aiProcess_SplitLargeMeshes .|.
  aiProcess_Triangulate .|.
  aiProcess_GenUVCoords .|.
  aiProcess_SortByPType .|.
  aiProcess_FindDegenerates .|.
  aiProcess_FindInvalidData

aiProcessPreset_TargetRealtime_MaxQuality :: AiPostProcessSteps
aiProcessPreset_TargetRealtime_MaxQuality =
  aiProcessPreset_TargetRealtime_Quality .|.
  aiProcess_FindInstances .|.
  aiProcess_ValidateDataStructure .|.
  aiProcess_OptimizeMeshes
