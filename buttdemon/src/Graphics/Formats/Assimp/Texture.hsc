#define THE_HEADER "assimp/texture.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Texture (
  aiEmbeddedTexnamePrefix,
  AiTexel,
  AiTexture
) where

import Foreign.Allocable
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types

#{cstring AI_EMBEDDED_TEXNAME_PREFIX, aiEmbeddedTexnamePrefix}

#{cstruct struct aiTexel, AiTexel}
#{cstructfield struct aiTexel, AiTexel, b, CUInt}
#{cstructfield struct aiTexel, AiTexel, g, CUInt}
#{cstructfield struct aiTexel, AiTexel, r, CUInt}
#{cstructfield struct aiTexel, AiTexel, a, CUInt}

#{cstruct struct aiTexture, AiTexture}
#{cstructfield struct aiTexture, AiTexture, mWidth, CUInt}
#{cstructfield struct aiTexture, AiTexture, mHeight, CUInt}
#{cstructfield struct aiTexture, AiTexture, achFormatHint, CChar}
#{cstructfield struct aiTexture, AiTexture, pcData, Ptr AiTexel}
#{cstructfield struct aiTexture, AiTexture, mFilename, AiString}
