#include <shared.h>

void notATest() {
    printf("能调用这个函数？\n");
}

void testPrint() {
    printf("测试成功！\n");
}

void testPrint(int a) {
    for (int i = 0; i < a; ++i) {
        printf("测试成功!%d\n", i);
    }
    notATest();
}