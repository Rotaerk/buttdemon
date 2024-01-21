#define THE_HEADER "assimp/light.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Light (
  AiLightSourceType(..),
  aiLightSource_UNDEFINED, pattern AiLightSource_UNDEFINED,
  aiLightSource_DIRECTIONAL, pattern AiLightSource_DIRECTIONAL,
  aiLightSource_POINT, pattern AiLightSource_POINT,
  aiLightSource_SPOT, pattern AiLightSource_SPOT,
  aiLightSource_AMBIENT, pattern AiLightSource_AMBIENT,
  aiLightSource_AREA, pattern AiLightSource_AREA,
  AiLight
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Graphics.Formats.Assimp.Types

#{cenum enum aiLightSourceType, AiLightSourceType}
#{cenumerant_ AiLightSourceType, aiLightSource_UNDEFINED, AiLightSource_UNDEFINED}
#{cenumerant_ AiLightSourceType, aiLightSource_DIRECTIONAL, AiLightSource_DIRECTIONAL}
#{cenumerant_ AiLightSourceType, aiLightSource_POINT, AiLightSource_POINT}
#{cenumerant_ AiLightSourceType, aiLightSource_SPOT, AiLightSource_SPOT}
#{cenumerant_ AiLightSourceType, aiLightSource_AMBIENT, AiLightSource_AMBIENT}
#{cenumerant_ AiLightSourceType, aiLightSource_AREA, AiLightSource_AREA}

#{cstruct struct aiLight, AiLight}
#{cstructfield struct aiLight, AiLight, mName, AiString}
#{cstructfield struct aiLight, AiLight, mType, AiLightSourceType}
#{cstructfield struct aiLight, AiLight, mPosition, AiVector3D}
#{cstructfield struct aiLight, AiLight, mDirection, AiVector3D}
#{cstructfield struct aiLight, AiLight, mUp, AiVector3D}
#{cstructfield struct aiLight, AiLight, mAttenuationConstant, CFloat}
#{cstructfield struct aiLight, AiLight, mAttenuationLinear, CFloat}
#{cstructfield struct aiLight, AiLight, mAttenuationQuadratic, CFloat}
#{cstructfield struct aiLight, AiLight, mColorDiffuse, AiColor3D}
#{cstructfield struct aiLight, AiLight, mColorSpecular, AiColor3D}
#{cstructfield struct aiLight, AiLight, mColorAmbient, AiColor3D}
#{cstructfield struct aiLight, AiLight, mAngleInnerCone, CFloat}
#{cstructfield struct aiLight, AiLight, mAngleOuterCone, CFloat}
#{cstructfield struct aiLight, AiLight, mSize, AiVector2D}
