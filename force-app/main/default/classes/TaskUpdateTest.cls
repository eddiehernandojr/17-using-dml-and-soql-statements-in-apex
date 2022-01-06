@isTest
public class TaskUpdateTest {
    @isTest
    static void testCreateTask() {
        List<String> names = TestDataFactory.createNames(20);
        AccountUtils accts = new AccountUtils();

        List<Id> ids = accts.createAccs(names);
        TaskUpdate taskUpd = new TaskUpdate();

        Test.startTest();
        for (Account acct : [SELECT Id, OwnerId FROM Account WHERE Id IN :ids]) {
            taskUpd.createTasks(acct);
        }
        Test.stopTest();

        List<Task> tsk = [SELECT Id FROM Task];
        String message = 'Expected size is {0}, but the actual size is {1}';
        String output = String.format(message, new List<String>{ '60', String.valueOf(tsk.size()) });
        
        // TODO2: add check if Task details are correct
        System.assertEquals(60, tsk.size(), output);
    }
}
