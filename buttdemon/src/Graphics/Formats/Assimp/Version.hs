{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Version where

import Data.Bits
import GHC.Generics
import Foreign.C.String
import Foreign.C.Types
import Numeric.PrimBytes

foreign import ccall "aiGetLegalString" aiGetLegalString :: IO CString
foreign import ccall "aiGetVersionMinor" aiGetVersionMinor :: IO CUInt
foreign import ccall "aiGetVersionMajor" aiGetVersionMajor :: IO CUInt
foreign import ccall "aiGetVersionRevision" aiGetVersionRevision :: IO CUInt
foreign import ccall "aiGetBranchName" aiGetBranchName :: IO CString

newtype AiCompileFlags = AiCompileFlags CUInt deriving (Eq, Ord, Bits, FiniteBits, Show, Generic)
instance PrimBytes AiCompileFlags

pattern ASSIMP_CFLAGS_SHARED :: AiCompileFlags
pattern ASSIMP_CFLAGS_SHARED = AiCompileFlags 0x1
pattern ASSIMP_CFLAGS_STLPORT :: AiCompileFlags
pattern ASSIMP_CFLAGS_STLPORT = AiCompileFlags 0x2
pattern ASSIMP_CFLAGS_DEBUG :: AiCompileFlags
pattern ASSIMP_CFLAGS_DEBUG = AiCompileFlags 0x4
pattern ASSIMP_CFLAGS_NOBOOST :: AiCompileFlags
pattern ASSIMP_CFLAGS_NOBOOST = AiCompileFlags 0x8
pattern ASSIMP_CFLAGS_SINGLETHREADED :: AiCompileFlags
pattern ASSIMP_CFLAGS_SINGLETHREADED = AiCompileFlags 0x10

foreign import ccall "aiGetCompileFlags" aiGetCompileFlags :: IO AiCompileFlags
