//
//  main.c
//  word search
//
//  Created by development on 12/23/24.
//

#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>

char* randomWord(int boardSize) {
    // generate a random length from 3 to board size
    int length = rand() % (boardSize + 1 - 3) + 3;

    // allocate the word
    char *word = (char *)malloc(sizeof(char) * length);

    // generate "length" lowercase characters from a-z
    for (int i = 0; i < length; i++) {
        char letter = (char)(rand() % 26 + 97);
        word[i] = letter;
    }

    // reverse the word?
    if (rand() % 1 == 1) {
        for (int s = 0, e = length - 1;  s < e; s++, e--) {
            char temp = word[s];
            word[s] = word[e];
            word[e] = temp;
        }
    }

    return word;
}

int main(int argc, const char * argv[]) {

    // board size: get num rows and cols
    int size;
    while (1) {
        printf("What size board would you like? Limit 5 - 10: ");
        scanf("%d", &size);

        if (size > 4 && size < 11) {
            break;
        }

        printf("Invalid size. Please try again with a number between 5 and 10.\n");
    }

    // make the board
    char **board = (char **)malloc(size * sizeof(char *));
    for (int i = 0; i < size; i++) {
        board[i] = (char *)malloc(size * sizeof(char));
    }


    x x x x
    x x x x
    x x x x
    x x x x

    // pick random starting positions
    //

    // generate a random position (vertical, horizontal) (reverse, forwards)
    // generate a random word
    // fill in the word
    // update available spots tracker
    // cache the words the user needs to find
    int availableSquares = size * size;

    // make a list of words: random strings
    char **words = (char **)malloc(size * sizeof(char *));
    // make layout
    // receive connection: r X c X, r X c X, etc.
    //

    return 0;
}
