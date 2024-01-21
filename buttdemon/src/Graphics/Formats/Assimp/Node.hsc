#define THE_HEADER "assimp/scene.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Node (
  AiNode
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Metadata
import Graphics.Formats.Assimp.Types

#{cstruct struct aiNode, AiNode}
#{cstructfield struct aiNode, AiNode, mName, AiString}
#{cstructfield struct aiNode, AiNode, mTransformation, AiMatrix4x4}
#{cstructfield struct aiNode, AiNode, mParent, Ptr AiNode}
#{cstructfield struct aiNode, AiNode, mNumChildren, CUInt}
#{cstructfield struct aiNode, AiNode, mChildren, Ptr (Ptr AiNode)}
#{cstructfield struct aiNode, AiNode, mNumMeshes, CUInt}
#{cstructfield struct aiNode, AiNode, mMeshes, Ptr (Ptr CUInt)}
#{cstructfield struct aiNode, AiNode, mMetaData, Ptr AiMetadata}
