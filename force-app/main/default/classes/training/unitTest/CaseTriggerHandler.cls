public with sharing class CaseTriggerHandler {
  private EmailToCaseProcessor emailToCaseProcessor;

  @TestVisible
  private static Mock caseTriggerHandlerMock = Mock.forType(
    CaseTriggerHandler.class
  );

  @TestVisible
  private static Boolean enableMock = false;

  public CaseTriggerHandler() {
    this.emailToCaseProcessor = new EmailToCaseProcessor();
  }

  /**
   * Private constructor for unit testing purposes.
   * This allows for dependency injection of the EmailToCaseProcessor.
   */
  @TestVisible
  private CaseTriggerHandler(EmailToCaseProcessor emailToCaseProcessor) {
    this.emailToCaseProcessor = emailToCaseProcessor;
  }

  /**
   * As trigger doesn't have constructor
   * , we need to use this static method to get the instance method to determine if we want to use mock
   */
  public static CaseTriggerHandler getInstance() {
    if (Test.isRunningTest() && enableMock) {
      // Prepare Mock
      return (CaseTriggerHandler) caseTriggerHandlerMock.stub;
    } else {
      return new CaseTriggerHandler();
    }
  }

  public void handle(Boolean isBefore, Boolean isInsert, List<Case> cases) {
    if (isBefore && isInsert) {
      handleBeforeInsert(cases);
    }
  }

  public List<Case> handleBeforeInsert(List<Case> cases) {
    List<Case> emailToCases = new List<Case>();

    for (Case c : cases) {
      if (c.Origin == 'Email') {
        emailToCases.add(c);
      }
    }

    // Call your helper class and pass any variables you need to
    return (new EmailToCaseProcessor()).processCases(emailToCases);
  }

  /**
   * Enhanced version of handleBeforeInsert that allows for dependency injection
   */
  public List<Case> handleBeforeInsertlooselyCoupled(List<Case> cases) {
    List<Case> emailToCases = new List<Case>();

    for (Case c : cases) {
      if (c.Origin == 'Email') {
        emailToCases.add(c);
      }
    }

    // Call your helper class and pass any variables you need to
    return emailToCaseProcessor.processCases(emailToCases);
  }
}
