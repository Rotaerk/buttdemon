#include "assimp/aabb.h"

module Graphics.Formats.Assimp.AABB where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Vector3D

data AiAABB

instance Allocable AiAABB where
  sizeof = #{size struct aiAABB}
  alignof = #{alignment struct aiAABB}

instance Offset "mMin" AiAABB AiVector3D where offsetof = #{offset struct aiAABB, mMin}
instance Offset "mMax" AiAABB AiVector3D where offsetof = #{offset struct aiAABB, mMax}
