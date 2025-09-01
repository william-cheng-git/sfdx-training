public with sharing class EmailToCaseProcessor {
  public List<Case> processCases(List<Case> cases) {
    for (Case c : cases) {
      c.Subject = c.Origin;
    }
    return cases;
  }
}
