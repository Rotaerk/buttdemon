#include "assimp/matrix3x3.h"

module Graphics.Formats.Assimp.Matrix3x3 (
  AiMatrix3x3
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiMatrix3x3

instance Allocable AiMatrix3x3 where
  sizeof = #{size struct aiMatrix3x3}
  alignof = #{alignment struct aiMatrix3x3}

instance Offset "a1" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, a1}
instance Offset "a2" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, a2}
instance Offset "a3" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, a3}
instance Offset "b1" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, b1}
instance Offset "b2" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, b2}
instance Offset "b3" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, b3}
instance Offset "c1" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, c1}
instance Offset "c2" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, c2}
instance Offset "c3" AiMatrix3x3 AiReal where offsetof = #{offset struct aiMatrix3x3, c3}
