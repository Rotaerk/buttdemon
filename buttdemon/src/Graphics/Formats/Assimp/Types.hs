{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}

module Graphics.Formats.Assimp.Types where

import Data.Bits
import Data.Char
import Data.Int
import Data.String
import Data.Word
import Foreign.C.Types
import GHC.Generics
import Numeric.PrimBytes
import Numeric.DataFrame
import Numeric.Dimensions

type AiReal = CFloat
type AiInt = CInt
type AiUInt = CUInt
type AiInt32 = Int32
type AiUInt32 = Word32
type AiBool = CInt

pattern AI_FALSE :: AiBool
pattern AI_FALSE = 0

pattern AI_TRUE :: AiBool
pattern AI_TRUE = 1

data AiVector2D = AiVector2D { aiVector2D'x, aiVector2D'y :: AiReal }
  deriving (Generic)
instance PrimBytes AiVector2D

data AiVector3D = AiVector3D { aiVector3D'x, aiVector3D'y, aiVector3D'z :: AiReal }
  deriving (Generic)
instance PrimBytes AiVector3D

data AiAABB = AiAABB { aiAABB'min, aiAABB'max :: AiVector3D }
  deriving (Generic)
instance PrimBytes AiAABB 

data AiColor3D = AiColor3D { aiColor3D'r, aiColor3D'g, aiColor3D'b :: AiReal }
  deriving (Generic)
instance PrimBytes AiColor3D

data AiColor4D = AiColor4D { aiColor4D'r, aiColor4D'g, aiColor4D'b, aiColor4D'a :: AiReal } deriving (Generic)
instance PrimBytes AiColor4D

data AiMatrix3x3 =
  AiMatrix3x3 {
    aiMatrix3x3'a1, aiMatrix3x3'a2, aiMatrix3x3'a3,
    aiMatrix3x3'b1, aiMatrix3x3'b2, aiMatrix3x3'b3,
    aiMatrix3x3'c1, aiMatrix3x3'c2, aiMatrix3x3'c3 :: AiReal
  }
  deriving (Generic)
instance PrimBytes AiMatrix3x3

data AiMatrix4x4 =
  AiMatrix4x4 {
    aiMatrix4x4'a1, aiMatrix4x4'a2, aiMatrix4x4'a3, aiMatrix4x4'a4,
    aiMatrix4x4'b1, aiMatrix4x4'b2, aiMatrix4x4'b3, aiMatrix4x4'b4,
    aiMatrix4x4'c1, aiMatrix4x4'c2, aiMatrix4x4'c3, aiMatrix4x4'c4,
    aiMatrix4x4'd1, aiMatrix4x4'd2, aiMatrix4x4'd3, aiMatrix4x4'd4 :: AiReal
  }
  deriving (Generic)
instance PrimBytes AiMatrix4x4

data AiQuaternion = AiQuaternion { aiQuaternion'w, aiQuaternion'x, aiQuaternion'y, aiQuaternion'z :: AiReal }
  deriving (Generic)
instance PrimBytes AiQuaternion

data AiPlane = AiPlane { aiPlane'a, aiPlane'b, aiPlane'c, aiPlane'd :: AiReal } deriving (Generic)
instance PrimBytes AiPlane

data AiRay = AiRay { aiRay'pos, aiRay'dir :: AiVector3D } deriving (Generic)
instance PrimBytes AiRay

data AiString =
  AiString {
    aiString'length :: AiUInt32,
    aiString'data :: Vector CChar 1024
  }
  deriving (Generic)
instance PrimBytes AiString

vectorToList :: forall t (n :: Nat). (PrimBytes t, KnownDim n) => Vector t n -> [t]
vectorToList = fmap unScalar . sewfoldr (:) []

instance Eq AiString where
  AiString l1 d1 == AiString l2 d2 =
    l1 == l2 &&
    take (fromIntegral l1) (vectorToList d1) == take (fromIntegral l2) (vectorToList d2)

instance IsString AiString where
  fromString = AiString <$> fromIntegral . length <*> fromFlatList dims 0 . fmap (fromIntegral . ord)

instance Show AiString where
  show (AiString l d) = take (fromIntegral l) . fmap (chr . fromIntegral) . vectorToList $ d

newtype AiReturn = AiReturn CInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiReturn

pattern AiReturn_SUCCESS :: AiReturn
pattern AiReturn_SUCCESS = AiReturn 0x0
pattern AiReturn_FAILURE :: AiReturn
pattern AiReturn_FAILURE = AiReturn (-0x1)
pattern AiReturn_OUTOFMEMORY :: AiReturn
pattern AiReturn_OUTOFMEMORY = AiReturn (-0x3)

newtype AiOrigin = AiOrigin CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiOrigin

pattern AiOrigin_SET :: AiOrigin
pattern AiOrigin_SET = AiOrigin 0x0
pattern AiOrigin_CUR :: AiOrigin
pattern AiOrigin_CUR = AiOrigin 0x1
pattern AiOrigin_END :: AiOrigin
pattern AiOrigin_END = AiOrigin 0x3

newtype AiDefaultLogStream = AiDefaultLogStream CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiDefaultLogStream

pattern AiDefaultLogStream_FILE :: AiDefaultLogStream
pattern AiDefaultLogStream_FILE = AiDefaultLogStream 0x1
pattern AiDefaultLogStream_STDOUT :: AiDefaultLogStream
pattern AiDefaultLogStream_STDOUT = AiDefaultLogStream 0x2
pattern AiDefaultLogStream_STDERR :: AiDefaultLogStream
pattern AiDefaultLogStream_STDERR = AiDefaultLogStream 0x4
pattern AiDefaultLogStream_DEBUGGER :: AiDefaultLogStream
pattern AiDefaultLogStream_DEBUGGER = AiDefaultLogStream 0x8

data AiMemoryInfo =
  AiMemoryInfo {
    aiMemoryInfo'textures, aiMemoryInfo'materials, aiMemoryInfo'meshes, aiMemoryInfo'nodes,
    aiMemoryInfo'animations, aiMemoryInfo'cameras, aiMemoryInfo'lights, aiMemoryInfo'total :: CUInt
  }
  deriving (Generic)
instance PrimBytes AiMemoryInfo
