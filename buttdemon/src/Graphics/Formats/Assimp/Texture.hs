{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Texture where

import Graphics.Formats.Assimp.Types
import Foreign.C.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

data AiTexel =
  AiTexel {
    aiTexel'b :: CUChar,
    aiTexel'g :: CUChar,
    aiTexel'r :: CUChar,
    aiTexel'a :: CUChar
  }
  deriving (Generic)
instance PrimBytes AiTexel

data AiTexture =
  AiTexture {
    aiTexture'width :: CUInt,
    aiTexture'height :: CUInt,
    aiTexture'formatHint :: Vector CChar 9,
    aiTexture'data :: Ptr AiTexel,
    aiTexture'filename :: AiString
  }
  deriving (Generic)
instance PrimBytes AiTexture
