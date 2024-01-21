#define THE_HEADER "assimp/version.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Version (
  aiGetLegalString,
  aiGetVersionPatch,
  aiGetVersionMinor,
  aiGetVersionMajor,
  aiGetVersionRevision,
  aiGetBranchName,
  assimpCflagsShared, pattern AssimpCflagsShared,
  assimpCflagsStlport, pattern AssimpCflagsStlport,
  assimpCflagsDebug, pattern AssimpCflagsDebug,
  assimpCflagsNoboost, pattern AssimpCflagsNoboost,
  assimpCflagsSinglethreaded, pattern AssimpCflagsSinglethreaded,
  assimpCflagsDoubleSupport, pattern AssimpCflagsDoubleSupport,
  aiGetCompileFlags,
) where

import Foreign.C.ConstPtr
import Foreign.C.Types

#{importfunction_ aiGetLegalString, IO (ConstPtr CChar)}
#{importfunction_ aiGetVersionPatch, IO CUInt}
#{importfunction_ aiGetVersionMinor, IO CUInt}
#{importfunction_ aiGetVersionMajor, IO CUInt}
#{importfunction_ aiGetVersionRevision, IO CUInt}
#{importfunction_ aiGetBranchName, IO (ConstPtr CChar)}

#{cint ASSIMP_CFLAGS_SHARED, assimpCflagsShared, AssimpCflagsShared}
#{cint ASSIMP_CFLAGS_STLPORT, assimpCflagsStlport, AssimpCflagsStlport}
#{cint ASSIMP_CFLAGS_DEBUG, assimpCflagsDebug, AssimpCflagsDebug}
#{cint ASSIMP_CFLAGS_NOBOOST, assimpCflagsNoboost, AssimpCflagsNoboost}
#{cint ASSIMP_CFLAGS_SINGLETHREADED, assimpCflagsSinglethreaded, AssimpCflagsSinglethreaded}
#{cint ASSIMP_CFLAGS_DOUBLE_SUPPORT, assimpCflagsDoubleSupport, AssimpCflagsDoubleSupport}

#{importfunction_ aiGetCompileFlags, IO CUInt}
