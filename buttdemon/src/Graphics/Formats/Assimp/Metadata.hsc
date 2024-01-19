#define THE_HEADER "assimp/metadata_wrapper.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Metadata (
  AiMetadataType,
  aiMetadataType_BOOL, pattern AiMetadataType_BOOL,
  aiMetadataType_INT32, pattern AiMetadataType_INT32,
  aiMetadataType_UINT64, pattern AiMetadataType_UINT64,
  aiMetadataType_FLOAT, pattern AiMetadataType_FLOAT,
  aiMetadataType_DOUBLE, pattern AiMetadataType_DOUBLE,
  aiMetadataType_AISTRING, pattern AiMetadataType_AISTRING,
  aiMetadataType_AIVECTOR3D, pattern AiMetadataType_AIVECTOR3D,
  aiMetadataType_AIMETADATA, pattern AiMetadataType_AIMETADATA,
  aiMetadataType_INT64, pattern AiMetadataType_INT64,
  aiMetadataType_UINT32, pattern AiMetadataType_UINT32,
  IsAiMetadataType(..),
  AiMetadataEntry,
  AiMetadata
) where

import Data.Int
import Data.Void
import Data.Word
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types

type AiMetadataType = CInt

#{cint "AI_BOOL", "aiMetadataType_BOOL", "AiMetadataType_BOOL"}
#{cint "AI_INT32", "aiMetadataType_INT32", "AiMetadataType_INT32"}
#{cint "AI_UINT64", "aiMetadataType_UINT64", "AiMetadataType_UINT64"}
#{cint "AI_FLOAT", "aiMetadataType_FLOAT", "AiMetadataType_FLOAT"}
#{cint "AI_DOUBLE", "aiMetadataType_DOUBLE", "AiMetadataType_DOUBLE"}
#{cint "AI_AISTRING", "aiMetadataType_AISTRING", "AiMetadataType_AISTRING"}
#{cint "AI_AIVECTOR3D", "aiMetadataType_AIVECTOR3D", "AiMetadataType_AIVECTOR3D"}
#{cint "AI_AIMETADATA", "aiMetadataType_AIMETADATA", "AiMetadataType_AIMETADATA"}
#{cint "AI_INT64", "aiMetadataType_INT64", "AiMetadataType_INT64"}
#{cint "AI_UINT32", "aiMetadataType_UINT32", "AiMetadataType_UINT32"}

class IsAiMetadataType a where
  aiTypeOf :: AiMetadataType

instance IsAiMetadataType CBool where aiTypeOf = aiMetadataType_BOOL 
instance IsAiMetadataType Int32 where aiTypeOf = aiMetadataType_INT32 
instance IsAiMetadataType Word64 where aiTypeOf = aiMetadataType_UINT64 
instance IsAiMetadataType CFloat where aiTypeOf = aiMetadataType_FLOAT 
instance IsAiMetadataType CDouble where aiTypeOf = aiMetadataType_DOUBLE 
instance IsAiMetadataType AiString where aiTypeOf = aiMetadataType_AISTRING 
instance IsAiMetadataType AiVector3D where aiTypeOf = aiMetadataType_AIVECTOR3D 
instance IsAiMetadataType AiMetadata where aiTypeOf = aiMetadataType_AIMETADATA 
instance IsAiMetadataType Int64 where aiTypeOf = aiMetadataType_INT64 
instance IsAiMetadataType Word32 where aiTypeOf = aiMetadataType_UINT32 

data AiMetadataEntry

instance Allocable AiMetadataEntry where
  sizeof = #{size struct aiMetadataEntry}
  alignof = #{alignment struct aiMetadataEntry}

instance Offset "mType" AiMetadataEntry AiMetadataType where offsetof = #{offset struct aiMetadataEntry, mType}
instance Offset "mData" AiMetadataEntry (Ptr Void) where offsetof = #{offset struct aiMetadataEntry, mData}

data AiMetadata

instance Allocable AiMetadata where
  sizeof = #{size struct aiMetadata}
  alignof = #{alignment struct aiMetadata}

instance Offset "mNumProperties" AiMetadata CUInt where offsetof = #{offset struct aiMetadata, mNumProperties}
instance Offset "mKeys" AiMetadata (Ptr AiString) where offsetof = #{offset struct aiMetadata, mKeys}
instance Offset "mValues" AiMetadata (Ptr AiMetadataEntry) where offsetof = #{offset struct aiMetadata, mValues}
