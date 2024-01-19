#include "assimp/camera.h"

module Graphics.Formats.Assimp.Camera (
  AiCamera
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Graphics.Formats.Assimp.Types

data AiCamera

instance Allocable AiCamera where
  sizeof = #{size struct aiCamera}
  alignof = #{alignment struct aiCamera}

instance Offset "mName" AiCamera AiString where offsetof = #{offset struct aiCamera, mName}
instance Offset "mPosition" AiCamera AiVector3D where offsetof = #{offset struct aiCamera, mPosition}
instance Offset "mUp" AiCamera AiVector3D where offsetof = #{offset struct aiCamera, mUp}
instance Offset "mLookAt" AiCamera AiVector3D where offsetof = #{offset struct aiCamera, mLookAt}
instance Offset "mHorizontalFOV" AiCamera CFloat where offsetof = #{offset struct aiCamera, mHorizontalFOV}
instance Offset "mClipPlaneNear" AiCamera CFloat where offsetof = #{offset struct aiCamera, mClipPlaneNear}
instance Offset "mClipPlaneFar" AiCamera CFloat where offsetof = #{offset struct aiCamera, mClipPlaneFar}
instance Offset "mAspect" AiCamera CFloat where offsetof = #{offset struct aiCamera, mAspect}
instance Offset "mOrthographicWidth" AiCamera CFloat where offsetof = #{offset struct aiCamera, mOrthographicWidth}
