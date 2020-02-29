{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}

module Graphics.Formats.Assimp.Import where

import Graphics.Formats.Assimp.FileIO
import Graphics.Formats.Assimp.ImporterDesc
import Graphics.Formats.Assimp.PostProcess
import Graphics.Formats.Assimp.Scene
import Graphics.Formats.Assimp.Types

import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.PrimBytes

type AiLogStreamCallbackFunc =
  CString {-^ message -} ->
  Ptr CChar {-^ user -} ->
  IO ()
type AiLogStreamCallback = FunPtr AiLogStreamCallbackFunc

data AiLogStream =
  AiLogStream {
    aiLogStream'callback :: AiLogStreamCallback,
    aiLogStream'user :: Ptr CChar
  }
  deriving (Generic, PrimBytes)

data AiPropertyStore =
  AiPropertyStore {
    aiPropertyStore'sentinel :: CChar
  }
  deriving (Generic, PrimBytes)

foreign import ccall "aiImportFile" aiImportFile ::
  CString {-^ pFile -} ->
  AiPostProcessSteps {-^ flags -} ->
  IO (Ptr AiScene)

foreign import ccall "aiImportFileEx" aiImportFileEx ::
  CString {-^ pFile -} ->
  CUInt {-^ flags -} ->
  Ptr AiFileIO {-^ pFS -} ->
  IO (Ptr AiScene)

foreign import ccall "aiImportFileExWithProperties" aiImportFileExWithProperties ::
  CString {-^ pFile -} ->
  CUInt {-^ flags -} ->
  Ptr AiFileIO {-^ pFS -} ->
  Ptr AiPropertyStore {-^ pProps -} ->
  IO (Ptr AiScene)

foreign import ccall "aiImportFileFromMemory" aiImportFileFromMemory ::
  Ptr CChar {-^ pBuffer -} ->
  CUInt {-^ length -} ->
  CUInt {-^ flags -} ->
  CString {-^ pHint -} ->
  IO (Ptr AiScene)

foreign import ccall "aiImportFileFromMemoryWithProperties" aiImportFileFromMemoryWithProperties ::
  Ptr CChar {-^ pBuffer -} ->
  CUInt {-^ length -} ->
  CUInt {-^ flags -} ->
  CString {-^ pHint -} ->
  Ptr AiPropertyStore {-^ pProps -} ->
  IO (Ptr AiScene)

foreign import ccall "aiApplyPostProcessing" aiApplyPostProcessing ::
  Ptr AiScene {-^ pScene -} ->
  CUInt {-^ flags -} ->
  IO (Ptr AiScene)

foreign import ccall "hs_aiGetPredefinedLogStream" hs_aiGetPredefinedLogStream ::
  AiDefaultLogStream {-^ stream -} ->
  CString {-^ file -} ->
  Ptr AiLogStream {-^ pOut -} ->
  IO ()

foreign import ccall "aiAttachLogStream" aiAttachLogStream ::
  Ptr AiLogStream {-^ stream -} ->
  IO ()

foreign import ccall "aiEnableVerboseLogging" aiEnableVerboseLogging :: AiBool -> IO ()

foreign import ccall "aiDetachLogStream" aiDetachLogStream ::
  Ptr AiLogStream {-^ stream -} ->
  IO AiReturn

foreign import ccall "aiDetachAllLogStreams" aiDetachAllLogStreams :: IO ()

foreign import ccall "aiReleaseImport" aiReleaseImport ::
  Ptr AiScene {-^ pScene -} ->
  IO ()

foreign import ccall "aiGetErrorString" aiGetErrorString :: IO CString

foreign import ccall "aiIsExtensionSupported" aiIsExtensionSupported ::
  CString {-^ szExtension -} ->
  IO AiBool

foreign import ccall "aiGetExtensionList" aiGetExtensionList ::
  Ptr AiString {-^ szOut -} ->
  IO ()

foreign import ccall "aiGetMemoryRequirements" aiGetMemoryRequirements ::
  Ptr AiScene {-^ pIn -} ->
  Ptr AiMemoryInfo {-^ POut -} ->
  IO ()

foreign import ccall "aiCreatePropertyStore" aiCreatePropertyStore :: IO (Ptr AiPropertyStore)

foreign import ccall "aiReleasePropertyStore" aiReleasePropertyStore :: Ptr AiPropertyStore -> IO ()

foreign import ccall "aiSetImportPropertyInteger" aiSetImportPropertyInteger ::
  Ptr AiPropertyStore {-^ store -} ->
  CString {-^ name -} ->
  CInt {-^ value -} ->
  IO ()

foreign import ccall "aiSetImportPropertyFloat" aiSetImportPropertyFloat ::
  Ptr AiPropertyStore {-^ store -} ->
  CString {-^ name -} ->
  AiReal {-^ value -} ->
  IO ()

foreign import ccall "aiSetImportPropertyString" aiSetImportPropertyString ::
  Ptr AiPropertyStore {-^ store -} ->
  CString {-^ name -} ->
  Ptr AiString {-^ value -} ->
  IO ()

foreign import ccall "aiSetImportPropertyMatrix" aiSetImportPropertyMatrix ::
  Ptr AiPropertyStore {-^ store -} ->
  CString {-^ name -} ->
  Ptr AiMatrix4x4 {-^ value -} ->
  IO ()

foreign import ccall "aiCreateQuaternionFromMatrix" aiCreateQuaternionFromMatrix ::
  Ptr AiQuaternion {-^ out -} ->
  Ptr AiMatrix3x3 {-^ mat -} ->
  IO ()

foreign import ccall "aiDecomposeMatrix" aiDecomposeMatrix ::
  Ptr AiMatrix4x4 {-^ mat -} ->
  Ptr AiVector3D {-^ scalingOut -} ->
  Ptr AiQuaternion {-^ rotationOut -} ->
  Ptr AiVector3D {-^ positionOut -} ->
  IO ()

foreign import ccall "aiTransposeMatrix4" aiTransposeMatrix4 :: Ptr AiMatrix4x4 -> IO ()

foreign import ccall "aiTransposeMatrix3" aiTransposeMatrix3 :: Ptr AiMatrix3x3 -> IO ()

foreign import ccall "aiTransformVecByMatrix3" aiTransformVecByMatrix3 :: Ptr AiVector3D -> Ptr AiMatrix3x3 -> IO ()

foreign import ccall "aiTransformVecByMatrix4" aiTransformVecByMatrix4 :: Ptr AiVector3D -> Ptr AiMatrix4x4 -> IO ()

foreign import ccall "aiMultiplyMatrix4" aiMultiplyMatrix4 ::
  Ptr AiMatrix4x4 {-^ dst -} ->
  Ptr AiMatrix4x4 {-^ src -} ->
  IO ()

foreign import ccall "aiMultiplyMatrix3" aiMultiplyMatrix3 ::
  Ptr AiMatrix3x3 {-^ dst -} ->
  Ptr AiMatrix3x3 {-^ src -} ->
  IO ()

foreign import ccall "aiIdentityMatrix3" aiIdentityMatrix3 :: Ptr AiMatrix3x3 -> IO ()

foreign import ccall "aiIdentityMatrix4" aiIdentityMatrix4 :: Ptr AiMatrix4x4 -> IO ()

foreign import ccall "getImportFormatCount" getImportFormatCount :: IO CSize

foreign import ccall "aiGetImportFormatDescription" aiGetImportFormatDescription ::
  CSize {-^ index -} ->
  IO (Ptr AiImporterDesc)
