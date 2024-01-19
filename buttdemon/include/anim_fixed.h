// quaternion.h references ai_real, defined in defs.h, but failed to actually include defs.h.
// This means that including quaternion.h fails unless defs.h has already been included.
// anim.h includes quaternion.h before including defs.h.
// This means that including anim.h also fails unless defs.h has already been included.
// In Anim.hsc, we can include defs.h before anim.h, and this solves the problem for the hsc macros.
// However, we also do foreign imports from anim.h, and we can't specify two header files in these.
// This header serves as a wrapper for anim.h that can be included on its own.
#ifndef anim_fixed_h_INCLUDED
#define anim_fixed_h_INCLUDED

#include "assimp/defs.h"
#include "assimp/anim.h"

#endif // anim_fixed_h_INCLUDED
