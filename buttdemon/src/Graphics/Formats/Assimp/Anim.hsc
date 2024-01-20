#define THE_HEADER "assimp/anim_wrapper.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Anim (
  AiVectorKey,
  AiQuatKey,
  AiMeshKey,
  AiMeshMorphKey,
  AiAnimBehavior,
  aiAnimBehaviour_DEFAULT, pattern AiAnimBehaviour_DEFAULT,
  aiAnimBehaviour_CONSTANT, pattern AiAnimBehaviour_CONSTANT,
  aiAnimBehaviour_LINEAR, pattern AiAnimBehaviour_LINEAR,
  aiAnimBehaviour_REPEAT, pattern AiAnimBehaviour_REPEAT,
  AiNodeAnim,
  AiMeshAnim,
  AiMeshMorphAnim,
  AiAnimation
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Quaternion
import Graphics.Formats.Assimp.Types

data AiVectorKey

instance Allocable AiVectorKey where
  sizeof = #{size struct aiVectorKey}
  alignof = #{alignment struct aiVectorKey}

instance Offset "mTime" AiVectorKey CDouble where offsetof = #{offset struct aiVectorKey, mTime}
instance Offset "mValue" AiVectorKey AiVector3D where offsetof = #{offset struct aiVectorKey, mValue}

data AiQuatKey

instance Allocable AiQuatKey where
  sizeof = #{size struct aiQuatKey}
  alignof = #{alignment struct aiQuatKey}

instance Offset "mTime" AiQuatKey CDouble where offsetof = #{offset struct aiQuatKey, mTime}
instance Offset "mValue" AiQuatKey AiQuaternion where offsetof = #{offset struct aiQuatKey, mValue}

data AiMeshKey

instance Allocable AiMeshKey where
  sizeof = #{size struct aiMeshKey}
  alignof = #{alignment struct aiMeshKey}

instance Offset "mTime" AiMeshKey CDouble where offsetof = #{offset struct aiMeshKey, mTime}
instance Offset "mValue" AiMeshKey CUInt where offsetof = #{offset struct aiMeshKey, mValue}

data AiMeshMorphKey

instance Allocable AiMeshMorphKey where
  sizeof = #{size struct aiMeshMorphKey}
  alignof = #{alignment struct aiMeshMorphKey}

instance Offset "mTime" AiMeshMorphKey CDouble where offsetof = #{offset struct aiMeshMorphKey, mTime}
instance Offset "mValues" AiMeshMorphKey (Ptr CUInt) where offsetof = #{offset struct aiMeshMorphKey, mValues}
instance Offset "mWeights" AiMeshMorphKey (Ptr CDouble) where offsetof = #{offset struct aiMeshMorphKey, mWeights}
instance Offset "mNumValuesAndWeights" AiMeshMorphKey CUInt where offsetof = #{offset struct aiMeshMorphKey, mNumValuesAndWeights}

type AiAnimBehavior = #{type enum aiAnimBehaviour}

#{enumerant enum aiAnimBehaviour, "aiAnimBehaviour_DEFAULT", "aiAnimBehaviour_DEFAULT", "AiAnimBehaviour_DEFAULT"}
#{enumerant enum aiAnimBehaviour, "aiAnimBehaviour_CONSTANT", "aiAnimBehaviour_CONSTANT", "AiAnimBehaviour_CONSTANT"}
#{enumerant enum aiAnimBehaviour, "aiAnimBehaviour_LINEAR", "aiAnimBehaviour_LINEAR", "AiAnimBehaviour_LINEAR"}
#{enumerant enum aiAnimBehaviour, "aiAnimBehaviour_REPEAT", "aiAnimBehaviour_REPEAT", "AiAnimBehaviour_REPEAT"}

data AiNodeAnim

instance Allocable AiNodeAnim where
  sizeof = #{size struct aiNodeAnim}
  alignof = #{alignment struct aiNodeAnim}

instance Offset "mNodeName" AiNodeAnim AiString where offsetof = #{offset struct aiNodeAnim, mNodeName}
instance Offset "mNumPositionKeys" AiNodeAnim CUInt where offsetof = #{offset struct aiNodeAnim, mNumPositionKeys}
instance Offset "mPositionKeys" AiNodeAnim (Ptr AiVectorKey) where offsetof = #{offset struct aiNodeAnim, mPositionKeys}
instance Offset "mNumRotationKeys" AiNodeAnim CUInt where offsetof = #{offset struct aiNodeAnim, mNumRotationKeys}
instance Offset "mRotationKeys" AiNodeAnim (Ptr AiQuatKey) where offsetof = #{offset struct aiNodeAnim, mRotationKeys}
instance Offset "mNumScalingKeys" AiNodeAnim CUInt where offsetof = #{offset struct aiNodeAnim, mNumScalingKeys}
instance Offset "mScalingKeys" AiNodeAnim (Ptr AiVectorKey) where offsetof = #{offset struct aiNodeAnim, mScalingKeys}
instance Offset "mPreState" AiNodeAnim AiAnimBehavior where offsetof = #{offset struct aiNodeAnim, mPreState}
instance Offset "mPostState" AiNodeAnim AiAnimBehavior where offsetof = #{offset struct aiNodeAnim, mPostState}

data AiMeshAnim

instance Allocable AiMeshAnim where
  sizeof = #{size struct aiMeshAnim}
  alignof = #{alignment struct aiMeshAnim}

instance Offset "mName" AiMeshAnim AiString where offsetof = #{offset struct aiMeshAnim, mName}
instance Offset "mNumKeys" AiMeshAnim CUInt where offsetof = #{offset struct aiMeshAnim, mNumKeys}
instance Offset "mKeys" AiMeshAnim (Ptr AiMeshKey) where offsetof = #{offset struct aiMeshAnim, mKeys}

data AiMeshMorphAnim

instance Allocable AiMeshMorphAnim where
  sizeof = #{size struct aiMeshMorphAnim}
  alignof = #{alignment struct aiMeshMorphAnim}

instance Offset "mName" AiMeshMorphAnim AiString where offsetof = #{offset struct aiMeshMorphAnim, mName}
instance Offset "mNumKeys" AiMeshMorphAnim CUInt where offsetof = #{offset struct aiMeshMorphAnim, mNumKeys}
instance Offset "mKeys" AiMeshMorphAnim (Ptr AiMeshMorphKey) where offsetof = #{offset struct aiMeshMorphAnim, mKeys}

data AiAnimation

instance Allocable AiAnimation where
  sizeof = #{size struct aiAnimation}
  alignof = #{alignment struct aiAnimation}

instance Offset "mName" AiAnimation AiString where offsetof = #{offset struct aiAnimation, mName}
instance Offset "mDuration" AiAnimation CDouble where offsetof = #{offset struct aiAnimation, mDuration}
instance Offset "mTicksPerSecond" AiAnimation CDouble where offsetof = #{offset struct aiAnimation, mTicksPerSecond}
instance Offset "mNumChannels" AiAnimation CUInt where offsetof = #{offset struct aiAnimation, mNumChannels}
instance Offset "mChannels" AiAnimation (Ptr (Ptr AiNodeAnim)) where offsetof = #{offset struct aiAnimation, mChannels}
instance Offset "mNumMeshChannels" AiAnimation CUInt where offsetof = #{offset struct aiAnimation, mNumMeshChannels}
instance Offset "mMeshChannels" AiAnimation (Ptr (Ptr AiMeshAnim)) where offsetof = #{offset struct aiAnimation, mMeshChannels}
instance Offset "mNumMorphMeshChannels" AiAnimation CUInt where offsetof = #{offset struct aiAnimation, mNumMorphMeshChannels}
instance Offset "mMorphMeshChannels" AiAnimation (Ptr (Ptr AiMeshMorphAnim)) where offsetof = #{offset struct aiAnimation, mMorphMeshChannels}
