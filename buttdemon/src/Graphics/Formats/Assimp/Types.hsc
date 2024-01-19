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
  aiReturn_SUCCESS, pattern AiReturn_SUCCESS,
  aiReturn_FAILURE, pattern AiReturn_FAILURE,
  aiReturn_OUTOFMEMORY, pattern AiReturn_OUTOFMEMORY,
  aiOrigin_SET, pattern AiOrigin_SET,
  aiOrigin_CUR, pattern AiOrigin_CUR,
  aiOrigin_END, pattern AiOrigin_END,
  aiDefaultLogStream_FILE, pattern AiDefaultLogStream_FILE,
  aiDefaultLogStream_STDOUT, pattern AiDefaultLogStream_STDOUT,
  aiDefaultLogStream_STDERR, pattern AiDefaultLogStream_STDERR,
  aiDefaultLogStream_DEBUGGER, pattern AiDefaultLogStream_DEBUGGER,
  AiMemoryInfo
) where

import Data.Int
import Data.Word
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

data AiPlane

instance Allocable AiPlane where
  sizeof = #{size struct aiPlane}
  alignof = #{alignment struct aiPlane}

instance Offset "a" AiPlane AiReal where offsetof = #{offset struct aiPlane, a}
instance Offset "b" AiPlane AiReal where offsetof = #{offset struct aiPlane, b}
instance Offset "c" AiPlane AiReal where offsetof = #{offset struct aiPlane, c}
instance Offset "d" AiPlane AiReal where offsetof = #{offset struct aiPlane, d}

data AiRay

instance Allocable AiRay where
  sizeof = #{size struct aiRay}
  alignof = #{alignment struct aiRay}

instance Offset "pos" AiRay AiVector3D where offsetof = #{offset struct aiRay, pos}
instance Offset "dir" AiRay AiVector3D where offsetof = #{offset struct aiRay, dir}

data AiColor3D

instance Allocable AiColor3D where
  sizeof = #{size struct aiColor3D}
  alignof = #{alignment struct aiColor3D}

instance Offset "r" AiColor3D AiReal where offsetof = #{offset struct aiColor3D, r}
instance Offset "g" AiColor3D AiReal where offsetof = #{offset struct aiColor3D, g}
instance Offset "b" AiColor3D AiReal where offsetof = #{offset struct aiColor3D, b}

data AiString

instance Allocable AiString where
  sizeof = #{size struct aiString}
  alignof = #{alignment struct aiString}

instance Offset "length" AiString AiUInt32 where offsetof = #{offset struct aiString, length}
instance Offset "data" AiString CChar where offsetof = #{offset struct aiString, data}

#{cint "aiReturn_SUCCESS", "aiReturn_SUCCESS", "AiReturn_SUCCESS"}
#{cint "aiReturn_FAILURE", "aiReturn_FAILURE", "AiReturn_FAILURE"}
#{cint "aiReturn_OUTOFMEMORY", "aiReturn_OUTOFMEMORY", "AiReturn_OUTOFMEMORY"}

#{cint "aiOrigin_SET", "aiOrigin_SET", "AiOrigin_SET"}
#{cint "aiOrigin_CUR", "aiOrigin_CUR", "AiOrigin_CUR"}
#{cint "aiOrigin_END", "aiOrigin_END", "AiOrigin_END"}

#{cint "aiDefaultLogStream_FILE", "aiDefaultLogStream_FILE", "AiDefaultLogStream_FILE"}
#{cint "aiDefaultLogStream_STDOUT", "aiDefaultLogStream_STDOUT", "AiDefaultLogStream_STDOUT"}
#{cint "aiDefaultLogStream_STDERR", "aiDefaultLogStream_STDERR", "AiDefaultLogStream_STDERR"}
#{cint "aiDefaultLogStream_DEBUGGER", "aiDefaultLogStream_DEBUGGER", "AiDefaultLogStream_DEBUGGER"}

data AiMemoryInfo

instance Allocable AiMemoryInfo where
  sizeof = #{size struct aiMemoryInfo}
  alignof = #{alignment struct aiMemoryInfo}

instance Offset "textures" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, textures}
instance Offset "materials" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, materials}
instance Offset "meshes" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, meshes}
instance Offset "nodes" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, nodes}
instance Offset "animations" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, animations}
instance Offset "cameras" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, cameras}
instance Offset "lights" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, lights}
instance Offset "total" AiMemoryInfo CUInt where offsetof = #{offset struct aiMemoryInfo, total}
