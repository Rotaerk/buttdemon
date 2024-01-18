module Foreign.Allocable (
  Allocable(..),
  withAlloc,
  alloc
) where

import Foreign.Marshal.Alloc
import Foreign.Ptr

class Allocable a where
  sizeof :: Int
  alignof :: Int

withAlloc :: forall a b. Allocable a => (Ptr a -> IO b) -> IO b
withAlloc = allocaBytesAligned (sizeof @a) (alignof @a)

alloc :: forall a. Allocable a => IO (Ptr a)
alloc = mallocBytes (sizeof @a)
