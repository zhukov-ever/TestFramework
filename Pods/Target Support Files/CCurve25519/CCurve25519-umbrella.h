#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CCurve25519.h"
#import "curve25519-donna.h"
#import "curve_sigs.h"
#import "gen_x.h"
#import "internal_fast_tests.h"
#import "internal_slow_tests.h"

FOUNDATION_EXPORT double CCurve25519VersionNumber;
FOUNDATION_EXPORT const unsigned char CCurve25519VersionString[];

