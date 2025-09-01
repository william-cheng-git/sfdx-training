@isTest
private class EmailToCaseProcessorTest {
  @IsTest
  static void testProcessCases() {
    // Setup
    EmailToCaseProcessor processor = new EmailToCaseProcessor();
    List<Case> cases = new List<Case>();
    cases.add(new Case(Origin = 'Something'));
    cases.add(new Case());

    // Test
    List<Case> actualCases = processor.processCases(cases);

    Assert.areEqual(cases, actualCases, '');
    Assert.areEqual('Something', cases.get(0).Subject, '');
  }
}
