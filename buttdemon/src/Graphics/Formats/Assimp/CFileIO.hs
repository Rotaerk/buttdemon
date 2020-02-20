{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}

module Graphics.Formats.Assimp.CFileIO where

import Graphics.Formats.Assimp.Types

import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

type AiFileWriteProc = Ptr AiFile -> CString -> CSize -> CSize -> IO CSize
type AiFileReadProc = Ptr AiFile -> Ptr CChar -> CSize -> CSize -> IO CSize
type AiFileTellProc = Ptr AiFile -> IO CSize
type AiFileFlushProc = Ptr AiFile -> IO ()
type AiFileSeek = Ptr AiFile -> CSize -> AiOrigin -> IO AiReturn
type AiFileOpenProc = Ptr AiFileIO -> CString -> CString -> IO (Ptr AiFile)
type AiFileCloseProc = Ptr AiFileIO -> Ptr AiFile -> IO ()
type AiUserData = Ptr CChar

data AiFileIO =
  AiFileIO {
    aiFileIO'openProc :: FunPtr AiFileOpenProc,
    aiFileIO'closeProc :: FunPtr AiFileCloseProc,
    aiFileIO'userData :: AiUserData
  }
  deriving (Generic, PrimBytes)

data AiFile =
  AiFile {
    aiFile'readProc :: FunPtr AiFileReadProc,
    aiFile'writeProc :: FunPtr AiFileWriteProc,
    aiFile'tellProc :: FunPtr AiFileTellProc,
    aiFile'fileSizeProc :: FunPtr AiFileTellProc,
    aiFile'seekProc :: FunPtr AiFileSeek,
    aiFile'flushProc :: FunPtr AiFileFlushProc,
    aiFile'userData :: AiUserData
  }
  deriving (Generic, PrimBytes)
