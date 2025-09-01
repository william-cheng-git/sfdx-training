public virtual with sharing class DML {
  public List<Database.SaveResult> insertRecords(
    List<SObject> sobjects,
    Boolean allOrNothing,
    System.AccessLevel accessLevel
  ) {
    return Database.insert(sobjects, allOrNothing, accessLevel);
  }
}
