#define THE_HEADER "assimp/types.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Types (
  module Graphics.Formats.Assimp.Defs,
  module Graphics.Formats.Assimp.Vector2D,
  module Graphics.Formats.Assimp.Vector3D,
  module Graphics.Formats.Assimp.Color4D,
  module Graphics.Formats.Assimp.Matrix3x3,
  module Graphics.Formats.Assimp.Matrix4x4,
  module Graphics.Formats.Assimp.Quaternion,
  AiInt32,
  AiUInt32,
  AiPlane,
  AiRay,
  AiColor3D,
  AiString,
  AiReturn(..),
  aiReturn_SUCCESS, pattern AiReturn_SUCCESS,
  aiReturn_FAILURE, pattern AiReturn_FAILURE,
  aiReturn_OUTOFMEMORY, pattern AiReturn_OUTOFMEMORY,
  AiOrigin(..),
  aiOrigin_SET, pattern AiOrigin_SET,
  aiOrigin_CUR, pattern AiOrigin_CUR,
  aiOrigin_END, pattern AiOrigin_END,
  AiDefaultLogStream(..),
  aiDefaultLogStream_FILE, pattern AiDefaultLogStream_FILE,
  aiDefaultLogStream_STDOUT, pattern AiDefaultLogStream_STDOUT,
  aiDefaultLogStream_STDERR, pattern AiDefaultLogStream_STDERR,
  aiDefaultLogStream_DEBUGGER, pattern AiDefaultLogStream_DEBUGGER,
  AiMemoryInfo
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Graphics.Formats.Assimp.Defs
import Graphics.Formats.Assimp.Vector2D
import Graphics.Formats.Assimp.Vector3D
import Graphics.Formats.Assimp.Color4D
import Graphics.Formats.Assimp.Matrix3x3
import Graphics.Formats.Assimp.Matrix4x4
import Graphics.Formats.Assimp.Quaternion

type AiInt32 = Int32
type AiUInt32 = Word32

#{cstruct struct aiPlane, AiPlane}
#{cstructfield struct aiPlane, AiPlane, a, AiReal}
#{cstructfield struct aiPlane, AiPlane, b, AiReal}
#{cstructfield struct aiPlane, AiPlane, c, AiReal}
#{cstructfield struct aiPlane, AiPlane, d, AiReal}

#{cstruct struct aiRay, AiRay}
#{cstructfield struct aiRay, AiRay, pos, AiVector3D}
#{cstructfield struct aiRay, AiRay, dir, AiVector3D}

#{cstruct struct aiColor3D, AiColor3D}
#{cstructfield struct aiColor3D, AiColor3D, r, AiReal}
#{cstructfield struct aiColor3D, AiColor3D, g, AiReal}
#{cstructfield struct aiColor3D, AiColor3D, b, AiReal}

#{cstruct struct aiString, AiString}
#{cstructfield struct aiString, AiString, length, AiUInt32}
#{cstructfield struct aiString, AiString, data, CChar}

#{cenum enum aiReturn, AiReturn}
#{cenumerant_ AiReturn, aiReturn_SUCCESS, AiReturn_SUCCESS}
#{cenumerant_ AiReturn, aiReturn_FAILURE, AiReturn_FAILURE}
#{cenumerant_ AiReturn, aiReturn_OUTOFMEMORY, AiReturn_OUTOFMEMORY}

#{cenum enum aiOrigin, AiOrigin}
#{cenumerant_ AiOrigin, aiOrigin_SET, AiOrigin_SET}
#{cenumerant_ AiOrigin, aiOrigin_CUR, AiOrigin_CUR}
#{cenumerant_ AiOrigin, aiOrigin_END, AiOrigin_END}

#{cenum enum aiDefaultLogStream, AiDefaultLogStream}
#{cenumerant_ AiDefaultLogStream, aiDefaultLogStream_FILE, AiDefaultLogStream_FILE}
#{cenumerant_ AiDefaultLogStream, aiDefaultLogStream_STDOUT, AiDefaultLogStream_STDOUT}
#{cenumerant_ AiDefaultLogStream, aiDefaultLogStream_STDERR, AiDefaultLogStream_STDERR}
#{cenumerant_ AiDefaultLogStream, aiDefaultLogStream_DEBUGGER, AiDefaultLogStream_DEBUGGER}

#{cstruct struct aiMemoryInfo, AiMemoryInfo}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, textures, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, materials, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, meshes, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, nodes, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, animations, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, cameras, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, lights, CUInt}
#{cstructfield struct aiMemoryInfo, AiMemoryInfo, total, CUInt}
