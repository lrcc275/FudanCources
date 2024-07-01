/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
#include "bits.h"


//P1
/* 
 * bitNor - ~(x|y) using only ~ and & 
 *   Example: bitNor(4, 5) = -6, bitNor(-1,-2) = 0
 *   Legal ops: ~ &
 *   Max ops: 8
 *   Rating: 1
 */
int z;
int shift;
int a,b,c,d,e,f;
int z1,z2,z3,z4,z5;
unsigned sign,exp,frac;
int bitNor(int x, int y) { //4|5 = //00000101 ~ 1111111....11111010(complement integer!)
  z = (~x) & (~y);
	return z;
}

//P2
/* 
 * tmax - return maximum two's complement integer (0x7fffffff)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmax(void) {
  z = 1 << 31;
  z = ~z;
	return z;
}

//P3
/*
 * isTmin - returns 1 if x is the minimum two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmin(int x) {
  z = x ^ (1 + ~x);
  return !( z | (!x));
}
//P4
/*
 * minusOne - return a value of -1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 2
 *   Rating: 1
 */
int minusOne(void){
  z = 0;
	return ~z;
}

//P5
/*
 * absVal - return the absolute value of x
 *   Examples: absVal(-10) = 10
 *			   absVal(5) = 5
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int absVal(int x){
  z = x ^ (x >> 31);
  return z + ((x >> 31) & 1);
}

//P6 
/*
 * leastBitPos - return a mask that marks the position of the least significant 1 bit.
 *   Examples: leastBitPos(12) = 4
 *			       leastBitPos(-2) = 2
 *             leastBitPos(0)  = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int leastBitPos(int x) {
  z = x ^ (x + ~0);
	return z & x;
}

//P7
/*
 * byteSwap - swaps the nth byte and the mth byte
 *  Examples: byteSwap(0x12345678, 1, 3) = 0x56341278
 *            byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
 *  You may assume that 0 <= n <= 3, 0 <= m <= 3
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 20
 *  Rating: 2
 */

int byteSwap(int x, int n, int m){
  n = n << 3;
  m = m << 3;
  z1 = 0xff << n;
  z2 = 0xff << m;
  z3 = ((x & z1) >> n) & 0xff;
  z4 = ((x & z2) >> m) & 0xff;
  z5 = (z3 << m) | (z4 << n);
	return (x & ~z1 & ~z2) | z5;
}

//P8
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
  z = (~0) + ((1 << (32 + (~n))) << 1);
  return ((x >> n) & z);
}

//P9
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  int z1 = ((x & ~y) >> 31) & 1;
  int z2 = ~((x ^ y) >> 31);
  int z3 = !(x ^ y);
  return (z1) | (z3 & 1) | ((z2 & ((x + ~y + 1) >> 31) & 1));
}

//P10 
/* 
 * multFiveEighths - return floor(x*5/8), for 0 <= x, x is an integer 
 *   Example: multFiveEighths(10) = 6
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 3
 */

int multFiveEighths(int x){
  z = x & 111;
  z = z + (z << 2);
  z = z >> 3;
  x = x & (~111);
  x = x >> 3;
  x = x + (x << 2);
  return x + z;
}

//P11
/*
 * bitCount - returns count  of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
  z = 0x55 << 8 | 0x55;
  z1 = 0x33 << 8 | 0x33;
  z2 = 0x0f << 8 | 0x0f;
  z3 = 0xff << 16 | 0xff;
  z4 = ~0 + (1 << 16);
  z |= z << 16;
  z1 |= z1 | z1 << 16;
  z2 |= z2 | z2 << 16;
  x = (x & z) + ((x >> 1) & z);
  x = (x & z1) + ((x >> 2) & z1);
  x = (x & z2) + ((x >> 4) & z2);
  x = (x & z3) + ((x >> 8) & z3);
  x = (x & z4) + ((x >> 16) & z4);
  return x;
}

//P12
/*
 * greatestBitPos - return a mask that marks the position of the greatest significant 1 bit.
 *   Example: greatestBitPos(12) = 8
 *            greatestBitPos(-2) = -2147483648
 *            greatestBitPos(0)  = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 60
 *   Rating: 4
 */
int greatestBitPos(int x) {
  z = 0;
  z += ((!!( x & ((~0) << (z + 16)))) << 4);
  z += ((!!( x & ((~0) << (z + 8)))) << 3);
  z += ((!!( x & ((~0) << (z + 4)))) << 2);
  z += ((!!( x & ((~0) << (z + 2)))) << 1);
  z += (!!( x & ((~0) << (z + 1))));
  return (1 << z) & x;
}

//P13
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  z = (~((~x + 1) | x) >> 31) & 1;
  return z;
}

//P14
/*
 * bitReverse - Reverse bits in an 32-bit integer
 *   Examples: bitReverse(0x80000004) = 0x20000001
 *             bitReverse(0x7FFFFFFF) = 0xFFFFFFFE
 *   Max ops: 40
 *   Rating: 4
 */
int bitReverse(int x){
  z = 0x55 << 8 | 0x55; 
  z1 = 0x33 << 8 | 0x33; 
  z2 = 0x0f << 8 | 0x0f; 
  z4 = 0xff << 8 | 0xff;
  z3 =  z4 << 8 ^ z4;
  z = z | z << 16;
  z1 = z1 | z1 << 16;
  z2 = z2 | z2 << 16;
  x = ((x & z) << 1)|((x >> 1) & z);
  x = ((x & z1) << 2)|((x >> 2) & z1);
  x = ((x & z2) << 4)|((x >> 4) & z2);
  x = ((x & z3) << 8)|((x >> 8) & z3);
  x = ((x & z4) << 16)|((x >> 16) & z4);
  return x;
}

//P15
/*
 * mod3 - calculate x mod 3 without using %.
 *   Example: mod3(100) = 1
 *            mod3(-100) = -1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */


int mod3(int x){
  a = (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 3);
  x = x >> 2;
  a = a + (x & 1);
  x = x >> 1;
  a = a + (x & 1);
  b = a & 3;
  a = a >> 2;
  b = b + (a & 3);
  a = a >> 2;
  b = b + (a & 3);
  c = (b & 1);
  b = b >> 1;
  c = c + (~(b & 1) + 1);
  b = b >> 1;
  c = c + (b & 1);
  b = b >> 1;
  c = c + (~(b & 1) + 1);
  f = !(c | !x);
  d = !(x & 1);
  e = !(c >> 31);
  z = ~e + 1;
  c = c + d + d + d + z + z + z + f + f + f;
  return c;
}

//P16
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
  sign = uf >> 31;
  exp = uf >> 23 & 0xFF;
  frac = uf & 0x7FFFFF;
  if((exp == 0xFF) && (frac != 0)){
    return uf;
  }
  return uf ^ 0x80000000;
}

//P17
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */

unsigned float_i2f(int x) {
  sign = x & 0x80000000;
  shift = 30;
  if(x == 0x80000000) 
  return 0xCF000000;
  if(!x) 
  return 0;
  if(sign) 
  x = ~x + 1;
  while(!(x & (1 << shift))) 
  shift--;
  if(shift <= 23){
    x <<= 23 - shift;
  }
  else{
    x += (1 << (shift - 24));
    if(x << (55 - shift));
    else  x &= (0xFFFFFFFF << (shift - 22));
    if(x & (1 << shift));
    else  shift++;
    x >>= (shift-23);
  }
  x = x & 0x007FFFFF;
  shift = (shift + 127) << 23;
  return (x) | (shift) | (sign);
}

//P18
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  sign = uf >> 31;
  exp = uf >> 23 & 0xFF;
  frac = uf & 0x7FFFFF;
  if(exp == 0 && frac < 0x7FFFFF) //denormalized values
  frac <<= 1; //frac is not that big
  else if(exp == 0 && frac == 0x7FFFFF){ //denormalized values
  exp = 1; //frac is big enough
  frac = 0x7FFFFE;
  }
  else if(exp == 0xFE){//awoid being a NaN
  exp = 0xFF;
  frac = 0;
  }
  else if(exp == 0xFF) //special values
  return uf;
  else //normal values
  exp += 1;
  return (sign << 31) | (exp << 23) | frac;
}
