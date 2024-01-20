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

#{cint "AI_SCENE_FLAGS_INCOMPLETE", "aiSceneFlagsIncomplete", "AiSceneFlagsIncomplete"}
#{cint "AI_SCENE_FLAGS_VALIDATED", "aiSceneFlagsValidated", "AiSceneFlagsValidated"}
#{cint "AI_SCENE_FLAGS_VALIDATION_WARNING", "aiSceneFlagsValidationWarning", "AiSceneFlagsValidationWarning"}
#{cint "AI_SCENE_FLAGS_NON_VERBOSE_FORMAT", "aiSceneFlagsNonVerboseFormat", "AiSceneFlagsNonVerboseFormat"}
#{cint "AI_SCENE_FLAGS_TERRAIN", "aiSceneFlagsTerrain", "AiSceneFlagsTerrain"}
#{cint "AI_SCENE_FLAGS_ALLOW_SHARED", "aiSceneFlagsAllowShared", "AiSceneFlagsAllowShared"}

data AiScene

instance Allocable AiScene where
  sizeof = #{size struct aiScene}
  alignof = #{alignment struct aiScene}

instance Offset "mFlags" AiScene CUInt where offsetof = #{offset struct aiScene, mFlags}
instance Offset "mRootNode" AiScene (Ptr AiNode) where offsetof = #{offset struct aiScene, mRootNode}
instance Offset "mNumMeshes" AiScene CUInt where offsetof = #{offset struct aiScene, mNumMeshes}
instance Offset "mMeshes" AiScene (Ptr (Ptr AiMesh)) where offsetof = #{offset struct aiScene, mMeshes}
instance Offset "mNumMaterials" AiScene CUInt where offsetof = #{offset struct aiScene, mNumMaterials}
instance Offset "mMaterials" AiScene (Ptr (Ptr AiMaterial)) where offsetof = #{offset struct aiScene, mMaterials}
instance Offset "mNumAnimations" AiScene CUInt where offsetof = #{offset struct aiScene, mNumAnimations}
instance Offset "mAnimations" AiScene (Ptr (Ptr AiAnimation)) where offsetof = #{offset struct aiScene, mAnimations}
instance Offset "mNumTextures" AiScene CUInt where offsetof = #{offset struct aiScene, mNumTextures}
instance Offset "mTextures" AiScene (Ptr (Ptr AiTexture)) where offsetof = #{offset struct aiScene, mTextures}
instance Offset "mNumLights" AiScene CUInt where offsetof = #{offset struct aiScene, mNumLights}
instance Offset "mLights" AiScene (Ptr (Ptr AiLight)) where offsetof = #{offset struct aiScene, mLights}
instance Offset "mNumCameras" AiScene CUInt where offsetof = #{offset struct aiScene, mNumCameras}
instance Offset "mCameras" AiScene (Ptr (Ptr AiCamera)) where offsetof = #{offset struct aiScene, mCameras}
instance Offset "mMetaData" AiScene (Ptr AiMetadata) where offsetof = #{offset struct aiScene, mMetaData}
instance Offset "mName" AiScene AiString where offsetof = #{offset struct aiScene, mName}
instance Offset "mNumSkeletons" AiScene CUInt where offsetof = #{offset struct aiScene, mNumSkeletons}
instance Offset "mSkeletons" AiScene (Ptr (Ptr AiSkeleton)) where offsetof = #{offset struct aiScene, mSkeletons}
