#define THE_HEADER "assimp/vector3.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Vector3D (
  AiVector3D
) where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiVector3D, AiVector3D}
#{cstructfield struct aiVector3D, AiVector3D, x, AiReal}
#{cstructfield struct aiVector3D, AiVector3D, y, AiReal}
#{cstructfield struct aiVector3D, AiVector3D, z, AiReal}
