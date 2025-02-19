//
//  main.c
//  affirmative
//
//  Created by development on 1/21/25.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    if (argc != 3) {
        for (int i = 0; i < argc; i++) {
            printf("arg %d = %s\n", i, argv[i]);
        }
        printf(stderr, "Incorrect number of arguments supplied, expected 2");
        return 1;
    }
    
    int count = atoi(argv[2]);
    for (int j = 0; j < count; j++) {
        printf("%s is cool.\n", argv[1]);
    }

    
    return 0;
}
