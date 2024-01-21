{-# LANGUAGE LambdaCase #-}
#define THE_HEADER "assimp/mesh.h"
#include THE_HEADER

module Graphics.Formats.Assimp.Mesh (
  aiMaxFaceIndices, pattern AiMaxFaceIndices,
  aiMaxBoneWeights, pattern AiMaxBoneWeights,
  aiMaxVertices, pattern AiMaxVertices,
  aiMaxFaces, pattern AiMaxFaces,
  aiMaxNumberOfColorSets, pattern AiMaxNumberOfColorSets,
  aiMaxNumberOfTexturecoords, pattern AiMaxNumberOfTexturecoords,
  AiFace,
  AiVertexWeight,
  AiBone,
  AiPrimitiveType(..),
  aiPrimitiveType_POINT, pattern AiPrimitiveType_POINT,
  aiPrimitiveType_LINE, pattern AiPrimitiveType_LINE,
  aiPrimitiveType_TRIANGLE, pattern AiPrimitiveType_TRIANGLE,
  aiPrimitiveType_POLYGON, pattern AiPrimitiveType_POLYGON,
  aiPrimitiveType_NGONEncodingFlag, pattern AiPrimitiveType_NGONEncodingFlag,
  AiAnimMesh,
  AiMorphingMethod(..),
  aiMorphingMethod_UNKNOWN, pattern AiMorphingMethod_UNKNOWN,
  aiMorphingMethod_VERTEX_BLEND, pattern AiMorphingMethod_VERTEX_BLEND,
  aiMorphingMethod_MORPH_NORMALIZED, pattern AiMorphingMethod_MORPH_NORMALIZED,
  aiMorphingMethod_MORPH_RELATIVE, pattern AiMorphingMethod_MORPH_RELATIVE,
  AiMesh,
  AiSkeletonBone,
  AiSkeleton,
) where

import Data.IntWord
import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.AABB
import Graphics.Formats.Assimp.Node
import Graphics.Formats.Assimp.Types

#{cint AI_MAX_FACE_INDICES, aiMaxFaceIndices, AiMaxFaceIndices}
#{cint AI_MAX_BONE_WEIGHTS, aiMaxBoneWeights, AiMaxBoneWeights}
#{cint AI_MAX_VERTICES, aiMaxVertices, AiMaxVertices}
#{cint AI_MAX_FACES, aiMaxFaces, AiMaxFaces}
#{cint AI_MAX_NUMBER_OF_COLOR_SETS, aiMaxNumberOfColorSets, AiMaxNumberOfColorSets}
#{cint AI_MAX_NUMBER_OF_TEXTURECOORDS, aiMaxNumberOfTexturecoords, AiMaxNumberOfTexturecoords}

#{cstruct struct aiFace, AiFace}
#{cstructfield struct aiFace, AiFace, mNumIndices, CUInt}
#{cstructfield struct aiFace, AiFace, mIndices, Ptr CUInt}

#{cstruct struct aiVertexWeight, AiVertexWeight}
#{cstructfield struct aiVertexWeight, AiVertexWeight, mVertexId, CUInt}
#{cstructfield struct aiVertexWeight, AiVertexWeight, mWeight, AiReal}

#{cstruct struct aiBone, AiBone}
#{cstructfield struct aiBone, AiBone, mName, AiString}
#{cstructfield struct aiBone, AiBone, mNumWeights, CUInt}
#ifndef ASSIMP_BUILD_NO_ARMATUREPOPULATE_PROCESS
#{cstructfield struct aiBone, AiBone, mArmature, Ptr AiNode}
#{cstructfield struct aiBone, AiBone, mNode, Ptr AiNode}
#endif
#{cstructfield struct aiBone, AiBone, mWeights, Ptr AiVertexWeight}
#{cstructfield struct aiBone, AiBone, mOffsetMatrix, AiMatrix4x4}

#{cenum enum aiPrimitiveType, AiPrimitiveType}
#{cenumerant_ AiPrimitiveType, aiPrimitiveType_POINT, AiPrimitiveType_POINT}
#{cenumerant_ AiPrimitiveType, aiPrimitiveType_LINE, AiPrimitiveType_LINE}
#{cenumerant_ AiPrimitiveType, aiPrimitiveType_TRIANGLE, AiPrimitiveType_TRIANGLE}
#{cenumerant_ AiPrimitiveType, aiPrimitiveType_POLYGON, AiPrimitiveType_POLYGON}
#{cenumerant_ AiPrimitiveType, aiPrimitiveType_NGONEncodingFlag, AiPrimitiveType_NGONEncodingFlag}

#{cstruct struct aiAnimMesh, AiAnimMesh}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mName, AiString}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mVertices, AiVector3D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mNormals, AiVector3D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mTangents, AiVector3D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mBitangents, AiVector3D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mColors, Ptr AiColor4D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mTextureCoords, Ptr AiVector3D}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mNumVertices, CUInt}
#{cstructfield struct aiAnimMesh, AiAnimMesh, mWeight, CFloat}

#{cenum enum aiMorphingMethod, AiMorphingMethod}
#{cenumerant_ AiMorphingMethod, aiMorphingMethod_UNKNOWN, AiMorphingMethod_UNKNOWN}
#{cenumerant_ AiMorphingMethod, aiMorphingMethod_VERTEX_BLEND, AiMorphingMethod_VERTEX_BLEND}
#{cenumerant_ AiMorphingMethod, aiMorphingMethod_MORPH_NORMALIZED, AiMorphingMethod_MORPH_NORMALIZED}
#{cenumerant_ AiMorphingMethod, aiMorphingMethod_MORPH_RELATIVE, AiMorphingMethod_MORPH_RELATIVE}

#{cstruct struct aiMesh, AiMesh}
#{cstructfield struct aiMesh, AiMesh, mPrimitiveTypes, CUInt}
#{cstructfield struct aiMesh, AiMesh, mNumVertices, CUInt}
#{cstructfield struct aiMesh, AiMesh, mNumFaces, CUInt}
#{cstructfield struct aiMesh, AiMesh, mVertices, Ptr AiVector3D}
#{cstructfield struct aiMesh, AiMesh, mNormals, Ptr AiVector3D}
#{cstructfield struct aiMesh, AiMesh, mTangents, Ptr AiVector3D}
#{cstructfield struct aiMesh, AiMesh, mBitangents, Ptr AiVector3D}
#{cstructfield struct aiMesh, AiMesh, mColors, Ptr AiColor4D}
#{cstructfield struct aiMesh, AiMesh, mTextureCoords, Ptr AiVector3D}
#{cstructfield struct aiMesh, AiMesh, mNumUVComponents, CUInt}
#{cstructfield struct aiMesh, AiMesh, mFaces, Ptr AiFace}
#{cstructfield struct aiMesh, AiMesh, mNumBones, CUInt}
#{cstructfield struct aiMesh, AiMesh, mBones, Ptr (Ptr AiBone)}
#{cstructfield struct aiMesh, AiMesh, mMaterialIndex, CUInt}
#{cstructfield struct aiMesh, AiMesh, mName, AiString}
#{cstructfield struct aiMesh, AiMesh, mNumAnimMeshes, CUInt}
#{cstructfield struct aiMesh, AiMesh, mAnimMeshes, Ptr (Ptr AiAnimMesh)}
#{cstructfield struct aiMesh, AiMesh, mMethod, AiMorphingMethod}
#{cstructfield struct aiMesh, AiMesh, mAABB, AiAABB}
#{cstructfield struct aiMesh, AiMesh, mTextureCoordsNames, Ptr (Ptr AiString)}

#{cstruct struct aiSkeletonBone, AiSkeletonBone}

#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mParent, CInt}
#ifndef ASSIMP_BUILD_NO_ARMATUREPOPULATE_PROCESS
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mArmature, Ptr AiNode}
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mNode, Ptr AiNode}
#endif
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mNumnWeights, CUInt}
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mMeshId, Ptr AiMesh}
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mWeights, Ptr AiVertexWeight}
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mOffsetMatrix, AiMatrix4x4}
#{cstructfield struct aiSkeletonBone, AiSkeletonBone, mLocalMatrix, AiMatrix4x4}

#{cstruct struct aiSkeleton, AiSkeleton}
#{cstructfield struct aiSkeleton, AiSkeleton, mName, AiString}
#{cstructfield struct aiSkeleton, AiSkeleton, mNumBones, CUInt}
#{cstructfield struct aiSkeleton, AiSkeleton, mBones, Ptr (Ptr AiSkeletonBone)}
