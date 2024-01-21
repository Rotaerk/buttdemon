#define THE_HEADER "assimp/GltfMaterial.h"
#include THE_HEADER

module Graphics.Formats.Assimp.GltfMaterial (
  aiMatkeyGltfPbrmetallicroughnessMetallicroughnessTexture,
  aiMatkeyGltfAlphamode,
  aiMatkeyGltfAlphacutoff,
  aiMatkeyGltfMappingnameBase,
  aiMatkeyGltfMappingidBase,
  aiMatkeyGltfMappingfilterMagBase,
  aiMatkeyGltfMappingfilterMinBase,
  aiMatkeyGltfScaleBase,
  aiMatkeyGltfStrengthBase,
) where

import Foreign.C.String
import GHC.Ptr
import Graphics.Formats.Assimp.Material

#{texturekey AI_MATKEY_GLTF_PBRMETALLICROUGHNESS_METALLICROUGHNESS_TEXTURE, aiMatkeyGltfPbrmetallicroughnessMetallicroughnessTexture}
#{matkey AI_MATKEY_GLTF_ALPHAMODE, aiMatkeyGltfAlphamode}
#{matkey AI_MATKEY_GLTF_ALPHACUTOFF, aiMatkeyGltfAlphacutoff}

#{cstring _AI_MATKEY_GLTF_MAPPINGNAME_BASE, aiMatkeyGltfMappingnameBase}
#{cstring _AI_MATKEY_GLTF_MAPPINGID_BASE, aiMatkeyGltfMappingidBase}
#{cstring _AI_MATKEY_GLTF_MAPPINGFILTER_MAG_BASE, aiMatkeyGltfMappingfilterMagBase}
#{cstring _AI_MATKEY_GLTF_MAPPINGFILTER_MIN_BASE, aiMatkeyGltfMappingfilterMinBase}
#{cstring _AI_MATKEY_GLTF_SCALE_BASE, aiMatkeyGltfScaleBase}
#{cstring _AI_MATKEY_GLTF_STRENGTH_BASE, aiMatkeyGltfStrengthBase}
