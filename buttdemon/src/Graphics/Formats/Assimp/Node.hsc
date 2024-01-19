#include "assimp/scene.h"

module Graphics.Formats.Assimp.Node (
  AiNode
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Metadata
import Graphics.Formats.Assimp.Types

data AiNode

instance Allocable AiNode where
  sizeof = #{size struct aiNode}
  alignof = #{alignment struct aiNode}

instance Offset "mName" AiNode AiString where offsetof = #{offset struct aiNode, mName}
instance Offset "mTransformation" AiNode AiMatrix4x4 where offsetof = #{offset struct aiNode, mTransformation}
instance Offset "mParent" AiNode (Ptr AiNode) where offsetof = #{offset struct aiNode, mParent}
instance Offset "mNumChildren" AiNode CUInt where offsetof = #{offset struct aiNode, mNumChildren}
instance Offset "mChildren" AiNode (Ptr (Ptr AiNode)) where offsetof = #{offset struct aiNode, mChildren}
instance Offset "mNumMeshes" AiNode CUInt where offsetof = #{offset struct aiNode, mNumMeshes}
instance Offset "mMeshes" AiNode (Ptr (Ptr CUInt)) where offsetof = #{offset struct aiNode, mMeshes}
instance Offset "mMetaData" AiNode (Ptr AiMetadata) where offsetof = #{offset struct aiNode, mMetaData}
