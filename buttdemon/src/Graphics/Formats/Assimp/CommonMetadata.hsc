#define THE_HEADER "assimp/commonMetaData.h"
#include THE_HEADER

module Graphics.Formats.Assimp.CommonMetadata (
  aiMetadataSourceFormat,
  aiMetadataSourceFormatVersion,
  aiMetadataSourceGenerator,
  aiMetadataSourceCopyright,
) where

import Foreign.C.String

#{cstring AI_METADATA_SOURCE_FORMAT, aiMetadataSourceFormat}
#{cstring AI_METADATA_SOURCE_FORMAT_VERSION, aiMetadataSourceFormatVersion}
#{cstring AI_METADATA_SOURCE_GENERATOR, aiMetadataSourceGenerator}
#{cstring AI_METADATA_SOURCE_COPYRIGHT, aiMetadataSourceCopyright}

