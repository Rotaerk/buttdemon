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

#{cstring "AI_EMBEDDED_TEXNAME_PREFIX", "aiEmbeddedTexnamePrefix"}

data AiTexel

instance Allocable AiTexel where
  sizeof = #{size struct aiTexel}
  alignof = #{alignment struct aiTexel}

instance Offset "b" AiTexel CUInt where offsetof = #{offset struct aiTexel, b}
instance Offset "g" AiTexel CUInt where offsetof = #{offset struct aiTexel, g}
instance Offset "r" AiTexel CUInt where offsetof = #{offset struct aiTexel, r}
instance Offset "a" AiTexel CUInt where offsetof = #{offset struct aiTexel, a}

data AiTexture

instance Allocable AiTexture where
  sizeof = #{size struct aiTexture}
  alignof = #{alignment struct aiTexture}

instance Offset "mWidth" AiTexture CUInt where offsetof = #{offset struct aiTexture, mWidth}
instance Offset "mHeight" AiTexture CUInt where offsetof = #{offset struct aiTexture, mHeight}
instance Offset "achFormatHint" AiTexture CChar where offsetof = #{offset struct aiTexture, achFormatHint}
instance Offset "pcData" AiTexture (Ptr AiTexel) where offsetof = #{offset struct aiTexture, pcData}
instance Offset "mFilename" AiTexture AiString where offsetof = #{offset struct aiTexture, mFilename}
