#define THE_HEADER "assimp/cexport.h"
#include THE_HEADER

module Graphics.Formats.Assimp.CExport (
  AiExportFormatDesc,
  aiGetExportFormatCount,
  aiGetExportFormatDescription,
  aiReleaseExportFormatDescription,
  aiCopyScene,
  aiFreeScene,
  aiExportScene,
  aiExportSceneEx,
  AiExportDataBlob,
  aiExportSceneToBlob,
  aiReleaseExportBlob,
) where

import Data.Void
import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.CFileIO
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
#{importfunction_ aiFreeScene, ConstPtr AiScene -> IO ()} 
#{importfunction_ aiExportScene, ConstPtr AiScene -> ConstPtr CChar -> ConstPtr CChar -> CUInt -> IO ()} 
#{importfunction_ aiExportSceneEx, ConstPtr AiScene -> ConstPtr CChar -> ConstPtr CChar -> Ptr AiFileIO -> CUInt -> IO ()} 

#{cstruct struct aiExportDataBlob, AiExportDataBlob}
#{cstructfield struct aiExportDataBlob, AiExportDataBlob, size, CSize}
#{cstructfield struct aiExportDataBlob, AiExportDataBlob, data, Ptr Void}
#{cstructfield struct aiExportDataBlob, AiExportDataBlob, name, AiString}
#{cstructfield struct aiExportDataBlob, AiExportDataBlob, next, Ptr AiExportDataBlob}

#{importfunction_ aiExportSceneToBlob, ConstPtr AiScene -> ConstPtr CChar -> CUInt -> IO (ConstPtr AiExportDataBlob)}
#{importfunction_ aiReleaseExportBlob, ConstPtr AiExportDataBlob -> IO ()}
