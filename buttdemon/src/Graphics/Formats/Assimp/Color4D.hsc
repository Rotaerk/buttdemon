#include "assimp/color4.h"

module Graphics.Formats.Assimp.Color4D (
  AiColor4D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiColor4D

instance Allocable AiColor4D where
  sizeof = #{size struct aiColor4D}
  alignof = #{alignment struct aiColor4D}

instance Offset "r" AiColor4D AiReal where offsetof = #{offset struct aiColor4D, r}
instance Offset "g" AiColor4D AiReal where offsetof = #{offset struct aiColor4D, g}
instance Offset "b" AiColor4D AiReal where offsetof = #{offset struct aiColor4D, b}
instance Offset "a" AiColor4D AiReal where offsetof = #{offset struct aiColor4D, a}
