/* This header will cause a mismatch with any mingw-w64 header by including a
   system header and then getting included before user headers in the hsc file.
   So let's define the default to be mingw-w64 C99 so we have any hope of
   getting GHC to compile with GCC 9+.  */
#if defined(_WIN32) && !defined(__USE_MINGW_ANSI_STDIO)
#  define __USE_MINGW_ANSI_STDIO 1
#endif

/* We need stddef to be able to use size_t. Hopefully this won't cause
   any problems along the lines of ghc trac #2897. */
#include <stddef.h>

/* hsc_* are defined in the generated utils.c */
int hsc_printf(const char *format, ...);
int hsc_toupper(int c);
int hsc_tolower(int c);
int hsc_putchar(int c);
/* "void" should really be "FILE", but we aren't able to refer to "FILE"
   as we don't want to include <stdio.h> here */
int hsc_fputs(const char *s, void *stream);
/* "void" should really be "FILE", but we aren't able to refer to "FILE"
   as we don't want to include <stdio.h> here */
void *hsc_stdout(void);

/* For the single-argument macros we make the macros variadic (the
   argument is x... rather than simply x) so that arguments containing
   commas work. See trac #590. */

#ifndef offsetof
#define offsetof(t, f) ((size_t) &((t *)0)->f)
#endif

#if __NHC__
#define hsc_line(line, file) \
    hsc_printf ("# %d \"%s\"\n", line, file);
#define hsc_column(column)
#else
#define hsc_line(line, file) \
    hsc_printf ("{-# LINE %d \"%s\" #-}\n", line, file);
#define hsc_column(column) \
    hsc_printf ("{-# COLUMN %d #-}", column);
#endif

#define hsc_const(x...)                               \
    if ((x) < 0)                                      \
        hsc_printf ("%lld", (long long)(x));          \
    else                                              \
        hsc_printf ("%llu", (unsigned long long)(x));

#define hsc_const_str(x...)                                       \
    {                                                             \
        const char *s = (x);                                      \
        hsc_printf ("\"");                                        \
        while (*s != '\0')                                        \
        {                                                         \
            if (*s == '"' || *s == '\\')                          \
                hsc_printf ("\\%c", *s);                          \
            else if (*s >= 0x20 && *s <= 0x7E)                    \
                hsc_printf ("%c", *s);                            \
            else                                                  \
                hsc_printf ("\\%d%s",                             \
                        (unsigned char) *s,                       \
                        s[1] >= '0' && s[1] <= '9' ? "\\&" : ""); \
            ++s;                                                  \
        }                                                         \
        hsc_printf ("\"");                                        \
    }

#define hsc_type(t...)                                      \
    if ((t)(int)(t)1.4 == (t)1.4)                           \
        hsc_printf ("%s%lu",                                \
                (t)(-1) < (t)0 ? "Int" : "Word",            \
                (unsigned long)sizeof (t) * 8);             \
    else                                                    \
        hsc_printf ("%s",                                   \
                sizeof (t) >  sizeof (double) ? "LDouble" : \
                sizeof (t) == sizeof (double) ? "Double"  : \
                "Float");

#define hsc_peek(t, f) \
    hsc_printf ("(\\hsc_ptr -> peekByteOff hsc_ptr %ld)", \
                (long) offsetof (t, f));

#define hsc_poke(t, f) \
    hsc_printf ("(\\hsc_ptr -> pokeByteOff hsc_ptr %ld)", \
                (long) offsetof (t, f));

#define hsc_ptr(t, f) \
    hsc_printf ("(\\hsc_ptr -> hsc_ptr `plusPtr` %ld)", \
                (long) offsetof (t, f));

#define hsc_offset(t, f) \
    hsc_printf("(%ld)", (long) offsetof (t, f));

#define hsc_size(t...) \
    hsc_printf("(%ld)", (long) sizeof(t));

#define hsc_alignment(x...)                                           \
  do {                                                                \
    struct __anon_x__ {                                               \
      char a;                                                         \
      x b;                                                            \
    };                                                                \
    hsc_printf("%lu", (unsigned long)offsetof(struct __anon_x__, b)); \
  } while (0)

#define hsc_enum(t, f, print_name, x)                   \
    print_name;                                         \
    hsc_printf (" :: %s\n", #t);                        \
    print_name;                                         \
    hsc_printf (" = %s ", #f);                          \
    if ((x) < 0)                                        \
        hsc_printf ("(%lld)\n", (long long)(x));        \
    else                                                \
        hsc_printf ("%llu\n", (unsigned long long)(x));

#define hsc_haskellize(x...)                                       \
    {                                                              \
        const char *s = (x);                                       \
        int upper = 0;                                             \
        if (*s != '\0')                                            \
        {                                                          \
            hsc_putchar (hsc_tolower (*s));                        \
            ++s;                                                   \
            while (*s != '\0')                                     \
            {                                                      \
                if (*s == '_')                                     \
                    upper = 1;                                     \
                else                                               \
                {                                                  \
                    hsc_putchar (upper ? hsc_toupper (*s)          \
                                       : hsc_tolower (*s));        \
                    upper = 0;                                     \
                }                                                  \
                ++s;                                               \
            }                                                      \
        }                                                          \
    }

// Below are custom HSC macros:

#include "assimp/material.h"

#define hsc_importfunction(csymbol, hsvar, hstype) \
  hsc_printf("foreign import capi \"%s %s\" %s :: %s", THE_HEADER, #csymbol, #hsvar, #hstype);

#define hsc_importfunction_(csymbol, hstype) \
  hsc_printf("foreign import capi \"%s %s\" %s :: %s", THE_HEADER, #csymbol, #csymbol, #hstype);

#define hsc_cstring(csymbol, hsvar) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CString", THE_HEADER, #csymbol, #hsvar);

#define hsc_cfloat(csymbol, hsvar) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CFloat", THE_HEADER, #csymbol, #hsvar);

#define hsc_cint(csymbol, hsvar, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CInt\n", THE_HEADER, #csymbol, #hsvar); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #hsvar); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #hsvar);

#define hsc_cint_(csymbol, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CInt\n", THE_HEADER, #csymbol, #csymbol); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #csymbol); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #csymbol);

#define hsc_cuint(csymbol, hsvar, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CUInt\n", THE_HEADER, #csymbol, #hsvar); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #hsvar); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #hsvar);

#define hsc_cuint_(csymbol, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: CUInt\n", THE_HEADER, #csymbol, #csymbol); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #csymbol); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #csymbol);

#define hsc_cstruct(ctype, hstype) \
  hsc_printf("data {-# CTYPE \"%s\" \"%s\" #-} %s\n", THE_HEADER, #ctype, #hstype); \
  hsc_printf("instance Allocable %s where\n", #hstype); \
  hsc_printf("  sizeof = "); \
  hsc_size(ctype); \
  hsc_printf("\n"); \
  hsc_printf("  alignof = "); \
  hsc_alignment(ctype);

#define hsc_cstructfield(cstructtype, hsstructtype, cfield, hsfieldtype) \
  hsc_printf("instance Offset \"%s\" %s (%s) where offsetof = ", #cfield, #hsstructtype, #hsfieldtype); \
  hsc_offset(cstructtype, cfield);

#define hsc_cenum(ctype, hstype) \
  hsc_printf("newtype {-# CTYPE \"%s\" \"%s\" #-} %s = %s ", THE_HEADER, #ctype, #hstype, #hstype); \
  hsc_type(ctype); \
  hsc_printf(" deriving (Eq, Ord, Num, Real, Integral, Enum)");

#define hsc_cenumerant(hstype, enumerant, hsvar, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: %s\n", THE_HEADER, #enumerant, #hsvar, #hstype); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #hsvar); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #hsvar);

#define hsc_cenumerant_(hstype, enumerant, pattern) \
  hsc_printf("foreign import capi \"%s value %s\" %s :: %s\n", THE_HEADER, #enumerant, #enumerant, #hstype); \
  hsc_printf("pattern %s :: (Eq a, Num a) => a\n", #pattern); \
  hsc_printf("pattern %s <-((== fromIntegral %s) -> True)\n", #pattern, #enumerant); \
  hsc_printf("  where %s = fromIntegral %s", #pattern, #enumerant);

void hsc_matkey_key(const char *, unsigned int, unsigned int);
void hsc_matkey_type(const char *, unsigned int, unsigned int);
void hsc_matkey_index(const char *, unsigned int, unsigned int);
void hsc_texturematkey_type(enum aiTextureType, unsigned int);
void hsc_texturematkey_index(enum aiTextureType, unsigned int);

#define hsc_matkey(matkey, hsvar) \
  hsc_printf("%s :: AiMatKey\n%s = AiMatKey (Ptr ", #hsvar, #hsvar); \
  hsc_matkey_key(matkey); \
  hsc_printf("#) "); \
  hsc_matkey_type(matkey); \
  hsc_putchar(' '); \
  hsc_matkey_index(matkey);

#define hsc_texturekey(matkey, hsvar) \
  hsc_printf("%s :: AiTextureKey\n%s = AiTextureKey ", #hsvar, #hsvar); \
  hsc_texturekey_type(matkey); \
  hsc_putchar(' '); \
  hsc_texturekey_index(matkey);
