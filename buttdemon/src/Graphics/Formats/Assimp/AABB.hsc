#define THE_HEADER "assimp/aabb.h"
#include THE_HEADER

module Graphics.Formats.Assimp.AABB where

import Foreign.Allocable
import Foreign.Offset
import Graphics.Formats.Assimp.Vector3D

#{cstruct struct aiAABB, AiAABB}
#{cstructfield struct aiAABB, AiAABB, mMin, AiVector3D}
#{cstructfield struct aiAABB, AiAABB, mMax, AiVector3D}
