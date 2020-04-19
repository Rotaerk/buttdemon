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
import Graphics.Formats.Assimp.Import

main :: IO ()
main =
  withCString "assets/treasure_smooth.dae" $ \filePathCString -> do
    scenePtr <-
      aiImportFile filePathCString $
      AiProcess_FlipWindingOrder .|.
      AiProcess_Triangulate .|.
      AiProcess_PreTransformVertices .|.
      AiProcess_CalcTangentSpace .|.
      AiProcess_GenSmoothNormals

    when (scenePtr == nullPtr) $ error "Error: null scene"

    scene <- bPeek scenePtr

    numMeshes <- bPeekByteOff @CUInt scenePtr $ bFieldOffsetOf @"aiScene'numMeshes" (undefined :: AiScene)

    print numMeshes

    print scene

    aiReleaseImport scenePtr
