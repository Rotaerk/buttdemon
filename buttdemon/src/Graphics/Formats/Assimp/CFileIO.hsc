#define THE_HEADER "assimp/cfileio.h"
#include THE_HEADER

module Graphics.Formats.Assimp.CFileIO (
  AiFileWriteProcType,
  AiFileWriteProc,
  AiFileReadProcType,
  AiFileReadProc,
  AiFileTellProcType,
  AiFileTellProc,
  AiFileFlushProcType,
  AiFileFlushProc,
  AiFileSeekType,
  AiFileSeek,
  AiFileOpenProcType,
  AiFileOpenProc,
  AiFileCloseProcType,
  AiFileCloseProc,
  AiUserData,
  AiFileIO,
  AiFile
) where

import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types

type AiFileWriteProcType = Ptr AiFile -> ConstPtr CChar -> CSize -> CSize -> IO CSize
type AiFileWriteProc = FunPtr AiFileWriteProcType 
type AiFileReadProcType = Ptr AiFile -> Ptr CChar -> CSize -> CSize -> IO CSize
type AiFileReadProc = FunPtr AiFileReadProcType 
type AiFileTellProcType = Ptr AiFile -> IO CSize
type AiFileTellProc = FunPtr AiFileTellProcType 
type AiFileFlushProcType = Ptr AiFile -> IO ()
type AiFileFlushProc = FunPtr AiFileFlushProcType 
type AiFileSeekType = Ptr AiFile -> CSize -> AiOrigin -> IO AiReturn
type AiFileSeek = FunPtr AiFileSeekType 

type AiFileOpenProcType = Ptr AiFileIO -> CSize -> AiOrigin -> IO AiReturn
type AiFileOpenProc = FunPtr AiFileOpenProcType 
type AiFileCloseProcType = Ptr AiFileIO -> Ptr AiFile -> IO ()
type AiFileCloseProc = FunPtr AiFileCloseProcType 

type AiUserData = CString

#{cstruct struct aiFileIO, AiFileIO}
#{cstructfield struct aiFileIO, AiFileIO, OpenProc, AiFileOpenProc}
#{cstructfield struct aiFileIO, AiFileIO, CloseProc, AiFileCloseProc}
#{cstructfield struct aiFileIO, AiFileIO, UserData, AiUserData}

#{cstruct struct aiFile, AiFile}
#{cstructfield struct aiFile, AiFile, ReadProc, AiFileReadProc}
#{cstructfield struct aiFile, AiFile, WriteProc, AiFileWriteProc}
#{cstructfield struct aiFile, AiFile, TellProc, AiFileTellProc}
#{cstructfield struct aiFile, AiFile, FileSizeProc, AiFileTellProc}
#{cstructfield struct aiFile, AiFile, SeekProc, AiFileSeek}
#{cstructfield struct aiFile, AiFile, FlushProc, AiFileFlushProc}
#{cstructfield struct aiFile, AiFile, UserData, AiUserData}
