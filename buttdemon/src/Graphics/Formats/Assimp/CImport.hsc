#define THE_HEADER "assimp/cimport_wrapper.h"
#include THE_HEADER

module Graphics.Formats.Assimp.CImport (
  AiLogStreamCallbackType,
  AiLogStreamCallback,
  AiLogStream,
  AiPropertyStore,
  AiBool,
  aiFalse, pattern AiFalse,
  aiTrue, pattern AiTrue,
  aiImportFile,
  aiImportFileEx,
  aiImportFileExWithProperties,
  aiImportFileFromMemory,
  aiImportFileFromMemoryWithProperties,
  aiApplyPostProcessing,
  aiGetPredefinedLogStream,
  aiAttachLogStream,
  aiEnableVerboseLogging,
  aiDetachLogStream,
  aiDetachAllLogStreams,
  aiReleaseImport,
  aiGetErrorString,
  aiIsExtensionSupported,
  aiGetExtensionList,
  aiGetMemoryRequirements,
  aiCreatePropertyStore,
  aiReleasePropertyStore,
  aiSetImportPropertyInteger,
  aiSetImportPropertyFloat,
  aiSetImportPropertyString,
  aiSetImportPropertyMatrix,
  aiCreateQuaternionFromMatrix,
  aiDecomposeMatrix,
  aiTransposeMatrix4,
  aiTransposeMatrix3,
  aiTransformVecByMatrix3,
  aiTransformVecByMatrix4,
  aiMultiplyMatrix4,
  aiMultiplyMatrix3,
  aiIdentityMatrix3,
  aiIdentityMatrix4,
  aiGetImportFormatCount,
  aiGetImportFormatDescription,
  aiVector2AreEqual,
  aiVector2AreEqualEpsilon,
  aiVector2Add,
  aiVector2Subtract,
  aiVector2Scale,
  aiVector2SymMul,
  aiVector2DivideByScalar,
  aiVector2DivideByVector,
  aiVector2Length,
  aiVector2SquareLength,
  aiVector2Negate,
  aiVector2DotProduct,
  aiVector2Normalize,
  aiVector3AreEqual,
  aiVector3AreEqualEpsilon,
  aiVector3LessThan,
  aiVector3Add,
  aiVector3Subtract,
  aiVector3Scale,
  aiVector3SymMul,
  aiVector3DivideByScalar,
  aiVector3DivideByVector,
  aiVector3Length,
  aiVector3SquareLength,
  aiVector3Negate,
  aiVector3DotProduct,
  aiVector3CrossProduct,
  aiVector3Normalize,
  aiVector3NormalizeSafe,
  aiVector3RotateByQuaternion,
  aiMatrix3FromMatrix4,
  aiMatrix3FromQuaternion,
  aiMatrix3AreEqual,
  aiMatrix3AreEqualEpsilon,
  aiMatrix3Inverse,
  aiMatrix3Determinant,
  aiMatrix3RotationZ,
  aiMatrix3FromRotationAroundAxis,
  aiMatrix3Translation,
  aiMatrix3FromTo,
  aiMatrix4FromMatrix3,
  aiMatrix4FromScalingQuaternionPosition,
  aiMatrix4Add,
  aiMatrix4AreEqual,
  aiMatrix4AreEqualEpsilon,
  aiMatrix4Inverse,
  aiMatrix4Determinant,
  aiMatrix4IsIdentity,
  aiMatrix4DecomposeIntoScalingEulerAnglesPosition,
  aiMatrix4DecomposeIntoScalingAxisAnglePosition,
  aiMatrix4DecomposeNoScaling,
  aiMatrix4FromEulerAngles,
  aiMatrix4RotationX,
  aiMatrix4RotationY,
  aiMatrix4RotationZ,
  aiMatrix4FromRotationAroundAxis,
  aiMatrix4Translation,
  aiMatrix4Scaling,
  aiMatrix4FromTo,
  aiQuaternionFromEulerAngles,
  aiQuaternionFromAxisAngle,
  aiQuaternionFromNormalizedQuaternion,
  aiQuaternionAreEqual,
  aiQuaternionAreEqualEpsilon,
  aiQuaternionNormalize,
  aiQuaternionConjugate,
  aiQuaternionMultiply,
  aiQuaternionInterpolate,
) where

import Foreign.Allocable
import Foreign.C.ConstPtr
import Foreign.C.String
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.CFileIO
import Graphics.Formats.Assimp.ImporterDesc
import Graphics.Formats.Assimp.Scene
import Graphics.Formats.Assimp.Types

type AiLogStreamCallbackType = ConstPtr CChar -> CString -> IO ()
type AiLogStreamCallback = FunPtr AiLogStreamCallbackType

#{cstruct struct aiLogStream, AiLogStream}
#{cstructfield struct aiLogStream, AiLogStream, callback, AiLogStreamCallback}
#{cstructfield struct aiLogStream, AiLogStream, user, CString}

#{cstruct struct aiPropertyStore, AiPropertyStore}
#{cstructfield struct aiPropertyStore, AiPropertyStore, sentinel, CChar}

type AiBool = CInt
#{cint AI_FALSE, aiFalse, AiFalse}
#{cint AI_TRUE, aiTrue, AiTrue}

#{importfunction_ aiImportFile, ConstPtr CChar -> CUInt -> IO (ConstPtr AiScene)}
#{importfunction_ aiImportFileEx, ConstPtr CChar -> CUInt -> Ptr AiFileIO -> IO (ConstPtr AiScene)}
#{importfunction_ aiImportFileExWithProperties, ConstPtr CChar -> CUInt -> Ptr AiFileIO -> ConstPtr AiPropertyStore -> IO (ConstPtr AiScene)}
#{importfunction_ aiImportFileFromMemory, ConstPtr CChar -> CUInt -> CUInt -> ConstPtr CChar -> IO (ConstPtr AiScene)}
#{importfunction_ aiImportFileFromMemoryWithProperties, ConstPtr CChar -> CUInt -> CUInt -> ConstPtr CChar -> ConstPtr AiPropertyStore -> IO (ConstPtr AiScene)}
#{importfunction_ aiApplyPostProcessing, ConstPtr AiScene -> CUInt -> IO (ConstPtr AiScene)}
#{importfunction aiGetPredefinedLogStream_wrapped, aiGetPredefinedLogStream, AiDefaultLogStream -> ConstPtr CChar -> Ptr AiLogStream -> IO ()}
#{importfunction_ aiAttachLogStream, ConstPtr AiLogStream -> IO ()}
#{importfunction_ aiEnableVerboseLogging, AiBool -> IO ()}
#{importfunction_ aiDetachLogStream, ConstPtr AiLogStream -> IO AiReturn}
#{importfunction_ aiDetachAllLogStreams, IO ()}
#{importfunction_ aiReleaseImport, ConstPtr AiScene -> IO ()}
#{importfunction_ aiGetErrorString, IO (ConstPtr CChar)}
#{importfunction_ aiIsExtensionSupported, ConstPtr CChar -> IO AiBool}
#{importfunction_ aiGetExtensionList, Ptr AiString -> IO ()}
#{importfunction_ aiGetMemoryRequirements, ConstPtr AiScene -> Ptr AiMemoryInfo -> IO ()}
#{importfunction_ aiCreatePropertyStore, IO (Ptr AiPropertyStore)}
#{importfunction_ aiReleasePropertyStore, Ptr AiPropertyStore -> IO ()}
#{importfunction_ aiSetImportPropertyInteger, Ptr AiPropertyStore -> ConstPtr CChar -> CInt -> IO ()}
#{importfunction_ aiSetImportPropertyFloat, Ptr AiPropertyStore -> ConstPtr CChar -> AiReal -> IO ()}
#{importfunction_ aiSetImportPropertyString, Ptr AiPropertyStore -> ConstPtr CChar -> ConstPtr AiString -> IO ()}
#{importfunction_ aiSetImportPropertyMatrix, Ptr AiPropertyStore -> ConstPtr CChar -> ConstPtr AiMatrix4x4 -> IO ()}
#{importfunction_ aiCreateQuaternionFromMatrix, Ptr AiQuaternion -> ConstPtr AiMatrix3x3 -> IO ()}
#{importfunction_ aiDecomposeMatrix, ConstPtr AiMatrix4x4 -> Ptr AiVector3D -> Ptr AiQuaternion -> Ptr AiVector3D -> IO ()}
#{importfunction_ aiTransposeMatrix4, Ptr AiMatrix4x4 -> IO ()}
#{importfunction_ aiTransposeMatrix3, Ptr AiMatrix3x3 -> IO ()}
#{importfunction_ aiTransformVecByMatrix3, Ptr AiVector3D -> ConstPtr AiMatrix3x3 -> IO ()}
#{importfunction_ aiTransformVecByMatrix4, Ptr AiVector3D -> ConstPtr AiMatrix4x4 -> IO ()}
#{importfunction_ aiMultiplyMatrix4, Ptr AiMatrix4x4 -> ConstPtr AiMatrix4x4 -> IO ()}
#{importfunction_ aiMultiplyMatrix3, Ptr AiMatrix3x3 -> ConstPtr AiMatrix3x3 -> IO ()}
#{importfunction_ aiIdentityMatrix3, Ptr AiMatrix3x3 -> IO ()}
#{importfunction_ aiIdentityMatrix4, Ptr AiMatrix4x4 -> IO ()}
#{importfunction_ aiGetImportFormatCount, IO CSize}
#{importfunction_ aiGetImportFormatDescription, CSize -> IO (ConstPtr AiImporterDesc)}

#{importfunction_ aiVector2AreEqual, ConstPtr AiVector2D -> ConstPtr AiVector2D -> IO CInt}
#{importfunction_ aiVector2AreEqualEpsilon, ConstPtr AiVector2D -> ConstPtr AiVector2D -> CFloat -> IO CInt}
#{importfunction_ aiVector2Add, Ptr AiVector2D -> ConstPtr AiVector2D -> IO ()}
#{importfunction_ aiVector2Subtract, Ptr AiVector2D -> ConstPtr AiVector2D -> IO ()}
#{importfunction_ aiVector2Scale, Ptr AiVector2D -> CFloat -> IO ()}
#{importfunction_ aiVector2SymMul, Ptr AiVector2D -> ConstPtr AiVector2D -> IO ()}
#{importfunction_ aiVector2DivideByScalar, Ptr AiVector2D -> CFloat -> IO ()}
#{importfunction_ aiVector2DivideByVector, Ptr AiVector2D -> Ptr AiVector2D -> IO ()}
#{importfunction_ aiVector2Length, ConstPtr AiVector2D -> IO CFloat}
#{importfunction_ aiVector2SquareLength, ConstPtr AiVector2D -> IO CFloat}
#{importfunction_ aiVector2Negate, Ptr AiVector2D -> IO ()}
#{importfunction_ aiVector2DotProduct, ConstPtr AiVector2D -> ConstPtr AiVector2D -> IO CFloat}
#{importfunction_ aiVector2Normalize, Ptr AiVector2D -> IO ()}

#{importfunction_ aiVector3AreEqual, ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO CInt}
#{importfunction_ aiVector3AreEqualEpsilon, ConstPtr AiVector3D -> ConstPtr AiVector3D -> CFloat -> IO CInt}
#{importfunction_ aiVector3LessThan, ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO CInt}
#{importfunction_ aiVector3Add, Ptr AiVector3D -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiVector3Subtract, Ptr AiVector3D -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiVector3Scale, Ptr AiVector3D -> CFloat -> IO ()}
#{importfunction_ aiVector3SymMul, Ptr AiVector3D -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiVector3DivideByScalar, Ptr AiVector3D -> CFloat -> IO ()}
#{importfunction_ aiVector3DivideByVector, Ptr AiVector3D -> Ptr AiVector3D -> IO ()}
#{importfunction_ aiVector3Length, ConstPtr AiVector3D -> IO CFloat}
#{importfunction_ aiVector3SquareLength, ConstPtr AiVector3D -> IO CFloat}
#{importfunction_ aiVector3Negate, Ptr AiVector3D -> IO ()}
#{importfunction_ aiVector3DotProduct, ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO CFloat}
#{importfunction_ aiVector3CrossProduct, Ptr AiVector3D -> ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiVector3Normalize, Ptr AiVector3D -> IO ()}
#{importfunction_ aiVector3NormalizeSafe, Ptr AiVector3D -> IO ()}
#{importfunction_ aiVector3RotateByQuaternion, Ptr AiVector3D -> ConstPtr AiQuaternion -> IO ()}

#{importfunction_ aiMatrix3FromMatrix4, Ptr AiMatrix3x3 -> ConstPtr AiMatrix4x4 -> IO ()}
#{importfunction_ aiMatrix3FromQuaternion, Ptr AiMatrix3x3 -> ConstPtr AiQuaternion -> IO ()}
#{importfunction_ aiMatrix3AreEqual, ConstPtr AiMatrix3x3 -> ConstPtr AiMatrix3x3 -> IO CInt}
#{importfunction_ aiMatrix3AreEqualEpsilon, ConstPtr AiMatrix3x3 -> ConstPtr AiMatrix3x3 -> CFloat -> IO CInt}
#{importfunction_ aiMatrix3Inverse, Ptr AiMatrix3x3 -> IO ()}
#{importfunction_ aiMatrix3Determinant, ConstPtr AiMatrix3x3 -> IO CFloat}
#{importfunction_ aiMatrix3RotationZ, Ptr AiMatrix3x3 -> CFloat -> IO ()}
#{importfunction_ aiMatrix3FromRotationAroundAxis, Ptr AiMatrix3x3 -> ConstPtr AiVector3D -> CFloat -> IO ()}
#{importfunction_ aiMatrix3Translation, Ptr AiMatrix3x3 -> ConstPtr AiVector2D -> IO ()}
#{importfunction_ aiMatrix3FromTo, Ptr AiMatrix3x3 -> ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO ()}

#{importfunction_ aiMatrix4FromMatrix3, Ptr AiMatrix4x4 -> ConstPtr AiMatrix3x3 -> IO ()}
#{importfunction_ aiMatrix4FromScalingQuaternionPosition, Ptr AiMatrix4x4 -> ConstPtr AiVector3D -> ConstPtr AiQuaternion -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4Add, Ptr AiMatrix4x4 -> ConstPtr AiMatrix4x4 -> IO ()}
#{importfunction_ aiMatrix4AreEqual, ConstPtr AiMatrix4x4 -> ConstPtr AiMatrix4x4 -> IO CInt}
#{importfunction_ aiMatrix4AreEqualEpsilon, ConstPtr AiMatrix4x4 -> ConstPtr AiMatrix4x4 -> CFloat -> IO CInt}
#{importfunction_ aiMatrix4Inverse, Ptr AiMatrix4x4 -> IO ()}
#{importfunction_ aiMatrix4Determinant, ConstPtr AiMatrix4x4 -> IO CFloat}
#{importfunction_ aiMatrix4IsIdentity, ConstPtr AiMatrix4x4 -> IO CInt}
#{importfunction_ aiMatrix4DecomposeIntoScalingEulerAnglesPosition, ConstPtr AiMatrix4x4 -> Ptr AiVector3D -> Ptr AiVector3D -> Ptr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4DecomposeIntoScalingAxisAnglePosition, ConstPtr AiMatrix4x4 -> Ptr AiVector3D -> Ptr AiVector3D -> Ptr AiReal -> Ptr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4DecomposeNoScaling, ConstPtr AiMatrix4x4 -> Ptr AiQuaternion -> Ptr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4FromEulerAngles, Ptr AiMatrix4x4 -> CFloat -> CFloat -> CFloat -> IO ()}
#{importfunction_ aiMatrix4RotationX, Ptr AiMatrix4x4 -> CFloat -> IO ()}
#{importfunction_ aiMatrix4RotationY, Ptr AiMatrix4x4 -> CFloat -> IO ()}
#{importfunction_ aiMatrix4RotationZ, Ptr AiMatrix4x4 -> CFloat -> IO ()}
#{importfunction_ aiMatrix4FromRotationAroundAxis, Ptr AiMatrix4x4 -> ConstPtr AiVector3D -> CFloat -> IO ()}
#{importfunction_ aiMatrix4Translation, Ptr AiMatrix4x4 -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4Scaling, Ptr AiMatrix4x4 -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiMatrix4FromTo, Ptr AiMatrix4x4 -> ConstPtr AiVector3D -> ConstPtr AiVector3D -> IO ()}

#{importfunction_ aiQuaternionFromEulerAngles, Ptr AiQuaternion -> CFloat -> CFloat -> CFloat -> IO ()}
#{importfunction_ aiQuaternionFromAxisAngle, Ptr AiQuaternion -> ConstPtr AiVector3D -> CFloat -> IO ()}
#{importfunction_ aiQuaternionFromNormalizedQuaternion, Ptr AiQuaternion -> ConstPtr AiVector3D -> IO ()}
#{importfunction_ aiQuaternionAreEqual, ConstPtr AiQuaternion -> ConstPtr AiQuaternion -> IO CInt}
#{importfunction_ aiQuaternionAreEqualEpsilon, ConstPtr AiQuaternion -> ConstPtr AiQuaternion -> CFloat -> IO CInt}
#{importfunction_ aiQuaternionNormalize, Ptr AiQuaternion -> IO ()}
#{importfunction_ aiQuaternionConjugate, Ptr AiQuaternion -> IO ()}
#{importfunction_ aiQuaternionMultiply, Ptr AiQuaternion -> ConstPtr AiQuaternion -> IO ()}
#{importfunction_ aiQuaternionInterpolate, Ptr AiQuaternion -> ConstPtr AiQuaternion -> ConstPtr AiQuaternion -> CFloat -> IO ()}
