//
//  main.c
//  agoodstart
//
//  Created by development on 12/18/24.
//

#include <stdio.h>
#include <stdlib.h>

// c2
int C2_AGoodStart(void) {
    // Print the beginning of the novel
    printf("It was the best of times.\n");
    printf("It was the worst of times.\n");
    /* Is that actually any good?
       Maybe it needs a rewrite. */
    
    return 0;
}

// c3
int C3_Turkey(void) {
    // Declare the variable called 'weight' of type float
    float weight;
    
    // Put a number in that variable
    weight = 14.2;
    
    // Log it to the user
    printf("The turkey weights %f.\n", weight);
    
    // Declare another variable of type float
    float cookingTime;
    
    // Calculate the cooking time and store it in the variable
    // In this case, '*' means 'multiplied by'
    cookingTime = 15.0 + 15.0 * weight;
    
    // Log that to the user
    printf("Cook it for %f minutes.\n", cookingTime);
    
    // End this function and indicate success
    
    return 0;
}

int C3_Challenge_TwoFloats(void) {
    
    float curr = 2.28;
    float next = 7.25;
    
    double total = curr + next;
    printf("Curr: %f next: %f total from 1 yr: %f\n", curr, next, total);
    
    return 0;
}

// c5
void congratulateStudent(char *student, char *course, int numDays) {
    printf("%s has done as much %s Programming as I could fit into %d days.\n", student, course, numDays);
}

void C5_Class_certificates() {
    congratulateStudent("Mark", "Cocoa", 5);
//    sleep(2);
    congratulateStudent("Bo", "Objective-C", 2);
//    sleep(2);
    congratulateStudent("Mike", "Python", 5);
//    sleep(2);
    congratulateStudent("Ted", "iOS", 5);
}

// random
void randomNumberChallenge(void) {
    
}

int main(int argc, const char * argv[]) {
//    C2_AGoodStart();
//    C3_Turkey();
//    C3_Challenge_TwoFloats();
    C5_Class_certificates();
}
