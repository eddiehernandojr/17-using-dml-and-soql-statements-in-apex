List<String> names = new List<String>{ 'Test1', 'Test2', 'Test3'};
AccountUtils accts = new AccountUtils();
List<Id> ids = accts.createAccs(names);

for (Id id : ids) {
    System.debug(id);
}
