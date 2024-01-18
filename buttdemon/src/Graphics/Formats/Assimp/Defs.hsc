#define THE_HEADER "assimp/defs.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Defs where

import Foreign.C.Types

#ifdef ASSIMP_DOUBLE_PRECISION
type AiReal = CDouble
type AiInt = CLLong
type AiUint = CULLong
#else
type AiReal = CFloat
type AiInt = CInt
type AiUint = CUInt
#endif
