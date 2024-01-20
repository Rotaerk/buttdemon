#define THE_HEADER "assimp/light.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Light (
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

type AiLightSourceType = #{type enum aiLightSourceType}

#{enumerant_ enum aiLightSourceType, "aiLightSource_UNDEFINED", "AiLightSource_UNDEFINED"}
#{enumerant_ enum aiLightSourceType, "aiLightSource_DIRECTIONAL", "AiLightSource_DIRECTIONAL"}
#{enumerant_ enum aiLightSourceType, "aiLightSource_POINT", "AiLightSource_POINT"}
#{enumerant_ enum aiLightSourceType, "aiLightSource_SPOT", "AiLightSource_SPOT"}
#{enumerant_ enum aiLightSourceType, "aiLightSource_AMBIENT", "AiLightSource_AMBIENT"}
#{enumerant_ enum aiLightSourceType, "aiLightSource_AREA", "AiLightSource_AREA"}

data AiLight

instance Allocable AiLight where
  sizeof = #{size struct aiLight}
  alignof = #{alignment struct aiLight}

instance Offset "mName" AiLight AiString where offsetof = #{offset struct aiLight, mName}
instance Offset "mType" AiLight AiLightSourceType where offsetof = #{offset struct aiLight, mType}
instance Offset "mPosition" AiLight AiVector3D where offsetof = #{offset struct aiLight, mPosition}
instance Offset "mDirection" AiLight AiVector3D where offsetof = #{offset struct aiLight, mDirection}
instance Offset "mUp" AiLight AiVector3D where offsetof = #{offset struct aiLight, mUp}
instance Offset "mAttenuationConstant" AiLight CFloat where offsetof = #{offset struct aiLight, mAttenuationConstant}
instance Offset "mAttenuationLinear" AiLight CFloat where offsetof = #{offset struct aiLight, mAttenuationLinear}
instance Offset "mAttenuationQuadratic" AiLight CFloat where offsetof = #{offset struct aiLight, mAttenuationQuadratic}
instance Offset "mColorDiffuse" AiLight AiColor3D where offsetof = #{offset struct aiLight, mColorDiffuse}
instance Offset "mColorSpecular" AiLight AiColor3D where offsetof = #{offset struct aiLight, mColorSpecular}
instance Offset "mColorAmbient" AiLight AiColor3D where offsetof = #{offset struct aiLight, mColorAmbient}
instance Offset "mAngleInnerCone" AiLight CFloat where offsetof = #{offset struct aiLight, mAngleInnerCone}
instance Offset "mAngleOuterCone" AiLight CFloat where offsetof = #{offset struct aiLight, mAngleOuterCone}
instance Offset "mSize" AiLight AiVector2D where offsetof = #{offset struct aiLight, mSize}
