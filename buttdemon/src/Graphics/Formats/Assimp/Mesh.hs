{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Mesh where

import Graphics.Formats.Assimp.Types

import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

pattern AI_MAX_FACE_INDICES :: CUInt
pattern AI_MAX_FACE_INDICES = 0x7fff

pattern AI_MAX_BONE_WEIGHTS :: CUInt
pattern AI_MAX_BONE_WEIGHTS = 0x7fffffff

pattern AI_MAX_VERTICES :: CUInt
pattern AI_MAX_VERTICES = 0x7fffffff

pattern AI_MAX_FACES :: CUInt
pattern AI_MAX_FACES = 0x7fffffff

type MaxNumColorSets = 8
type MaxNumTextureCoords = 8

data AiFace =
  AiFace {
    aiFace'numIndices :: CUInt,
    aiFace'indices :: Ptr CUInt
  }
  deriving (Generic)
instance PrimBytes AiFace

data AiVertexWeight =
  AiVertexWeight {
    aiVertexWeight'vertexId :: CUInt,
    aiVertexWeight'weight :: CFloat
  }
  deriving (Generic)
instance PrimBytes AiVertexWeight

data AiBone =
  AiBone {
    aiBone'name :: AiString,
    aiBone'numWeights :: CUInt,
    aiBone'weights :: Ptr AiVertexWeight,
    aiBone'offsetMatrix :: AiMatrix4x4
  }
  deriving (Generic)
instance PrimBytes AiBone

newtype AiPrimitiveType = AiPrimitiveType CUInt deriving (Eq, Ord, Show, Generic)
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
    aiAnimMesh'numVertices :: CUInt,
    aiAnimMesh'weight :: CFloat
  }
  deriving (Generic)
instance PrimBytes AiAnimMesh

newtype AiMorphingMethod = AiMorphingMethod CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiMorphingMethod

pattern AiMorphingMethod_VERTEX_BLEND :: AiMorphingMethod
pattern AiMorphingMethod_VERTEX_BLEND = AiMorphingMethod 0x1
pattern AiMorphingMethod_MORPH_NORMALIZED :: AiMorphingMethod
pattern AiMorphingMethod_MORPH_NORMALIZED = AiMorphingMethod 0x2
pattern AiMorphingMethod_MORPH_RELATIVE :: AiMorphingMethod
pattern AiMorphingMethod_MORPH_RELATIVE = AiMorphingMethod 0x3

data AiMesh =
  AiMesh {
    aiMesh'primitiveTypes :: CUInt,
    aiMesh'numVertices :: CUInt,
    aiMesh'numFaces :: CUInt,
    aiMesh'vertices :: Ptr AiVector3D,
    aiMesh'normals :: Ptr AiVector3D,
    aiMesh'tangents :: Ptr AiVector3D,
    aiMesh'bitangents :: Ptr AiVector3D,
    aiMesh'colors :: Vector (Ptr AiColor4D) MaxNumColorSets,
    aiMesh'textureCoords :: Vector (Ptr AiVector3D) MaxNumTextureCoords,
    aiMesh'numUVComponents :: Vector CUInt MaxNumTextureCoords,
    aiMesh'faces :: Ptr AiFace,
    aiMesh'numBones :: CUInt,
    aiMesh'bones :: Ptr (Ptr AiBone),
    aiMesh'materialIndex :: CUInt,
    aiMesh'name :: AiString,
    aiMesh'numAnimMeshes :: CUInt,
    aiMesh'animMeshes :: Ptr (Ptr AiAnimMesh),
    aiMesh'method :: CUInt,
    aiMesh'aabb :: AiAABB
  }
  deriving (Generic)
instance PrimBytes AiMesh
