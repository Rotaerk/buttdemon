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
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.Scene
import Graphics.Formats.Assimp.Types

#{cstruct struct aiExportFormatDesc, AiExportFormatDesc}
#{cstructfield struct aiExportFormatDesc, AiExportFormatDesc, id, CString}
#{cstructfield struct aiExportFormatDesc, AiExportFormatDesc, description, CString}
#{cstructfield struct aiExportFormatDesc, AiExportFormatDesc, fileExtension, CString}

#{importfunction_ aiGetExportFormatCount, IO CSize} 
#{importfunction_ aiGetExportFormatDescription, CSize -> IO (ConstPtr AiExportFormatDesc)} 
#{importfunction_ aiReleaseExportFormatDescription, ConstPtr AiExportFormatDesc -> IO ()} 
#{importfunction_ aiCopyScene, ConstPtr AiScene -> Ptr (Ptr AiScene) -> IO ()} 
