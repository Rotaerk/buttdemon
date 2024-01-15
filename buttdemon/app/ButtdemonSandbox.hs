module Main where

--import Control.Monad
--import Data.Bits
--import Foreign.C.String
--import Foreign.C.Types
--import Foreign.Ptr

--import Graphics.Formats.Assimp.Config
--import Graphics.Formats.Assimp.PostProcess
--import Graphics.Formats.Assimp.Scene
--import Graphics.Formats.Assimp.Import

main :: IO ()
main = do
  putStrLn "Buttdemon"
--  putStrLn $ show c_AI_CONFIG_GLOB_MEASURE_TIME
--  putStrLn $ show c_AI_UVTRAFO_SCALING

{-
oldtest :: IO ()
oldtest =
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
-}
