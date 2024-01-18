module Foreign.Offset (
  Offset(..),
  offset
) where

import Foreign.Ptr
import GHC.TypeLits

class Offset (x :: Symbol) r a | x r -> a where
  offsetof :: Int

offset :: forall x r a. Offset x r a => Ptr r -> Ptr a
offset = castPtr . flip plusPtr (offsetof @x @r)
