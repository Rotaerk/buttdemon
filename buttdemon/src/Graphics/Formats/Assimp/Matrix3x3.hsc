#define THE_HEADER "assimp/matrix3x3.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Matrix3x3 (
  AiMatrix3x3
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiMatrix3x3, AiMatrix3x3}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, a1, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, a2, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, a3, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, b1, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, b2, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, b3, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, c1, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, c2, AiReal}
#{cstructfield struct aiMatrix3x3, AiMatrix3x3, c3, AiReal}
