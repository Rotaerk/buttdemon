{-# LANGUAGE DeriveGeneric #-}

module Graphics.Formats.Assimp.Camera where
  
import Graphics.Formats.Assimp.Types

import GHC.Generics
import Numeric.PrimBytes

data AiCamera =
  AiCamera {
    aiCamera'name :: AiString,
    aiCamera'position :: AiVector3D,
    aiCamera'up :: AiVector3D,
    aiCamera'lookAt :: AiVector3D,
    aiCamera'horizontalFOV :: Float,
    aiCamera'clipPlaneNear :: Float,
    aiCamera'clipPlaneFar :: Float,
    aiCamera'aspect :: Float
  }
  deriving (Generic)

instance PrimBytes AiCamera
