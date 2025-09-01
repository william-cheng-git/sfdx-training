@IsTest
public with sharing class DMLTest {
  @IsTest
  static void testInsertRecords() {
    DML dml = new DML();
    List<Account> accounts = new List<Account>{
      new Account(Name = 'Test Account 1'),
      new Account(Name = 'Test Account 2')
    };

    List<Database.SaveResult> results = dml.insertRecords(
      accounts,
      true,
      System.AccessLevel.USER_MODE
    );

    Assert.areEqual(2, results.size());
    for (Database.SaveResult result : results) {
      Assert.isTrue(result.isSuccess(), 'Insert should be successful');
      Assert.isNotNull(result.getId(), 'Inserted record should have an Id');
    }
  }
}
