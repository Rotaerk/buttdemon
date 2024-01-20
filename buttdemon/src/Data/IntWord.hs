-- Many modules will use Int or Word types in a platform-specific manner,
-- so we need to import both Int and Word into them. However, on a given
-- platform, they will only use one of them.  This results in an
-- unused-import warning. Importing this module instead addresses that.
-- (It's also a slight convenience over having to import both modules
-- everywhere.)
module Data.IntWord (
  module Data.Int,
  module Data.Word
) where

import Data.Int
import Data.Word
