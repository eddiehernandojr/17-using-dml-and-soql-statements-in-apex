// // Test 1
// // TODO: add delete here
// List<String> names = new List<String>{ 'Test1', 'Test2', 'Test3'};
// AccountUtils accts = new AccountUtils();
// List<Id> ids = accts.createAccs(names);

// for (Id id : ids) {
//     System.debug(id);
// }

// // Test 2
// // Get the required fields of an sObject (Object Level)
// // This does not work with ServiceAppointment object.
// Schema.DescribeSObjectResult r = Task.sObjectType.getDescribe();
// Map<String,Schema.SObjectField> M = r.fields.getMap();
// for(String fieldName : M.keySet())
// { 
//     Schema.SObjectField field = M.get(fieldName);
//     Schema.DescribeFieldResult F = field.getDescribe();
//     //A nillable field can have empty content. A isNillable Boolean non-nillable field must have a value for the object to be                       //created or saved. 
//     // if F.isNillable() is false then field is mandatory
//     if(!F.isNillable())
//         System.debug(fieldName + ' - is Required');
// }

// TaskUpdate taskUpd = new TaskUpdate();

// for (Account acct : [SELECT Id, OwnerId FROM Account WHERE Id IN :ids ]) {
//     taskUpd.createTasks(acct);
// }

// // Test 3
// UpdateAccount updAcct = new UpdateAccount();
// updAcct.updatePriority();

// Test 4
UpSell us = new UpSell();
us.createOpps();