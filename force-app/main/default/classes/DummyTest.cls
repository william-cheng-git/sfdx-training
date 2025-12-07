@IsTest
public with sharing class DummyTest {

    @IsTest
    static void verySlowTest1() {
        for (Integer i = 0; i < 1000000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }

    @IsTest
    static void verySlowTest2() {
        for (Integer i = 0; i < 1000000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }

    @IsTest
    static void verySlowTest2() {
        for (Integer i = 0; i < 1000000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }

    @IsTest
    static void verySlowTest3() {
        for (Integer i = 0; i < 1000000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }

    @IsTest
    static void verySlowTest4() {
        for (Integer i = 0; i < 1000000; i++) {
            // Simulate a long-running test
            Integer j = i * i;
        }
    }
}