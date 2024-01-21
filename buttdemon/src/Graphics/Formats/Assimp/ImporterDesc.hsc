#define THE_HEADER "assimp/importerdesc.h"
#include THE_HEADER

module Graphics.Formats.Assimp.ImporterDesc (
  AiImporterFlags(..),
  aiImporterFlags_SupportTextFlavour, pattern AiImporterFlags_SupportTextFlavour,
  aiImporterFlags_SupportBinaryFlavour, pattern AiImporterFlags_SupportBinaryFlavour,
  aiImporterFlags_SupportCompressedFlavour, pattern AiImporterFlags_SupportCompressedFlavour,
  aiImporterFlags_LimitedSupport, pattern AiImporterFlags_LimitedSupport,
  aiImporterFlags_Experimental, pattern AiImporterFlags_Experimental,
  AiImporterDesc,
  aiGetImporterDesc,
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.Types
import Foreign.Offset

#{cenum enum aiImporterFlags, AiImporterFlags}
#{cenumerant_ AiImporterFlags, aiImporterFlags_SupportTextFlavour, AiImporterFlags_SupportTextFlavour}
#{cenumerant_ AiImporterFlags, aiImporterFlags_SupportBinaryFlavour, AiImporterFlags_SupportBinaryFlavour}
#{cenumerant_ AiImporterFlags, aiImporterFlags_SupportCompressedFlavour, AiImporterFlags_SupportCompressedFlavour}
#{cenumerant_ AiImporterFlags, aiImporterFlags_LimitedSupport, AiImporterFlags_LimitedSupport}
#{cenumerant_ AiImporterFlags, aiImporterFlags_Experimental, AiImporterFlags_Experimental}

#{cstruct struct aiImporterDesc, AiImporterDesc}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mName, ConstPtr CChar}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mAuthor, ConstPtr CChar}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mMaintainer, ConstPtr CChar}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mComments, ConstPtr CChar}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mFlags, CUInt}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mMinMajor, CUInt}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mMinMinor, CUInt}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mMaxMajor, CUInt}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mMaxMinor, CUInt}
#{cstructfield struct aiImporterDesc, AiImporterDesc, mFileExtensions, ConstPtr CChar}

#{importfunction_ aiGetImporterDesc, ConstPtr CChar -> IO (ConstPtr AiImporterDesc)}
