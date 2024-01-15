{-# LANGUAGE MagicHash #-}

#include <assimp/config.h>

module Graphics.Formats.Assimp.Config
--(
--  c_AI_CONFIG_GLOB_MEASURE_TIME
--)
where

import Foreign.C.String
import Foreign.C.Types
import GHC.Ptr

pattern AI_CONFIG_GLOB_MEASURE_TIME :: CString
pattern AI_CONFIG_GLOB_MEASURE_TIME <- (const False -> True)
  where AI_CONFIG_GLOB_MEASURE_TIME = Ptr #{const_str AI_CONFIG_GLOB_MEASURE_TIME}##

pattern AI_UVTRAFO_SCALING :: (Eq a, Num a) => a
pattern AI_UVTRAFO_SCALING = #{const AI_UVTRAFO_SCALING}

pattern AI_UVTRAFO_ROTATION :: (Eq a, Num a) => a
pattern AI_UVTRAFO_ROTATION = #{const AI_UVTRAFO_ROTATION}

pattern AI_UVTRAFO_TRANSLATION :: (Eq a, Num a) => a
pattern AI_UVTRAFO_TRANSLATION = #{const AI_UVTRAFO_TRANSLATION}

pattern AI_UVTRAFO_ALL :: (Eq a, Num a) => a
pattern AI_UVTRAFO_ALL = #{const AI_UVTRAFO_ALL}
