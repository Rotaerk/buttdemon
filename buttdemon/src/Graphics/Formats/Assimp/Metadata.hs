{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Metadata where

import Graphics.Formats.Assimp.Types

import Data.Void
import Data.Word
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

newtype AiMetadataType = AiMetadataType Word32 deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiMetadataType

pattern AI_BOOL :: AiMetadataType
pattern AI_BOOL = AiMetadataType 0
pattern AI_INT32 :: AiMetadataType
pattern AI_INT32 = AiMetadataType 1
pattern AI_UINT64:: AiMetadataType
pattern AI_UINT64= AiMetadataType 2
pattern AI_FLOAT :: AiMetadataType
pattern AI_FLOAT = AiMetadataType 3
pattern AI_DOUBLE :: AiMetadataType
pattern AI_DOUBLE = AiMetadataType 4
pattern AI_AISTRING :: AiMetadataType
pattern AI_AISTRING = AiMetadataType 5
pattern AI_AIVECTOR3D :: AiMetadataType
pattern AI_AIVECTOR3D = AiMetadataType 6
pattern AI_META_MAX :: AiMetadataType
pattern AI_META_MAX = AiMetadataType 7

data AiMetadataEntry =
  AiMetadataEntry {
    aiMetadataEntry'type :: AiMetadataType,
    aiMetadataEntry'data :: Ptr Void
  }
  deriving (Generic)
instance PrimBytes AiMetadataEntry

data AiMetadata =
  AiMetadata {
    aiMetadata'numProperties :: Word8,
    aiMetadata'keys :: Ptr AiString,
    aiMetadata'values :: Ptr AiMetadataEntry
  }
  deriving (Generic)
instance PrimBytes AiMetadata
