#include "assimp/defs.h"

module Graphics.Formats.Assimp.Defs (
  AiReal,
  AiInt,
  AiUint
) where

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
