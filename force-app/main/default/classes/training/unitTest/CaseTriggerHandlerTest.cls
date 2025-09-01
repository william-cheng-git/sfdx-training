@IsTest
private class CaseTriggerHandlerTest {
  // Integraton test
  @IsTest
  static void testHandleBeforeInsert() {
    // Create test data
    Case testCase = new Case(Origin = 'Email');

    // Call the method to be tested
    CaseTriggerHandler handler = new CaseTriggerHandler();
    List<Case> actualCases = handler.handleBeforeInsert(
      new List<Case>{ testCase }
    );

    // Verify the results
    Assert.areEqual(new List<Case>{ testCase }, actualCases, '');
  }

  @IsTest
  static void testHandleBeforeInsertWithNonEmailOrigin() {
    // Create test data
    Case testCase = new Case(Origin = 'Phone');

    // Call the method to be tested
    CaseTriggerHandler handler = new CaseTriggerHandler();
    List<Case> actualCases = handler.handleBeforeInsert(
      new List<Case>{ testCase }
    );

    // Verify the results
    Assert.areEqual(new List<Case>(), actualCases, '');
  }

  // Unit Test
  @IsTest
  static void testHandleBeforeInsertTrueUnitTest() {
    // Create test data
    Case testCase = new Case(Origin = 'Email');

    // Prepare Mock
    Mock emailToCaseProcessorMock = Mock.forType(EmailToCaseProcessor.class);
    MethodSpy emailToCaseProcessorPocessCasesSpy = emailToCaseProcessorMock.spyOn(
      'processCases'
    );
    emailToCaseProcessorPocessCasesSpy.returns(
      new List<Case>{ testCase, testCase }
    );

    // Call the method to be tested
    CaseTriggerHandler handler = new CaseTriggerHandler(
      (EmailToCaseProcessor) emailToCaseProcessorMock.stub
    );
    List<Case> actualCases = handler.handleBeforeInsertlooselyCoupled(
      new List<Case>{ testCase }
    );

    // Verify the results
    Assert.areEqual(new List<Case>{ testCase, testCase }, actualCases, '');
    Expect.that(emailToCaseProcessorPocessCasesSpy)
      .hasBeenCalledWith(new List<Case>{ testCase });
  }
}
