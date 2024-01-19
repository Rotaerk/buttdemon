#include "assimp/vector2.h"

module Graphics.Formats.Assimp.Vector2D (
  AiVector2D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiVector2D

instance Allocable AiVector2D where
  sizeof = #{size struct aiVector2D}
  alignof = #{alignment struct aiVector2D}

instance Offset "x" AiVector2D AiReal where offsetof = #{offset struct aiVector2D, x}
instance Offset "y" AiVector2D AiReal where offsetof = #{offset struct aiVector2D, y}
