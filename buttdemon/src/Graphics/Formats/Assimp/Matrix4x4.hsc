#include "assimp/matrix4x4.h"

module Graphics.Formats.Assimp.Matrix4x4 (
  AiMatrix4x4
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

data AiMatrix4x4

instance Allocable AiMatrix4x4 where
  sizeof = #{size struct aiMatrix4x4}
  alignof = #{alignment struct aiMatrix4x4}

instance Offset "a1" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, a1}
instance Offset "a2" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, a2}
instance Offset "a3" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, a3}
instance Offset "a4" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, a4}
instance Offset "b1" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, b1}
instance Offset "b2" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, b2}
instance Offset "b3" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, b3}
instance Offset "b4" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, b4}
instance Offset "c1" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, c1}
instance Offset "c2" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, c2}
instance Offset "c3" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, c3}
instance Offset "c4" AiMatrix4x4 AiReal where offsetof = #{offset struct aiMatrix4x4, c4}
