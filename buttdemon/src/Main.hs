{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import Control.Monad
import Data.Bits
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import Numeric.PrimBytes

import Graphics.Formats.Assimp.PostProcess
import Graphics.Formats.Assimp.Scene

main :: IO ()
main =
  withCString "assets/treasure_smooth.dae" $ \filePathCString -> do
    scenePtr <-
      aiImportFile filePathCString $
      aiProcess_FlipWindingOrder .|.
      aiProcess_Triangulate .|.
      aiProcess_PreTransformVertices .|.
      aiProcess_CalcTangentSpace .|.
      aiProcess_GenSmoothNormals

    when (scenePtr == nullPtr) $ error "Error: null scene"

    scene <- bPeek scenePtr

    numMeshes <- bPeekByteOff @CUInt scenePtr $ bFieldOffsetOf @"aiScene'numMeshes" (undefined :: AiScene)

    print numMeshes

    print scene

    aiReleaseImport scenePtr

data AiFileIO
data AiLogStream
data AiPropertyStore

foreign import ccall "aiImportFile" aiImportFile ::
  CString {-^ file -} ->
  AiPostProcessSteps {-^ flags -} ->
  IO (Ptr AiScene)

foreign import ccall "aiReleaseImport" aiReleaseImport ::
  Ptr AiScene {-^ scene -} ->
  IO ()

foreign import ccall "aiImportFileEx" aiImportFileEx ::
  CString {-^ file -} ->
  AiPostProcessSteps {-^ flags -} ->
  Ptr AiFileIO {-^ FS -} ->
  Ptr AiScene

foreign import ccall "aiImportFileExWithProperties" aiImportFileExWithProperties ::
  CString {-^ file -} ->
  AiPostProcessSteps {-^ flags -} ->
  Ptr AiFileIO {-^ FS -} ->
  Ptr AiPropertyStore {-^ props -} ->
  Ptr AiScene

foreign import ccall "aiImportFileFromMemory" aiImportFileFromMemory ::
  CString {-^ buffer -} ->
  CUInt {-^ length -} ->
  AiPostProcessSteps {-^ flags -} ->
  CString {-^ hint -} ->
  Ptr AiScene

foreign import ccall "aiImportFileFromMemoryWithProperties" aiImportFileFromMemoryWithProperties ::
  CString {-^ buffer -} ->
  CUInt {-^ length -} ->
  AiPostProcessSteps {-^ flags -} ->
  CString {-^ hint -} ->
  Ptr AiPropertyStore {-^ props -} ->
  Ptr AiScene

foreign import ccall "aiApplyPostProcessing" aiApplyPostProcessing ::
  Ptr AiScene {-^ scene -} ->
  AiPostProcessSteps {-^ flags -} ->
  Ptr AiScene

-- In order to import this, I need to write a wrapper in C with the signature:
-- void aiGetPredefinedLogStream_wrapper(C_ENUM aiDefaultLogStream defaultStream, const char* file, C_STRUCT aiLogStream* outStream)
{-
foreign import ccall "aiGetPredefinedLogStream_wrapper" aiGetPredefinedLogStream ::
  AiDefaultLogStream {-^ streams -} ->
  Ptr CChar {-^ file -} ->
  Ptr AiLogStream
-}
