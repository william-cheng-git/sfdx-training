@IsTest
public with sharing class CaseCreatorTest {
  @IsTest
  static void testCreateCaseWithNoDuplicate() {
    // Setup
    Mock caseDaoMock = Mock.forType(CaseDao.class);
    MethodSpy caseDaoFindBySubjectSpy = caseDaoMock.spyOn('findBySubject');
    caseDaoFindBySubjectSpy.returns(new List<Case>());

    MethodSpy caseDaoInsertRecordsSpy = caseDaoMock.spyOn('insertRecords');

    CaseCreator caseCreator = new CaseCreator((CaseDAO) caseDaoMock.stub);

    Case c = new Case();

    // Test
    caseCreator.createCase(c);

    // Verify
    Expect.that(caseDaoInsertRecordsSpy)
      .hasBeenCalledWith(c, true, System.AccessLevel.USER_MODE);
  }

  @IsTest
  static void testCreateCaseWithDuplicate() {
    // Setup
    Mock caseDaoMock = Mock.forType(CaseDao.class);
    MethodSpy caseDaoFindBySubjectSpy = caseDaoMock.spyOn('findBySubject');
    caseDaoFindBySubjectSpy.returns(new List<Case>{ new Case() });

    CaseCreator caseCreator = new CaseCreator((CaseDAO) caseDaoMock.stub);

    // Test
    Exception actualException;

    try {
      caseCreator.createCase(new Case());
    } catch (CustomException e) {
      actualException = e;
    }

    Assert.isInstanceOfType(
      actualException,
      CustomException.class,
      'Exception should be CustomException'
    );
  }
}
