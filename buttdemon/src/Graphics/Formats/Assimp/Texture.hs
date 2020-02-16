{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.Formats.Assimp.Texture where

import Data.Int
import Data.Word
import Graphics.Formats.Assimp.Types
import Foreign.Ptr
import GHC.Generics
import Numeric.DataFrame

data AiTexel =
  AiTexel {
    aiTexel'b :: Word8,
    aiTexel'g :: Word8,
    aiTexel'r :: Word8,
    aiTexel'a :: Word8
  }
  deriving (Generic)
instance PrimBytes AiTexel

data AiTexture =
  AiTexture {
    aiTexture'width :: Word32,
    aiTexture'height :: Word32,
    aiTexture'formatHint :: Vector Int8 9,
    aiTexture'data :: Ptr AiTexel,
    aiTexture'filename :: AiString
  }
  deriving (Generic)
instance PrimBytes AiTexture
