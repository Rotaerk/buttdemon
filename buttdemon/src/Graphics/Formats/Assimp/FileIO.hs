{-# LANGUAGE DeriveGeneric #-}

module Graphics.Formats.Assimp.FileIO where

import Graphics.Formats.Assimp.Types

import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

type AiFileWriteProcFunc =
  Ptr AiFile {-^ pFile -} ->
  Ptr CChar {-^ pIn -} ->
  CSize {-^ elementSize -} ->
  CSize {-^ elementCount -} ->
  IO CSize -- Returns number of elements of size elementSize written
type AiFileWriteProc = FunPtr AiFileWriteProcFunc

type AiFileReadProcFunc =
  Ptr AiFile {-^ pFile -} ->
  Ptr CChar {-^ pOut -} ->
  CSize {-^ elementSize -} ->
  CSize {-^ elementCount -} ->
  IO CSize -- Returns number of elements of size elementSize read
type AiFileReadProc = FunPtr AiFileReadProcFunc

type AiFileTellProcFunc = Ptr AiFile {-^ pFile -} -> IO CSize -- Returns current position in file
type AiFileTellProc = FunPtr AiFileTellProcFunc

type AiFileFlushProcFunc = Ptr AiFile {-^ pFile -} -> IO ()
type AiFileFlushProc = FunPtr AiFileFlushProcFunc

type AiFileSeekFunc = Ptr AiFile {-^ pFile -} -> CSize {-^ offset -} -> AiOrigin {-^ whence -} -> IO AiReturn
type AiFileSeek = FunPtr AiFileSeekFunc

type AiFileOpenProcFunc = Ptr AiFileIO {-^ pFileIO -} -> CString {-^ filename -} -> CString {-^ mode -} -> IO (Ptr AiFile)
type AiFileOpenProc = FunPtr AiFileOpenProcFunc

type AiFileCloseProcFunc = Ptr AiFileIO {-^ pFileIO -} -> Ptr AiFile {-^ pFile -} -> IO ()
type AiFileCloseProc = FunPtr AiFileCloseProcFunc

type AiUserData = Ptr CChar

data AiFileIO =
  AiFileIO {
    aiFileIO'openProc :: AiFileOpenProc,
    aiFileIO'closeProc :: AiFileCloseProc,
    aiFileIO'userData :: AiUserData
  }
  deriving (Generic)
instance PrimBytes AiFileIO

data AiFile =
  AiFile {
    aiFile'readProc :: AiFileReadProc,
    aiFile'writeProc :: AiFileWriteProc,
    aiFile'tellProc :: AiFileTellProc,
    aiFile'fileSizeProc :: AiFileTellProc,
    aiFile'seekProc :: AiFileSeek,
    aiFile'flushProc :: AiFileFlushProc,
    aiFile'userData :: AiUserData
  }
  deriving (Generic)
instance PrimBytes AiFile
