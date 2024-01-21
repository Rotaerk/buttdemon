#define THE_HEADER "assimp/anim_wrapper.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Anim (
  AiVectorKey,
  AiQuatKey,
  AiMeshKey,
  AiMeshMorphKey,
  AiAnimBehaviour(..),
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

#{cstruct struct aiVectorKey, AiVectorKey}
#{cstructfield struct aiVectorKey, AiVectorKey, mTime, CDouble}
#{cstructfield struct aiVectorKey, AiVectorKey, mValue, AiVector3D}

#{cstruct struct aiQuatKey, AiQuatKey}
#{cstructfield struct aiQuatKey, AiQuatKey, mTime, CDouble}
#{cstructfield struct aiQuatKey, AiQuatKey, mValue, AiQuaternion}

#{cstruct struct aiMeshKey, AiMeshKey}
#{cstructfield struct aiMeshKey, AiMeshKey, mTime, CDouble}
#{cstructfield struct aiMeshKey, AiMeshKey, mValue, CUInt}

#{cstruct struct aiMeshMorphKey, AiMeshMorphKey}
#{cstructfield struct aiMeshMorphKey, AiMeshMorphKey, mTime, CDouble}
#{cstructfield struct aiMeshMorphKey, AiMeshMorphKey, mValues, Ptr CUInt}
#{cstructfield struct aiMeshMorphKey, AiMeshMorphKey, mWeights, Ptr CDouble}
#{cstructfield struct aiMeshMorphKey, AiMeshMorphKey, mNumValuesAndWeights, CUInt}

#{cenum enum aiAnimBehaviour, AiAnimBehaviour}
#{cenumerant_ AiAnimBehaviour, aiAnimBehaviour_DEFAULT, AiAnimBehaviour_DEFAULT}
#{cenumerant_ AiAnimBehaviour, aiAnimBehaviour_CONSTANT, AiAnimBehaviour_CONSTANT}
#{cenumerant_ AiAnimBehaviour, aiAnimBehaviour_LINEAR, AiAnimBehaviour_LINEAR}
#{cenumerant_ AiAnimBehaviour, aiAnimBehaviour_REPEAT, AiAnimBehaviour_REPEAT}

#{cstruct struct aiNodeAnim, AiNodeAnim}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mNodeName, AiString}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mNumPositionKeys, CUInt}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mPositionKeys, Ptr AiVectorKey}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mNumRotationKeys, CUInt}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mRotationKeys, Ptr AiQuatKey}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mNumScalingKeys, CUInt}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mScalingKeys, Ptr AiVectorKey}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mPreState, AiAnimBehaviour}
#{cstructfield struct aiNodeAnim, AiNodeAnim, mPostState, AiAnimBehaviour}

#{cstruct struct aiMeshAnim, AiMeshAnim}
#{cstructfield struct aiMeshAnim, AiMeshAnim, mName, AiString}
#{cstructfield struct aiMeshAnim, AiMeshAnim, mNumKeys, CUInt}
#{cstructfield struct aiMeshAnim, AiMeshAnim, mKeys, Ptr AiMeshKey}

#{cstruct struct aiMeshMorphAnim, AiMeshMorphAnim}
#{cstructfield struct aiMeshMorphAnim, AiMeshMorphAnim, mName, AiString}
#{cstructfield struct aiMeshMorphAnim, AiMeshMorphAnim, mNumKeys, CUInt}
#{cstructfield struct aiMeshMorphAnim, AiMeshMorphAnim, mKeys, Ptr AiMeshMorphKey}

#{cstruct struct aiAnimation, AiAnimation}
#{cstructfield struct aiAnimation, AiAnimation, mName, AiString}
#{cstructfield struct aiAnimation, AiAnimation, mDuration, CDouble}
#{cstructfield struct aiAnimation, AiAnimation, mTicksPerSecond, CDouble}
#{cstructfield struct aiAnimation, AiAnimation, mNumChannels, CUInt}
#{cstructfield struct aiAnimation, AiAnimation, mChannels, Ptr (Ptr AiNodeAnim)}
#{cstructfield struct aiAnimation, AiAnimation, mNumMeshChannels, CUInt}
#{cstructfield struct aiAnimation, AiAnimation, mMeshChannels, Ptr (Ptr AiMeshAnim)}
#{cstructfield struct aiAnimation, AiAnimation, mNumMorphMeshChannels, CUInt}
#{cstructfield struct aiAnimation, AiAnimation, mMorphMeshChannels, Ptr (Ptr AiMeshMorphAnim)}
