#include <assimp/cimport.h>

ASSIMP_API void hs_aiGetPredefinedLogStream(
  enum aiDefaultLogStream pStreams,
  const char* file,
  struct aiLogStream* pOut
)
{
  *pOut = aiGetPredefinedLogStream(pStreams, file);
}
