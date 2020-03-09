//
//  main.c
//  CLang
//
//  Created by Daysun on 2020/2/23.
//  Copyright © 2020 Daysun. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    
    int a;
    a = 10;
    
   printf("&a =  %d\n", &a); // &a =  -272632564
    
    *((int*)272632564) = 10;
    //*((int*)1245024)=10;
    
      printf("a =  %d\n", a); // &a =  -272632564
    
    
    printf("&a =  %p\n", &a); // &a =  0x7ffeefbff50c
    a= 1;
    printf("&a =  %p\n", &a); // &a =  0x7ffeefbff50c
    a = 24;
    printf("&a =  %p\n", &a); // &a =  0x7ffeefbff50c
    
    // 变量a的值变了，但是y地址没有变
    
    char *str ="ABC";
    
    printf("&str =  %p\n", &str); // &a =  0x7ffeefbff50c
    
    str ="hello1234";
   printf("&str =  %p\n", &str); // &a =  0x7ffeefbff50c
    
    printf("Hello, World!\n");
    return 0;
}
