#define THE_HEADER "assimp/quaternion.h"
#include "assimp/defs.h" // They forgot to include defs.h in quaternion.h...
#include THE_HEADER

module Graphics.Formats.Assimp.Quaternion where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Defs

#{cstruct struct aiQuaternion, AiQuaternion}
#{cstructfield struct aiQuaternion, AiQuaternion, w, AiReal}
#{cstructfield struct aiQuaternion, AiQuaternion, x, AiReal}
#{cstructfield struct aiQuaternion, AiQuaternion, y, AiReal}
#{cstructfield struct aiQuaternion, AiQuaternion, z, AiReal}
