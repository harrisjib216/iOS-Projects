//
//  main.c
//  yostring
//
//  Created by development on 1/21/25.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int spaceCount(char *s) {
    int c = 0;
    
    for (int i = 0; i < strlen(s); i++) {
        if (s[i] == 0x20) {
            c++;
        }
    }
    
    return c;
}

int main(int argc, const char * argv[]) {
    char x = '!';
//    char x = 0x21;
    while (x <= '~') {
//    while (x <= 0x7e) {
        printf("%x is %c\n", x, x);
        x++;
    }
    
    
//    char *start = malloc(5);
//    *start = 'L';
//    *(start + 1) = 'O';
//    *(start + 2) = 'V';
//    *(start + 3) = 'E';
//    *(start + 4) = '\0';
//    printf("%s has %zu characters\n", start, strlen(start));
//    printf("the third character is %c\n", *(start + 2));
//    free(start);
//    start = NULL;
    
    char *start = malloc(5);
    start[0] = 'L';
    start[1] = 'O';
    start[2] = 'V';
    start[3] = 'E';
    start[4] = '\0';
    printf("%s has %zu characters\n", start, strlen(start));
    printf("the third character is %c\n", start[2]);
    free(start);
    start = NULL;
    

    const char *love = "love";
    // char *love = "love";
    // love[2] = 4; // Thread 1: EXC_BAD_ACCESS (code=2, address=0x100000f9a)
    printf("%s has %zu characters\n", love, strlen(love));
    printf("the third character is %c\n", love[2]);
    
    
    const char *d = "a backslash after two newlines and a tab:\n\n\t\\";
    printf(d);

    
    float *favs = malloc(3 * sizeof(float));
    favs[0] = 3.14158;
    favs[1] = 1.0;
    favs[2] = 2.0;
    
    for (int i = 0; i < 3; i++) {
        printf("%f\n", favs[i]);
    }
    free(favs);
    favs = NULL;
    
    
    // challenge
    const char *sen = "He was not in the cab at the time.";
    printf("\"%s\" has %d spaces\n", sen, spaceCount(sen));
    
    return 0;
}
