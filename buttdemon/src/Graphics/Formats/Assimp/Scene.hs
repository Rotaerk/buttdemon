{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Scene where

import Graphics.Formats.Assimp.Animation
import Graphics.Formats.Assimp.Camera
import Graphics.Formats.Assimp.Light
import Graphics.Formats.Assimp.Material
import Graphics.Formats.Assimp.Texture
import Graphics.Formats.Assimp.Types

import Data.Bits
import Data.Word
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

data AiMesh
data AiMetadata

data AiNode =
  AiNode {
    aiNode'name :: AiString,
    aiNode'transformation :: AiMatrix4x4,
    aiNode'parent :: Ptr AiNode,
    aiNode'numChildren :: Word32,
    aiNode'children :: Ptr (Ptr AiNode),
    aiNode'numMeshes :: Word32,
    aiNode'meshes :: Ptr Word32,
    aiNode'metadata :: Ptr AiMetadata
  }
  deriving (Generic)

newtype AiSceneFlags = AiSceneFlags Word32 deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)

instance PrimBytes AiSceneFlags

pattern AI_SCENE_FLAGS_INCOMPLETE :: AiSceneFlags
pattern AI_SCENE_FLAGS_INCOMPLETE = AiSceneFlags 0x1
pattern AI_SCENE_FLAGS_VALIDATED :: AiSceneFlags
pattern AI_SCENE_FLAGS_VALIDATED = AiSceneFlags 0x2
pattern AI_SCENE_FLAGS_VALIDATION_WARNING :: AiSceneFlags
pattern AI_SCENE_FLAGS_VALIDATION_WARNING = AiSceneFlags 0x4
pattern AI_SCENE_FLAGS_NON_VERBOSE_FORMAT :: AiSceneFlags
pattern AI_SCENE_FLAGS_NON_VERBOSE_FORMAT = AiSceneFlags 0x8
pattern AI_SCENE_FLAGS_TERRAIN :: AiSceneFlags
pattern AI_SCENE_FLAGS_TERRAIN = AiSceneFlags 0x10
pattern AI_SCENE_FLAGS_ALLOW_SHARED :: AiSceneFlags
pattern AI_SCENE_FLAGS_ALLOW_SHARED = AiSceneFlags 0x20

data AiScene =
  AiScene {
    aiScene'flags :: AiSceneFlags,
    aiScene'rootNode :: Ptr AiNode,
    aiScene'numMeshes :: Word32,
    aiScene'meshes :: Ptr (Ptr AiMesh),
    aiScene'numMaterials :: Word32,
    aiScene'materials :: Ptr (Ptr AiMaterial),
    aiScene'numAnimations :: Word32,
    aiScene'animations :: Ptr (Ptr AiAnimation),
    aiScene'numTextures :: Word32,
    aiScene'textures :: Ptr (Ptr AiTexture),
    aiScene'numLights :: Word32,
    aiScene'lights :: Ptr (Ptr AiLight),
    aiScene'numCameras :: Word32,
    aiScene'cameras :: Ptr (Ptr AiCamera),
    aiScene'metadata :: Ptr AiMetadata
  }
  deriving (Generic, Show)

instance PrimBytes AiScene
