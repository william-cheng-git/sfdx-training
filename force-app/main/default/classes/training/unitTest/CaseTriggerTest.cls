@IsTest
public with sharing class CaseTriggerTest {
  @IsTest
  static void testCaseTrigger() {
    // Setup
    Case emailCase = new Case(Origin = 'Email');
    Case phoneCase = new Case(Origin = 'Phone');
    List<Case> cases = new List<Case>{ emailCase, phoneCase };

    // Test
    insert cases;

    // Verify
    List<Case> actualCases = [SELECT Id, Subject, Origin FROM Case];

    for (Case c : actualCases) {
      if (c.Origin == 'Email') {
        Assert.areEqual('Email', c.Subject, '');
      } else {
        Assert.areEqual(null, c.Subject, '');
      }
    }
  }

  @IsTest
  static void testCaseTriggerTrueUnitTest() {
    // Setup
    Case emailCase = new Case(Origin = 'Email');
    Case phoneCase = new Case(Origin = 'Phone');
    List<Case> cases = new List<Case>{ emailCase, phoneCase };

    CaseTriggerHandler.enableMock = true;
    MethodSpy caseTriggerHandlerHandleSpy = CaseTriggerHandler.caseTriggerHandlerMock.spyOn(
      'handle'
    );

    // Test
    insert cases;

    // Verify
    Expect.that(caseTriggerHandlerHandleSpy).hasBeenCalled();
  }
}
