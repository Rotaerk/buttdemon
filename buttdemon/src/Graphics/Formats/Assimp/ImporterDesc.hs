{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.ImporterDesc where

import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

newtype AiImporterFlags = AiImporterFlags CUInt deriving (Eq, Ord, Show, Generic)
instance PrimBytes AiImporterFlags

pattern AiImporterFlags_SupportTextFlavour :: AiImporterFlags
pattern AiImporterFlags_SupportTextFlavour = AiImporterFlags 0x1
pattern AiImporterFlags_SupportBinaryFlavour :: AiImporterFlags
pattern AiImporterFlags_SupportBinaryFlavour = AiImporterFlags 0x2
pattern AiImporterFlags_SupportCompressedFlavour :: AiImporterFlags
pattern AiImporterFlags_SupportCompressedFlavour = AiImporterFlags 0x4
pattern AiImporterFlags_LimitedSupport :: AiImporterFlags
pattern AiImporterFlags_LimitedSupport = AiImporterFlags 0x8
pattern AiImporterFlags_Experimental :: AiImporterFlags
pattern AiImporterFlags_Experimental = AiImporterFlags 0x10

data AiImporterDesc =
  AiImporterDesc {
    name :: CString,
    author :: CString,
    maintainer :: CString,
    comments :: CString,
    flags :: CUInt,
    minMajor :: CUInt,
    minMinor :: CUInt,
    maxMajor :: CUInt,
    maxMinor :: CUInt,
    fileExtensions :: CString
  }
  deriving (Generic)
instance PrimBytes AiImporterDesc

foreign import ccall "aiGetImporterDesc" aiGetImporterDesc ::
  CString {-^ extension -} ->
  IO (Ptr AiImporterDesc)
