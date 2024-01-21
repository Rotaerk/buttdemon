#define THE_HEADER "assimp/metadata_wrapper.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Metadata (
  AiMetadataType(..),
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
  aiType,
  AiMetadataEntry,
  AiMetadata
) where

import Data.Void
import Data.IntWord
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types

#{cenum aiMetadataType, AiMetadataType}
#{cenumerant AiMetadataType, AI_BOOL, aiMetadataType_BOOL, AiMetadataType_BOOL}
#{cenumerant AiMetadataType, AI_INT32, aiMetadataType_INT32, AiMetadataType_INT32}
#{cenumerant AiMetadataType, AI_UINT64, aiMetadataType_UINT64, AiMetadataType_UINT64}
#{cenumerant AiMetadataType, AI_FLOAT, aiMetadataType_FLOAT, AiMetadataType_FLOAT}
#{cenumerant AiMetadataType, AI_DOUBLE, aiMetadataType_DOUBLE, AiMetadataType_DOUBLE}
#{cenumerant AiMetadataType, AI_AISTRING, aiMetadataType_AISTRING, AiMetadataType_AISTRING}
#{cenumerant AiMetadataType, AI_AIVECTOR3D, aiMetadataType_AIVECTOR3D, AiMetadataType_AIVECTOR3D}
#{cenumerant AiMetadataType, AI_AIMETADATA, aiMetadataType_AIMETADATA, AiMetadataType_AIMETADATA}
#{cenumerant AiMetadataType, AI_INT64, aiMetadataType_INT64, AiMetadataType_INT64}
#{cenumerant AiMetadataType, AI_UINT32, aiMetadataType_UINT32, AiMetadataType_UINT32}

class IsAiMetadataType a where
  aiTypeOf :: a -> AiMetadataType

aiType :: forall a. IsAiMetadataType a => AiMetadataType
aiType = aiTypeOf (undefined :: a)

instance IsAiMetadataType CBool where aiTypeOf _ = aiMetadataType_BOOL 
instance IsAiMetadataType Int32 where aiTypeOf _ = aiMetadataType_INT32 
instance IsAiMetadataType Word64 where aiTypeOf _ = aiMetadataType_UINT64 
instance IsAiMetadataType CFloat where aiTypeOf _ = aiMetadataType_FLOAT 
instance IsAiMetadataType CDouble where aiTypeOf _ = aiMetadataType_DOUBLE 
instance IsAiMetadataType AiString where aiTypeOf _ = aiMetadataType_AISTRING 
instance IsAiMetadataType AiVector3D where aiTypeOf _ = aiMetadataType_AIVECTOR3D 
instance IsAiMetadataType AiMetadata where aiTypeOf _ = aiMetadataType_AIMETADATA 
instance IsAiMetadataType Int64 where aiTypeOf _ = aiMetadataType_INT64 
instance IsAiMetadataType Word32 where aiTypeOf _ = aiMetadataType_UINT32 

#{cstruct struct aiMetadataEntry, AiMetadataEntry}
#{cstructfield struct aiMetadataEntry, AiMetadataEntry, mType, AiMetadataType}
#{cstructfield struct aiMetadataEntry, AiMetadataEntry, mData, Ptr Void}

#{cstruct struct aiMetadata, AiMetadata}
#{cstructfield struct aiMetadata, AiMetadata, mNumProperties, CUInt}
#{cstructfield struct aiMetadata, AiMetadata, mKeys, (Ptr AiString)}
#{cstructfield struct aiMetadata, AiMetadata, mValues, (Ptr AiMetadataEntry)}
