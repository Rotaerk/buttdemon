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
  AiPrimitiveType,
  aiPrimitiveType_POINT, pattern AiPrimitiveType_POINT,
  aiPrimitiveType_LINE, pattern AiPrimitiveType_LINE,
  aiPrimitiveType_TRIANGLE, pattern AiPrimitiveType_TRIANGLE,
  aiPrimitiveType_POLYGON, pattern AiPrimitiveType_POLYGON,
  aiPrimitiveType_NGONEncodingFlag, pattern AiPrimitiveType_NGONEncodingFlag,
  aiPrimitiveTypeForNIndices,
  AiAnimMesh,
  AiMorphingMethod,
  aiMorphingMethod_UNKNOWN, pattern AiMorphingMethod_UNKNOWN,
  aiMorphingMethod_VERTEX_BLEND, pattern AiMorphingMethod_VERTEX_BLEND,
  aiMorphingMethod_MORPH_NORMALIZED, pattern AiMorphingMethod_MORPH_NORMALIZED,
  aiMorphingMethod_MORPH_RELATIVE, pattern AiMorphingMethod_MORPH_RELATIVE,
  AiMesh,
  AiSkeletonBone,
  AiSkeleton,
) where

import Foreign.Allocable
import Foreign.C.Types
import Foreign.Offset
import Foreign.Ptr
import Graphics.Formats.Assimp.AABB
import Graphics.Formats.Assimp.Node
import Graphics.Formats.Assimp.Types

#{cint "AI_MAX_FACE_INDICES", "aiMaxFaceIndices", "AiMaxFaceIndices"}
#{cint "AI_MAX_BONE_WEIGHTS", "aiMaxBoneWeights", "AiMaxBoneWeights"}
#{cint "AI_MAX_VERTICES", "aiMaxVertices", "AiMaxVertices"}
#{cint "AI_MAX_FACES", "aiMaxFaces", "AiMaxFaces"}
#{cint "AI_MAX_NUMBER_OF_COLOR_SETS", "aiMaxNumberOfColorSets", "AiMaxNumberOfColorSets"}
#{cint "AI_MAX_NUMBER_OF_TEXTURECOORDS", "aiMaxNumberOfTexturecoords", "AiMaxNumberOfTexturecoords"}

data AiFace

instance Allocable AiFace where
  sizeof = #{size struct aiFace}
  alignof = #{alignment struct aiFace}

instance Offset "mNumIndices" AiFace CUInt where offsetof = #{offset struct aiFace, mNumIndices}
instance Offset "mIndices" AiFace (Ptr CUInt) where offsetof = #{offset struct aiFace, mIndices}

data AiVertexWeight

instance Allocable AiVertexWeight where
  sizeof = #{size struct aiVertexWeight}
  alignof = #{alignment struct aiVertexWeight}

instance Offset "mVertexId" AiVertexWeight CUInt where offsetof = #{offset struct aiVertexWeight, mVertexId}
instance Offset "mWeight" AiVertexWeight AiReal where offsetof = #{offset struct aiVertexWeight, mWeight}

data AiBone

instance Allocable AiBone where
  sizeof = #{size struct aiBone}
  alignof = #{alignment struct aiBone}

instance Offset "mName" AiBone AiString where offsetof = #{offset struct aiBone, mName}
instance Offset "mNumWeights" AiBone CUInt where offsetof = #{offset struct aiBone, mNumWeights}
#ifndef ASSIMP_BUILD_NO_ARMATUREPOPULATE_PROCESS
instance Offset "mArmature" AiBone (Ptr AiNode) where offsetof = #{offset struct aiBone, mArmature}
instance Offset "mNode" AiBone (Ptr AiNode) where offsetof = #{offset struct aiBone, mNode}
#endif
instance Offset "mWeights" AiBone (Ptr AiVertexWeight) where offsetof = #{offset struct aiBone, mWeights}
instance Offset "mOffsetMatrix" AiBone AiMatrix4x4 where offsetof = #{offset struct aiBone, mOffsetMatrix}

type AiPrimitiveType = CInt

#{cint_ "aiPrimitiveType_POINT", "AiPrimitiveType_POINT"}
#{cint_ "aiPrimitiveType_LINE", "AiPrimitiveType_LINE"}
#{cint_ "aiPrimitiveType_TRIANGLE", "AiPrimitiveType_TRIANGLE"}
#{cint_ "aiPrimitiveType_POLYGON", "AiPrimitiveType_POLYGON"}
#{cint_ "aiPrimitiveType_NGONEncodingFlag", "AiPrimitiveType_NGONEncodingFlag"}

aiPrimitiveTypeForNIndices :: Int -> AiPrimitiveType
aiPrimitiveTypeForNIndices = \case
  1 -> aiPrimitiveType_POINT
  2 -> aiPrimitiveType_LINE
  3 -> aiPrimitiveType_TRIANGLE
  x | x > 3 -> aiPrimitiveType_POLYGON
  _ -> error "Undefined for non-positive index counts."

data AiAnimMesh

instance Allocable AiAnimMesh where
  sizeof = #{size struct aiAnimMesh}
  alignof = #{alignment struct aiAnimMesh}

instance Offset "mName" AiAnimMesh AiString where offsetof = #{offset struct aiAnimMesh, mName}
instance Offset "mVertices" AiAnimMesh AiVector3D where offsetof = #{offset struct aiAnimMesh, mVertices}
instance Offset "mNormals" AiAnimMesh AiVector3D where offsetof = #{offset struct aiAnimMesh, mNormals}
instance Offset "mTangents" AiAnimMesh AiVector3D where offsetof = #{offset struct aiAnimMesh, mTangents}
instance Offset "mBitangents" AiAnimMesh AiVector3D where offsetof = #{offset struct aiAnimMesh, mBitangents}
instance Offset "mColors" AiAnimMesh (Ptr AiColor4D) where offsetof = #{offset struct aiAnimMesh, mColors}
instance Offset "mTextureCoords" AiAnimMesh (Ptr AiVector3D) where offsetof = #{offset struct aiAnimMesh, mTextureCoords}
instance Offset "mNumVertices" AiAnimMesh CUInt where offsetof = #{offset struct aiAnimMesh, mNumVertices}
instance Offset "mWeight" AiAnimMesh CFloat where offsetof = #{offset struct aiAnimMesh, mWeight}

type AiMorphingMethod = CInt

#{cint_ "aiMorphingMethod_UNKNOWN", "AiMorphingMethod_UNKNOWN"}
#{cint_ "aiMorphingMethod_VERTEX_BLEND", "AiMorphingMethod_VERTEX_BLEND"}
#{cint_ "aiMorphingMethod_MORPH_NORMALIZED", "AiMorphingMethod_MORPH_NORMALIZED"}
#{cint_ "aiMorphingMethod_MORPH_RELATIVE", "AiMorphingMethod_MORPH_RELATIVE"}

data AiMesh

instance Allocable AiMesh where
  sizeof = #{size struct aiMesh}
  alignof = #{alignment struct aiMesh}

instance Offset "mPrimitiveTypes" AiMesh CUInt where offsetof = #{offset struct aiMesh, mPrimitiveTypes}
instance Offset "mNumVertices" AiMesh CUInt where offsetof = #{offset struct aiMesh, mNumVertices}
instance Offset "mNumFaces" AiMesh CUInt where offsetof = #{offset struct aiMesh, mNumFaces}
instance Offset "mVertices" AiMesh (Ptr AiVector3D) where offsetof = #{offset struct aiMesh, mVertices}
instance Offset "mNormals" AiMesh (Ptr AiVector3D) where offsetof = #{offset struct aiMesh, mNormals}
instance Offset "mTangents" AiMesh (Ptr AiVector3D) where offsetof = #{offset struct aiMesh, mTangents}
instance Offset "mBitangents" AiMesh (Ptr AiVector3D) where offsetof = #{offset struct aiMesh, mBitangents}
instance Offset "mColors" AiMesh (Ptr AiColor4D) where offsetof = #{offset struct aiMesh, mColors}
instance Offset "mTextureCoords" AiMesh (Ptr AiVector3D) where offsetof = #{offset struct aiMesh, mTextureCoords}
instance Offset "mNumUVComponents" AiMesh CUInt where offsetof = #{offset struct aiMesh, mNumUVComponents}
instance Offset "mFaces" AiMesh (Ptr AiFace) where offsetof = #{offset struct aiMesh, mFaces}
instance Offset "mNumBones" AiMesh CUInt where offsetof = #{offset struct aiMesh, mNumBones}
instance Offset "mBones" AiMesh (Ptr (Ptr AiBone)) where offsetof = #{offset struct aiMesh, mBones}
instance Offset "mMaterialIndex" AiMesh CUInt where offsetof = #{offset struct aiMesh, mMaterialIndex}
instance Offset "mName" AiMesh AiString where offsetof = #{offset struct aiMesh, mName}
instance Offset "mNumAnimMeshes" AiMesh CUInt where offsetof = #{offset struct aiMesh, mNumAnimMeshes}
instance Offset "mAnimMeshes" AiMesh (Ptr (Ptr AiAnimMesh)) where offsetof = #{offset struct aiMesh, mAnimMeshes}
instance Offset "mMethod" AiMesh AiMorphingMethod where offsetof = #{offset struct aiMesh, mMethod}
instance Offset "mAABB" AiMesh AiAABB where offsetof = #{offset struct aiMesh, mAABB}
instance Offset "mTextureCoordsNames" AiMesh (Ptr (Ptr AiString)) where offsetof = #{offset struct aiMesh, mTextureCoordsNames}

data AiSkeletonBone

instance Allocable AiSkeletonBone where
  sizeof = #{size struct aiSkeletonBone}
  alignof = #{alignment struct aiSkeletonBone}

instance Offset "mParent" AiSkeletonBone CInt where offsetof = #{offset struct aiSkeletonBone, mParent}
#ifndef ASSIMP_BUILD_NO_ARMATUREPOPULATE_PROCESS
instance Offset "mArmature" AiSkeletonBone (Ptr AiNode) where offsetof = #{offset struct aiSkeletonBone, mArmature}
instance Offset "mNode" AiSkeletonBone (Ptr AiNode) where offsetof = #{offset struct aiSkeletonBone, mNode}
#endif
instance Offset "mNumnWeights" AiSkeletonBone CUInt where offsetof = #{offset struct aiSkeletonBone, mNumnWeights}
instance Offset "mMeshId" AiSkeletonBone (Ptr AiMesh) where offsetof = #{offset struct aiSkeletonBone, mMeshId}
instance Offset "mWeights" AiSkeletonBone (Ptr AiVertexWeight) where offsetof = #{offset struct aiSkeletonBone, mWeights}
instance Offset "mOffsetMatrix" AiSkeletonBone AiMatrix4x4 where offsetof = #{offset struct aiSkeletonBone, mOffsetMatrix}
instance Offset "mLocalMatrix" AiSkeletonBone AiMatrix4x4 where offsetof = #{offset struct aiSkeletonBone, mLocalMatrix}

data AiSkeleton

instance Allocable AiSkeleton where
  sizeof = #{size struct aiSkeleton}
  alignof = #{alignment struct aiSkeleton}

instance Offset "mName" AiSkeleton AiString where offsetof = #{offset struct aiSkeleton, mName}
instance Offset "mNumBones" AiSkeleton CUInt where offsetof = #{offset struct aiSkeleton, mNumBones}
instance Offset "mBones" AiSkeleton (Ptr (Ptr AiSkeletonBone)) where offsetof = #{offset struct aiSkeleton, mBones}
