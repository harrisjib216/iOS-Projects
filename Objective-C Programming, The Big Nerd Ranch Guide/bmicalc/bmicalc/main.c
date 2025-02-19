//
//  main.c
//  bmicalc
//
//  Created by development on 12/31/24.
//

#include <stdio.h>
#include <time.h>

//struct Person {
//    float heightInMeters;
//    int weightInKilos;
//};

typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

float bmi(Person p) {
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

void timechallenge(void) {
    struct tm future;
    long secondsSince1970 = time(NULL);
    long fourMillionSecondsInTheFuture = secondsSince1970 + 4000000;
    localtime_r(&fourMillionSecondsInTheFuture, &future);
    printf("The time is %d:%d:%d\n", future.tm_mon + 1, future.tm_mday, future.tm_year);
}

int main(int argc, const char * argv[]) {
//    struct Person person;
    Person person;
    person.weightInKilos = 96;
    person.heightInMeters = 1.8;
    printf("person weighs %i in kilograms\n", person.weightInKilos);
    printf("person is %.2f meters tall\n", person.heightInMeters);
    
    float _bmi = bmi(person);
    printf("person has a bmi of %.2f\n", _bmi);
    
    timechallenge();
    return 0;
}
