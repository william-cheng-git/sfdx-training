public with sharing class CaseCreator {
  private CaseDAO caseDao;

  private static final String STANDARD = '%%standard%%';
  private static final String UAT = '%%replaceMe%%';

  /**
   * This constructor is not used but to illustrate the problem of object instantiation
   */
  private CaseCreator() {
    this.caseDao = new CaseDAO();
  }

  public CaseCreator(CaseDAO caseDao) {
    this.caseDao = caseDao;
  }

  /**
   * Creates a new Case if no duplicate exists based on the subject.
   */
  public Case createCase(Case c) {
    // Check if there is a case with the duplicated subject
    // This is for case study only, don't use this appraoch in real-world as it is not thread-safe

    List<Case> cases = caseDao.findBySubject(
      c.Subject,
      System.AccessLevel.SYSTEM_MODE
    );

    if (cases.size() == 0) {
      // Insert the case if no duplicates found
      caseDao.insertRecords(
        new List<Case>{ c },
        true,
        System.AccessLevel.USER_MODE
      );
      return c;
    }

    // If a duplicate is found, throw a CustomException
    throw new CustomException();
  }

  /**
   * This is an example to illustrate tightly coupled to database operation and it become impossible to unit test without hitting database
   */
  @SuppressWarnings('PMD.ApexCRUDViolation')
  public Case createCaseTightlyCopuled(Case c) {
    List<Case> cases = [SELECT id FROM Case WHERE subject = :c.Subject];

    if (cases.isEmpty()) {
      insert c;
      return c;
    } else {
      throw new CustomException();
    }
  }

  @future
  public static void doSomethingFuture(String something) {
    (new CaseCreator()).doSomething(something);
  }

  public void doSomething(String something) {
    something = 'I am doing something meaningless';
  }
}
