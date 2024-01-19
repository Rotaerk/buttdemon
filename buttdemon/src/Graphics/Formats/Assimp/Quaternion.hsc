#include "assimp/defs.h" // They forgot to include defs.h in quaternion.h...
#include "assimp/quaternion.h"

module Graphics.Formats.Assimp.Quaternion where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiQuaternion

instance Allocable AiQuaternion where
  sizeof = #{size struct aiQuaternion}
  alignof = #{alignment struct aiQuaternion}

instance Offset "w" AiQuaternion AiReal where offsetof = #{offset struct aiQuaternion, w}
instance Offset "x" AiQuaternion AiReal where offsetof = #{offset struct aiQuaternion, x}
instance Offset "y" AiQuaternion AiReal where offsetof = #{offset struct aiQuaternion, y}
instance Offset "z" AiQuaternion AiReal where offsetof = #{offset struct aiQuaternion, z}
