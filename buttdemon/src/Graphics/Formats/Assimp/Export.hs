{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}

module Graphics.Formats.Assimp.Export where

import Graphics.Formats.Assimp.FileIO
import Graphics.Formats.Assimp.Scene
import Graphics.Formats.Assimp.Types

import Data.Void
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

data AiExportFormatDesc =
  AiExportFormatDesc {
    aiExportFormatDesc'id :: CString,
    aiExportFormatDesc'description :: CString,
    aiExportFormatDesc'fileExtension :: CString
  }
  deriving (Generic, PrimBytes)

foreign import ccall "aiGetExportFormatCount" aiGetExportFormatCount :: IO CSize

foreign import ccall "aiGetExportFormatDescription" aiGetExportFormatDescription ::
  CSize {-^ pIndex -} ->
  IO (Ptr AiExportFormatDesc)

foreign import ccall "aiReleaseExportFormatDescription" aiReleaseExportFormatDescription ::
  Ptr AiExportFormatDesc {-^ desc -} ->
  IO ()

foreign import ccall "aiCopyScene" aiCopyScene ::
  Ptr AiScene {-^ pIn -} ->
  Ptr (Ptr AiScene) {-^ pOut -} ->
  IO ()

foreign import ccall "aiFreeScene" aiFreeScene ::
  Ptr AiScene {-^ pIn -} ->
  IO ()

foreign import ccall "aiExportScene" aiExportScene ::
  Ptr AiScene {-^ pScene -} ->
  CString {-^ pFormatId -} ->
  CString {-^ pFileName -} ->
  CUInt {-^ pPreprocessing -} ->
  IO AiReturn

foreign import ccall "aiExportSceneEx" aiExportSceneEx ::
  Ptr AiScene {-^ pIn -} ->
  CString {-^ pFormatId -} ->
  CString {-^ pFileName -} ->
  Ptr AiFileIO {-^ pIO -} ->
  CUInt {-^ pPreprocessing -} ->
  IO AiReturn

data AiExportDataBlob =
  AiExportDataBlob {
    aiExportDataBlob'size :: CSize,
    aiExportDataBlob'data :: Ptr Void,
    aiExportDataBlob'name :: AiString,
    aiExportDataBlob'next :: Ptr AiExportDataBlob
  }
  deriving (Generic, PrimBytes)

foreign import ccall "aiExportSceneToBlob" aiExportSceneToBlob ::
  Ptr AiScene {-^ pScene -} ->
  CString {-^ pFormatId -} ->
  CUInt {-^ pPreprocessing -} ->
  IO (Ptr AiExportDataBlob)

foreign import ccall "aiReleaseExportBlob" aiReleaseExportBlob ::
  Ptr AiExportDataBlob {-^ pData -} ->
  IO ()
