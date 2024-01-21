#define THE_HEADER "assimp/matrix4x4.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Matrix4x4 (
  AiMatrix4x4
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiMatrix4x4, AiMatrix4x4}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, a1, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, a2, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, a3, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, a4, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, b1, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, b2, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, b3, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, b4, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, c1, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, c2, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, c3, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, c4, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, d1, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, d2, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, d3, AiReal}
#{cstructfield struct aiMatrix4x4, AiMatrix4x4, d4, AiReal}
