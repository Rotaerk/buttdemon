{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Scene where

import Graphics.Formats.Assimp.Animation
import Graphics.Formats.Assimp.Camera
import Graphics.Formats.Assimp.Light
import Graphics.Formats.Assimp.Material
import Graphics.Formats.Assimp.Mesh
import Graphics.Formats.Assimp.Metadata
import Graphics.Formats.Assimp.Texture
import Graphics.Formats.Assimp.Types

import Data.Bits
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

data AiNode =
  AiNode {
    aiNode'name :: AiString,
    aiNode'transformation :: AiMatrix4x4,
    aiNode'parent :: Ptr AiNode,
    aiNode'numChildren :: CUInt,
    aiNode'children :: Ptr (Ptr AiNode),
    aiNode'numMeshes :: CUInt,
    aiNode'meshes :: Ptr CUInt,
    aiNode'metadata :: Ptr AiMetadata
  }
  deriving (Generic)

newtype AiSceneFlags = AiSceneFlags CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)

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
    aiScene'numMeshes :: CUInt,
    aiScene'meshes :: Ptr (Ptr AiMesh),
    aiScene'numMaterials :: CUInt,
    aiScene'materials :: Ptr (Ptr AiMaterial),
    aiScene'numAnimations :: CUInt,
    aiScene'animations :: Ptr (Ptr AiAnimation),
    aiScene'numTextures :: CUInt,
    aiScene'textures :: Ptr (Ptr AiTexture),
    aiScene'numLights :: CUInt,
    aiScene'lights :: Ptr (Ptr AiLight),
    aiScene'numCameras :: CUInt,
    aiScene'cameras :: Ptr (Ptr AiCamera),
    aiScene'metadata :: Ptr AiMetadata
  }
  deriving (Generic, Show)

instance PrimBytes AiScene
