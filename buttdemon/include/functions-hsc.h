#ifndef functions-hsc_h_INCLUDED
#define functions-hsc_h_INCLUDED

#include "assimp/material.h"

inline void hsc_matkey_key(const char *pKey, unsigned int type, unsigned int index) {
  hsc_const_str("%s", pKey);
}

inline void hsc_matkey_type(const char *pKey, unsigned int type, unsigned int index) {
  hsc_printf("%u", type);
}

inline void hsc_matkey_index(const char *pKey, unsigned int type, unsigned int index) {
  hsc_printf("%u", index);
}

inline void hsc_texturekey_type(enum aiTextureType type, unsigned int index) {
  hsc_printf("%u", type);
}

inline void hsc_texturekey_index(enum aiTextureType type, unsigned int index) {
  hsc_printf("%u", index);
}

#endif // functions-hsc_h_INCLUDED
