#ifndef cimport_wrapper_h_INCLUDED
#define cimport_wrapper_h_INCLUDED

#include "assimp/cimport.h"

ASSIMP_API void aiGetPredefinedLogStream_wrapped(
  enum aiDefaultLogStream pStreams,
  const char* file,
  struct aiLogStream* pOut
)
{
  *pOut = aiGetPredefinedLogStream(pStreams, file);
}
#endif // cimport_wrapper_h_INCLUDED
