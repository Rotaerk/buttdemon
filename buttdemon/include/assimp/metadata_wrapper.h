// quaternion.h references ai_real, defined in defs.h, but failed to actually include defs.h.
// This means that including quaternion.h fails unless defs.h has already been included.
// metadata.h includes quaternion.h before including defs.h.
// This means that including metadata.h also fails unless defs.h has already been included.
// In Anim.hsc, we can include defs.h before metadata.h, and this solves the problem for the hsc macros.
// However, we also do foreign imports from metadata.h, and we can't specify two header files in these.
// This header serves as a wrapper for metadata.h that can be included on its own.
#ifndef metadata_wrapper_h_INCLUDED
#define metadata_wrapper_h_INCLUDED

#include <limits.h>
#include "assimp/defs.h"
#include "assimp/metadata.h"

#endif // metadata_wrapper_h_INCLUDED
