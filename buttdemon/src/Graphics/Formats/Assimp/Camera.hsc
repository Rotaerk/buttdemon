#define THE_HEADER "assimp/camera.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Camera (
  AiCamera
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Graphics.Formats.Assimp.Types

#{cstruct struct aiCamera, AiCamera}
#{cstructfield struct aiCamera, AiCamera, mName, AiString}
#{cstructfield struct aiCamera, AiCamera, mPosition, AiVector3D}
#{cstructfield struct aiCamera, AiCamera, mUp, AiVector3D}
#{cstructfield struct aiCamera, AiCamera, mLookAt, AiVector3D}
#{cstructfield struct aiCamera, AiCamera, mHorizontalFOV, CFloat}
#{cstructfield struct aiCamera, AiCamera, mClipPlaneNear, CFloat}
#{cstructfield struct aiCamera, AiCamera, mClipPlaneFar, CFloat}
#{cstructfield struct aiCamera, AiCamera, mAspect, CFloat}
#{cstructfield struct aiCamera, AiCamera, mOrthographicWidth, CFloat}
