@isTest
private class CaseDAOTest {
  @IsTest
  private static void testFindBySubject() {
    Case c = new Case(Subject = 'Test Subject');
    insert c;

    List<Case> cases = new CaseDAO()
      .findBySubject('Test Subject', AccessLevel.USER_MODE);

    System.assertEquals(1, cases.size());
  }

  @IsTest
  private static void testFindById() {
    Case c = new Case();
    insert c;

    Case actual = new CaseDAO().findById(c.Id);

    System.assertEquals(c.Id, actual.Id);
  }
}
