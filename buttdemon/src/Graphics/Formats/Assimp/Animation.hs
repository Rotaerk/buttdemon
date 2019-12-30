{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Animation where
  
import Graphics.Formats.Assimp.Types

import Data.Int
import Data.Word
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

data AiSimpleKey v = AiSimpleKey { aiKey'time :: Double, aiKey'value :: v }
  deriving (Generic)

instance PrimBytes v => PrimBytes (AiSimpleKey v)

type AiVectorKey = AiSimpleKey AiVector3D
type AiQuatKey = AiSimpleKey AiQuaternion
type AiMeshKey = AiSimpleKey Word32

data AiMeshMorphKey =
  AiMeshMorphKey {
    aiMeshMorphKey'time :: Double,
    aiMeshMorphKey'values :: Ptr Word32,
    aiMeshMorphKey'weights :: Ptr Double,
    aiMeshMorphKey'numValuesAndWeights :: Word32
  }
  deriving (Generic)

instance PrimBytes AiMeshMorphKey

newtype AiAnimBehaviour = AiAnimBehaviour Int32 deriving (Eq, Ord, Show, Generic)

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
    aiNodeAnim'numPositionKeys :: Word32,
    aiNodeAnim'positionKeys :: Ptr AiVectorKey,
    aiNodeAnim'numRotationKeys :: Word32,
    aiNodeAnim'rotationKeys :: Ptr AiQuatKey,
    aiNodeAnim'numScalingKeys :: Word32,
    aiNodeAnim'scalingKeys :: Ptr AiVectorKey,
    aiNodeAnim'preState :: AiAnimBehaviour,
    aiNodeAnim'postState :: AiAnimBehaviour
  }
  deriving (Generic)

instance PrimBytes AiNodeAnim

data AiMeshAnim =
  AiMeshAnim {
    aiMeshAnim'name :: AiString,
    aiMeshAnim'numKeys :: Word32,
    aiMeshAnim'keys :: Ptr AiMeshKey
  }
  deriving (Generic)

instance PrimBytes AiMeshAnim

data AiMeshMorphAnim =
  AiMeshMorphAnim {
    aiMeshMorphAnim'name :: AiString,
    aiMeshMorphAnim'numKeys :: Word32,
    aiMeshMorphAnim'keys :: Ptr AiMeshMorphKey
  }
  deriving (Generic)

instance PrimBytes AiMeshMorphAnim

data AiAnimation =
  AiAnimation {
    aiAnimation'name :: AiString,
    aiAnimation'duration :: Double,
    aiAnimation'ticksPerSecond :: Double,
    aiAnimation'numChannels :: Word32,
    aiAnimation'channels :: Ptr (Ptr AiNodeAnim),
    aiAnimation'numMeshChannels :: Word32,
    aiAnimation'meshChannels :: Ptr (Ptr AiMeshAnim),
    aiAnimation'numMorphMeshChannels :: Word32,
    aiAnimation'morphMeshChannels :: Ptr (Ptr AiMeshMorphAnim)
  }
  deriving (Generic)

instance PrimBytes AiAnimation
