{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Light where

import Graphics.Formats.Assimp.Types

import Data.Int
import GHC.Generics
import Numeric.PrimBytes

newtype AiLightSourceType = AiLightSourceType Int32 deriving (Eq, Ord, Show, Generic)

instance PrimBytes AiLightSourceType

pattern AiLightSource_UNDEFINED :: AiLightSourceType
pattern AiLightSource_UNDEFINED = AiLightSourceType 0x0
pattern AiLightSource_DIRECTIONAL :: AiLightSourceType
pattern AiLightSource_DIRECTIONAL = AiLightSourceType 0x1
pattern AiLightSource_POINT :: AiLightSourceType
pattern AiLightSource_POINT = AiLightSourceType 0x2
pattern AiLightSource_SPOT :: AiLightSourceType
pattern AiLightSource_SPOT = AiLightSourceType 0x3
pattern AiLightSource_AMBIENT :: AiLightSourceType
pattern AiLightSource_AMBIENT = AiLightSourceType 0x4
pattern AiLightSource_AREA :: AiLightSourceType
pattern AiLightSource_AREA = AiLightSourceType 0x5

data AiLight =
  AiLight {
    aiLight'name :: AiString,
    aiLight'type :: AiLightSourceType,
    aiLight'position :: AiVector3D,
    aiLight'direction :: AiVector3D,
    aiLight'up :: AiVector3D,
    aiLight'attenuationConstant :: Float,
    aiLight'attenuationLinear :: Float,
    aiLight'attenuationQuadratic :: Float,
    aiLight'colorDiffuse :: AiColor3D,
    aiLight'colorSpecular :: AiColor3D,
    aiLight'colorAmbient :: AiColor3D,
    aiLight'angleInnerCone :: Float,
    aiLight'angleOuterCone :: Float,
    aiLight'size :: AiVector2D
  }
  deriving (Generic)

instance PrimBytes AiLight
