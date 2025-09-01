trigger CaseTrigger on Case(before insert) {
  CaseTriggerHandler.getInstance()
    .handle(Trigger.isBefore, Trigger.isInsert, Trigger.new);
}
