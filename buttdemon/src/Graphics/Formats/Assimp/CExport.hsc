#define THE_HEADER "assimp/cexport.h"
#include THE_HEADER

module Graphics.Formats.Assimp.CExport (
  AiExportFormatDesc,
  aiGetExportFormatCount,
  aiGetExportFormatDescription,
  aiReleaseExportFormatDescription
) where

import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Types

data AiExportFormatDesc

instance Allocable AiExportFormatDesc where
  sizeof = #{size struct aiExportFormatDesc}
  alignof = #{alignment struct aiExportFormatDesc}

instance Offset "id" AiExportFormatDesc CString where offsetof = #{offset struct aiExportFormatDesc, id}
instance Offset "description" AiExportFormatDesc CString where offsetof = #{offset struct aiExportFormatDesc, description}
instance Offset "fileExtension" AiExportFormatDesc CString where offsetof = #{offset struct aiExportFormatDesc, fileExtension}

#{importfunction_ "aiGetExportFormatCount", "IO CSize"} 
#{importfunction_ "aiGetExportFormatDescription", "CSize -> IO (ConstPtr AiExportFormatDesc)"} 
#{importfunction_ "aiReleaseExportFormatDescription", "ConstPtr AiExportFormatDesc -> IO ()"} 
-- #{importfunction_ "aiCopyScene", "ConstPtr AiScene -> Ptr (Ptr AiScene) -> IO ()"} 
