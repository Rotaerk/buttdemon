#include "assimp/vector3.h"

module Graphics.Formats.Assimp.Vector3D (
  AiVector3D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiVector3D

instance Allocable AiVector3D where
  sizeof = #{size struct aiVector3D}
  alignof = #{alignment struct aiVector3D}

instance Offset "x" AiVector3D AiReal where offsetof = #{offset struct aiVector3D, x}
instance Offset "y" AiVector3D AiReal where offsetof = #{offset struct aiVector3D, y}
instance Offset "z" AiVector3D AiReal where offsetof = #{offset struct aiVector3D, z}