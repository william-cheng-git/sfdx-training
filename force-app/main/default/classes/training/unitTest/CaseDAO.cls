public with sharing class CaseDAO extends DML {
  public Case findById(Id id) {
    return Database.query('Select id from Case where id = \'' + id + '\'');
  }

  public List<Case> findBySubject(
    String subject,
    System.AccessLevel accessLevel
  ) {
    Map<String, Object> queryArgs = new Map<String, Object>{
      'subject' => subject
    };

    return Database.queryWithBinds(
      'Select id from Case where subject = :subject',
      queryArgs,
      AccessLevel
    );
  }
}
