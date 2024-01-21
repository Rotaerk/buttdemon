#define THE_HEADER "assimp/color4.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Color4D (
  AiColor4D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiColor4D, AiColor4D}
#{cstructfield struct aiColor4D, AiColor4D, r, AiReal}
#{cstructfield struct aiColor4D, AiColor4D, g, AiReal}
#{cstructfield struct aiColor4D, AiColor4D, b, AiReal}
#{cstructfield struct aiColor4D, AiColor4D, a, AiReal}
