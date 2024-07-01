#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define TMin INT_MIN
#define TMax INT_MAX

#include "btest.h"
#include "bits.h"

test_rec test_set[] = {



 {"bitNor", (funct_t) bitNor, (funct_t) test_bitNor, 2, "& ~", 8, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"tmax", (funct_t) tmax, (funct_t) test_tmax, 0, "! ~ & ^ | + << >>", 4, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"isTmin", (funct_t) isTmin, (funct_t) test_isTmin, 1, "! ~ & ^ | +", 10, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"minusOne", (funct_t) minusOne, (funct_t) test_minusOne, 0,
    "! ~ & ^ | + << >>", 2, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"absVal", (funct_t) absVal, (funct_t) test_absVal, 1,
    "! ~ & ^ | + << >>", 6, 2,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"leastBitPos", (funct_t) leastBitPos, (funct_t) test_leastBitPos, 1,
    "! ~ & ^ | + << >>", 6, 2,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"byteSwap", (funct_t) byteSwap, (funct_t) test_byteSwap, 3, "! ~ & ^ | + << >>", 20, 2,
  {{TMin, TMax},{0,3},{0,3}}},

 {"logicalShift", (funct_t) logicalShift, (funct_t) test_logicalShift, 2,
    "! ~ & ^ | + << >>", 20, 3,
  {{TMin, TMax},{0,31},{TMin,TMax}}},

 {"isLessOrEqual", (funct_t) isLessOrEqual, (funct_t) test_isLessOrEqual, 2,
    "! ~ & ^ | + << >>", 24, 3,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"multFiveEighths", (funct_t) multFiveEighths, (funct_t) test_multFiveEighths, 1, "! ~ & ^ | + << >>", 12, 3,
  {{0, TMax},{TMin,TMax},{TMin,TMax}}},

 {"bitCount", (funct_t) bitCount, (funct_t) test_bitCount, 1, "! ~ & ^ | + << >>", 40, 4,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"greatestBitPos", (funct_t) greatestBitPos, (funct_t) test_greatestBitPos, 1, "! ~ & ^ | + << >>", 60, 4,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"bang", (funct_t) bang, (funct_t) test_bang, 1, "~ & ^ | + << >>", 12, 4,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

 {"bitReverse", (funct_t) bitReverse, (funct_t) test_bitReverse, 1, "! ~ & ^ | + << >>", 40, 4,
  {{1, TMax},{TMin,TMax},{TMin,TMax}}},

 {"mod3", (funct_t) mod3, (funct_t) test_mod3, 1, "! ~ & ^ | + << >>", 90, 4,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},

//float
 {"float_neg", (funct_t) float_neg, (funct_t) test_float_neg, 1,
    "$", 10, 2,
     {{1, 1},{1,1},{1,1}}},
 {"float_i2f", (funct_t) float_i2f, (funct_t) test_float_i2f, 1,
    "$", 30, 4,
     {{1, 1},{1,1},{1,1}}},
 {"float_twice", (funct_t) float_twice, (funct_t) test_float_twice, 1,
    "$", 30, 4,
     {{1, 1},{1,1},{1,1}}},
  {"", NULL, NULL, 0, "", 0, 0,
   {{0, 0},{0,0},{0,0}}}
};
