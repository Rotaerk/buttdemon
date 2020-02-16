{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Mesh where

import Graphics.Formats.Assimp.Types

import Data.Word
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

pattern AI_MAX_FACE_INDICES :: Word32
pattern AI_MAX_FACE_INDICES = 0x7fff

pattern AI_MAX_BONE_WEIGHTS :: Word32
pattern AI_MAX_BONE_WEIGHTS = 0x7fffffff

pattern AI_MAX_VERTICES :: Word32
pattern AI_MAX_VERTICES = 0x7fffffff

pattern AI_MAX_FACES :: Word32
pattern AI_MAX_FACES = 0x7fffffff

type MaxNumColorSets = 8
type MaxNumTextureCoords = 8

data AiFace =
  AiFace {
    aiFace'numIndices :: Word32,
    aiFace'indices :: Ptr Word32
  }
  deriving (Generic)
instance PrimBytes AiFace

data AiVertexWeight =
  AiVertexWeight {
    aiVertexWeight'vertexId :: Word32,
    aiVertexWeight'weight :: Float
  }
  deriving (Generic)
instance PrimBytes AiVertexWeight

data AiBone =
  AiBone {
    aiBone'name :: AiString,
    aiBone'numWeights :: Word32,
    aiBone'weights :: Ptr AiVertexWeight,
    aiBone'offsetMatrix :: AiMatrix4x4
  }
  deriving (Generic)
instance PrimBytes AiBone

newtype AiPrimitiveType = AiPrimitiveType Word32 deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiPrimitiveType

pattern AiPrimitiveType_POINT :: AiPrimitiveType
pattern AiPrimitiveType_POINT = AiPrimitiveType 0x1
pattern AiPrimitiveType_LINE :: AiPrimitiveType
pattern AiPrimitiveType_LINE = AiPrimitiveType 0x2
pattern AiPrimitiveType_TRIANGLE :: AiPrimitiveType
pattern AiPrimitiveType_TRIANGLE = AiPrimitiveType 0x4
pattern AiPrimitiveType_POLYGON :: AiPrimitiveType
pattern AiPrimitiveType_POLYGON = AiPrimitiveType 0x8

data AiAnimMesh =
  AiAnimMesh {
    aiAnimMesh'name :: AiString,
    aiAnimMesh'vertices :: Ptr AiVector3D,
    aiAnimMesh'normals :: Ptr AiVector3D,
    aiAnimMesh'tangents :: Ptr AiVector3D,
    aiAnimMesh'bitangents :: Ptr AiVector3D,
    aiAnimMesh'colors :: Vector (Ptr AiColor4D) MaxNumColorSets,
    aiAnimMesh'textureCoords :: Vector (Ptr AiVector3D) MaxNumTextureCoords,
    aiAnimMesh'numVertices :: Word32,
    aiAnimMesh'weight :: Float
  }
  deriving (Generic)
instance PrimBytes AiAnimMesh

newtype AiMorphingMethod = AiMorphingMethod Word32 deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiMorphingMethod

pattern AiMorphingMethod_VERTEX_BLEND :: AiMorphingMethod
pattern AiMorphingMethod_VERTEX_BLEND = AiMorphingMethod 0x1
pattern AiMorphingMethod_MORPH_NORMALIZED :: AiMorphingMethod
pattern AiMorphingMethod_MORPH_NORMALIZED = AiMorphingMethod 0x2
pattern AiMorphingMethod_MORPH_RELATIVE :: AiMorphingMethod
pattern AiMorphingMethod_MORPH_RELATIVE = AiMorphingMethod 0x3

data AiMesh =
  AiMesh {
    aiMesh'primitiveTypes :: Word32,
    aiMesh'numVertices :: Word32,
    aiMesh'numFaces :: Word32,
    aiMesh'vertices :: Ptr AiVector3D,
    aiMesh'normals :: Ptr AiVector3D,
    aiMesh'tangents :: Ptr AiVector3D,
    aiMesh'bitangents :: Ptr AiVector3D,
    aiMesh'colors :: Vector (Ptr AiColor4D) MaxNumColorSets,
    aiMesh'textureCoords :: Vector (Ptr AiVector3D) MaxNumTextureCoords,
    aiMesh'numUVComponents :: Vector Word32 MaxNumTextureCoords,
    aiMesh'faces :: Ptr AiFace,
    aiMesh'numBones :: Word32,
    aiMesh'bones :: Ptr (Ptr AiBone),
    aiMesh'materialIndex :: Word32,
    aiMesh'name :: AiString,
    aiMesh'numAnimMeshes :: Word32,
    aiMesh'animMeshes :: Ptr (Ptr AiAnimMesh),
    aiMesh'method :: Word32,
    aiMesh'aabb :: AiAABB
  }
  deriving (Generic)
instance PrimBytes AiMesh
