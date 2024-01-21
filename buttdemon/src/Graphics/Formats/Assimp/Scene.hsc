#define THE_HEADER "assimp/scene.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Scene (
  aiSceneFlagsIncomplete, pattern AiSceneFlagsIncomplete,
  aiSceneFlagsValidated, pattern AiSceneFlagsValidated,
  aiSceneFlagsValidationWarning, pattern AiSceneFlagsValidationWarning,
  aiSceneFlagsNonVerboseFormat, pattern AiSceneFlagsNonVerboseFormat,
  aiSceneFlagsTerrain, pattern AiSceneFlagsTerrain,
  aiSceneFlagsAllowShared, pattern AiSceneFlagsAllowShared,
  AiScene,
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types
import Graphics.Formats.Assimp.Texture
import Graphics.Formats.Assimp.Mesh
import Graphics.Formats.Assimp.Light
import Graphics.Formats.Assimp.Camera
import Graphics.Formats.Assimp.Material
import Graphics.Formats.Assimp.Anim
import Graphics.Formats.Assimp.Metadata
import Graphics.Formats.Assimp.Node

#{cint AI_SCENE_FLAGS_INCOMPLETE, aiSceneFlagsIncomplete, AiSceneFlagsIncomplete}
#{cint AI_SCENE_FLAGS_VALIDATED, aiSceneFlagsValidated, AiSceneFlagsValidated}
#{cint AI_SCENE_FLAGS_VALIDATION_WARNING, aiSceneFlagsValidationWarning, AiSceneFlagsValidationWarning}
#{cint AI_SCENE_FLAGS_NON_VERBOSE_FORMAT, aiSceneFlagsNonVerboseFormat, AiSceneFlagsNonVerboseFormat}
#{cint AI_SCENE_FLAGS_TERRAIN, aiSceneFlagsTerrain, AiSceneFlagsTerrain}
#{cint AI_SCENE_FLAGS_ALLOW_SHARED, aiSceneFlagsAllowShared, AiSceneFlagsAllowShared}

#{cstruct C_STRUCT aiScene, AiScene}
#{cstructfield C_STRUCT aiScene, AiScene, mFlags, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mRootNode, Ptr AiNode}
#{cstructfield C_STRUCT aiScene, AiScene, mNumMeshes, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mMeshes, Ptr (Ptr AiMesh)}
#{cstructfield C_STRUCT aiScene, AiScene, mNumMaterials, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mMaterials, Ptr (Ptr AiMaterial)}
#{cstructfield C_STRUCT aiScene, AiScene, mNumAnimations, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mAnimations, Ptr (Ptr AiAnimation)}
#{cstructfield C_STRUCT aiScene, AiScene, mNumTextures, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mTextures, Ptr (Ptr AiTexture)}
#{cstructfield C_STRUCT aiScene, AiScene, mNumLights, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mLights, Ptr (Ptr AiLight)}
#{cstructfield C_STRUCT aiScene, AiScene, mNumCameras, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mCameras, Ptr (Ptr AiCamera)}
#{cstructfield C_STRUCT aiScene, AiScene, mMetaData, Ptr AiMetadata}
#{cstructfield C_STRUCT aiScene, AiScene, mName, AiString}
#{cstructfield C_STRUCT aiScene, AiScene, mNumSkeletons, CUInt}
#{cstructfield C_STRUCT aiScene, AiScene, mSkeletons, Ptr (Ptr AiSkeleton)}
