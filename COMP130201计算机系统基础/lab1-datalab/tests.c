/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

int test_bitNor(int x, int y){
  return ~(x|y);
}
int test_tmax(void){
  return 0x7fffffff;
}
int test_isTmin(int x){
  return x==0x80000000?1:0;
}
int test_minusOne(void){
  return -1;
}
int test_absVal(int x){
  return x<0?-x:x;
}
int test_leastBitPos(int x){
  return x&-x;
}
int test_byteSwap(int x, int n, int m){
  if(n==m)return x;
  int dis_n = n<<3;
  int dis_m = m<<3;
  int a = (x>>dis_n)&0xff;
  int b = (x>>dis_m)&0xff;
  int xor = a^b;
  x^=(xor<<dis_n);
  x^=(xor<<dis_m);
  return x; 
}
int test_logicalShift(int x, int n) {
  unsigned u = (unsigned) x;
  unsigned shifted = u >> n;
  return (int) shifted;
}
int test_isLessOrEqual(int x, int y){
  return x <= y;
}
int test_multFiveEighths(int x){
  int low = x&7;
  return (x>>3)*5 + ((low*5)>>3);
}
int test_bitCount(int x) {
  int result = 0;
  int i;
  for (i = 0; i < 32; i++)
    result += (x >> i) & 0x1;
  return result;
}
int test_greatestBitPos(int x){
  if(!x)return 0;
  for(int i=1;;i<<=1){
    if(x&i){
      x-=i;
      if(!x)return i;
    }
  }
  return -1;
}
int test_bang(int x){
  return !x;
}
int test_bitReverse(int x){
  int ans=0;
  for(int i=0;i<32;i++){
    ans<<=1;
    ans|=(x&1);
    x>>=1;
  }
  return ans;
}
int test_ilog2(int x){
  int ans=-1;
  int y=x;
  while(x){
    ans++;
    x>>=1;
  }
  if(y-(1<<ans))ans++;
  return ans;
}
int test_mod3(int x){
  return x%3;
}

unsigned test_float_neg(unsigned uf) {
    float f = u2f(uf);
    float nf = -f;
    if (isnan(f))
 return uf;
    else
 return f2u(nf);
}
unsigned test_float_i2f(int x) {
  float f = (float) x;
  return f2u(f);
}
unsigned test_float_twice(unsigned uf) {
  float f = u2f(uf);
  float tf = 2*f;
  if (isnan(f))
    return uf;
  else
    return f2u(tf);
}