#define THE_HEADER "assimp/vector2.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Vector2D (
  AiVector2D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiVector2D, AiVector2D}
#{cstructfield struct aiVector2D, AiVector2D, x, AiReal}
#{cstructfield struct aiVector2D, AiVector2D, y, AiReal}
