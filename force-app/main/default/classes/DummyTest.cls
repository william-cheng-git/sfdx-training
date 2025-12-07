@IsTest
public with sharing class DummyTest {

    @IsTest
    static void verySlowTest() {
        for (Integer i = 0; i < 100000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }
}