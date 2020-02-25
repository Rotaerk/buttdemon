{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Animation where
  
import Graphics.Formats.Assimp.Types

import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

data AiSimpleKey v = AiSimpleKey { aiKey'time :: CDouble, aiKey'value :: v }
  deriving (Generic)

instance PrimBytes v => PrimBytes (AiSimpleKey v)

type AiVectorKey = AiSimpleKey AiVector3D
type AiQuatKey = AiSimpleKey AiQuaternion
type AiMeshKey = AiSimpleKey CUInt

data AiMeshMorphKey =
  AiMeshMorphKey {
    aiMeshMorphKey'time :: CDouble,
    aiMeshMorphKey'values :: Ptr CUInt,
    aiMeshMorphKey'weights :: Ptr CDouble,
    aiMeshMorphKey'numValuesAndWeights :: CUInt
  }
  deriving (Generic)
instance PrimBytes AiMeshMorphKey

newtype AiAnimBehaviour = AiAnimBehaviour CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiAnimBehaviour

pattern AiAnimBehaviour_DEFAULT :: AiAnimBehaviour
pattern AiAnimBehaviour_DEFAULT = AiAnimBehaviour 0x0
pattern AiAnimBehaviour_CONSTANT :: AiAnimBehaviour
pattern AiAnimBehaviour_CONSTANT = AiAnimBehaviour 0x1
pattern AiAnimBehaviour_LINEAR :: AiAnimBehaviour
pattern AiAnimBehaviour_LINEAR = AiAnimBehaviour 0x2
pattern AiAnimBehaviour_REPEAT :: AiAnimBehaviour
pattern AiAnimBehaviour_REPEAT = AiAnimBehaviour 0x3

data AiNodeAnim =
  AiNodeAnim {
    aiNodeAnim'nodeName :: AiString,
    aiNodeAnim'numPositionKeys :: CUInt,
    aiNodeAnim'positionKeys :: Ptr AiVectorKey,
    aiNodeAnim'numRotationKeys :: CUInt,
    aiNodeAnim'rotationKeys :: Ptr AiQuatKey,
    aiNodeAnim'numScalingKeys :: CUInt,
    aiNodeAnim'scalingKeys :: Ptr AiVectorKey,
    aiNodeAnim'preState :: AiAnimBehaviour,
    aiNodeAnim'postState :: AiAnimBehaviour
  }
  deriving (Generic)
instance PrimBytes AiNodeAnim

data AiMeshAnim =
  AiMeshAnim {
    aiMeshAnim'name :: AiString,
    aiMeshAnim'numKeys :: CUInt,
    aiMeshAnim'keys :: Ptr AiMeshKey
  }
  deriving (Generic)
instance PrimBytes AiMeshAnim

data AiMeshMorphAnim =
  AiMeshMorphAnim {
    aiMeshMorphAnim'name :: AiString,
    aiMeshMorphAnim'numKeys :: CUInt,
    aiMeshMorphAnim'keys :: Ptr AiMeshMorphKey
  }
  deriving (Generic)

instance PrimBytes AiMeshMorphAnim

data AiAnimation =
  AiAnimation {
    aiAnimation'name :: AiString,
    aiAnimation'duration :: CDouble,
    aiAnimation'ticksPerSecond :: CDouble,
    aiAnimation'numChannels :: CUInt,
    aiAnimation'channels :: Ptr (Ptr AiNodeAnim),
    aiAnimation'numMeshChannels :: CUInt,
    aiAnimation'meshChannels :: Ptr (Ptr AiMeshAnim),
    aiAnimation'numMorphMeshChannels :: CUInt,
    aiAnimation'morphMeshChannels :: Ptr (Ptr AiMeshMorphAnim)
  }
  deriving (Generic)

instance PrimBytes AiAnimation
