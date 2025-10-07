//
//  main.c
//  word search
//
//  Created by development on 12/23/24.
//

#include <stdio.h>
#include <stdlib.h>



int main(int argc, const char * argv[]) {
    for (int i = 0; i < 100; i++) {
        char *word = randomWord(10);
        printf("%s\n", word);
        free(word);
    }

    return 0;
}
