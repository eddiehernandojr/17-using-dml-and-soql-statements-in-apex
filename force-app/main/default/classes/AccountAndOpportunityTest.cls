@isTest
public class AccountAndOpportunityTest {
    @isTest
    static void testCreateAccs(){
        List<String> names = TestDataFactory.createNames(200);
        AccountUtils accts = new AccountUtils();
        
        Test.startTest();
        List<Id> ids = accts.createAccs(names);
        Test.stopTest();

        // TODO1: add check if names are correct
        System.assertEquals(200, ids.size(), 'The actual size is ' + ids.size());
    }

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

    @isTest
    static void testUpdatePriority() {
        TestDataFactory.createAccounts();
        UpdateAccount updAcct = new UpdateAccount();

        Test.startTest();
        updAcct.updatePriority();
        Test.stopTest();

        Account acct1 = [SELECT CustomerPriority__c FROM Account WHERE AnnualRevenue < 200000000 LIMIT 1];
        System.assertEquals('Low', acct1.CustomerPriority__c);

        Account acct2 = [SELECT CustomerPriority__c FROM Account WHERE AnnualRevenue >= 200000000 and AnnualRevenue <= 800000000 LIMIT 1];
        System.assertEquals('Medium', acct2.CustomerPriority__c);

        Account acct3 = [SELECT CustomerPriority__c FROM Account WHERE AnnualRevenue > 800000000 LIMIT 1];
        System.assertEquals('High', acct3.CustomerPriority__c);
    }

    @isTest
    static void testCreateOpps() {
        TestDataFactory.createAccounts();
        UpSell us = new UpSell();

        Test.startTest();
        us.createOpps();
        Test.stopTest();

        // TODO3: add check if other Opportunity details are correct
        Account acct1 = [SELECT Id FROM Account WHERE Name = 'Test1' LIMIT 1];
        Opportunity opp1 = [SELECT Name FROM Opportunity WHERE AccountId = :acct1.Id LIMIT 1];
        System.assertEquals('(Test1) SLA Upsell - Bronze', opp1.Name);

        Account acct2 = [SELECT Id FROM Account WHERE Name = 'Test2' LIMIT 1];
        Opportunity opp2 = [SELECT Name FROM Opportunity WHERE AccountId = :acct2.Id LIMIT 1];
        System.assertEquals('(Test2) SLA Upsell - Silver', opp2.Name);

        Account acct3 = [SELECT Id FROM Account WHERE Name = 'Test3' LIMIT 1];
        Opportunity opp3 = [SELECT Name FROM Opportunity WHERE AccountId = :acct3.Id LIMIT 1];
        System.assertEquals('(Test3) SLA Upsell - Gold', opp3.Name);

        Account acct4 = [SELECT Id FROM Account WHERE Name = 'Test4' LIMIT 1];
        Opportunity opp4 = [SELECT Name FROM Opportunity WHERE AccountId = :acct4.Id LIMIT 1];
        System.assertEquals('(Test4) SLA Upsell - Platinum', opp4.Name);

        Account acct5 = [SELECT Id FROM Account WHERE Name = 'Test5' LIMIT 1];
        Opportunity opp5 = [SELECT Name FROM Opportunity WHERE AccountId = :acct5.Id LIMIT 1];
        System.assertEquals('(Test5) SLA Upsell - Platinum', opp5.Name);
    }

    @isTest
    static void testRoundDown() {
        TestDataFactory.createAccounts();
        EmployeeNumberMod en = new EmployeeNumberMod();
        
        Test.startTest();
        en.roundDown();
        Test.stopTest();

        Account acct1 = [SELECT NumberOfEmployees FROM Account WHERE Name = 'Test1' LIMIT 1];
        System.assertEquals(0, acct1.NumberOfEmployees);

        Account acct2 = [SELECT NumberOfEmployees FROM Account WHERE Name = 'Test2' LIMIT 1];
        System.assertEquals(0, acct2.NumberOfEmployees);

        Account acct3 = [SELECT NumberOfEmployees FROM Account WHERE Name = 'Test3' LIMIT 1];
        System.assertEquals(50, acct3.NumberOfEmployees);

        Account acct4 = [SELECT NumberOfEmployees FROM Account WHERE Name = 'Test4' LIMIT 1];
        System.assertEquals(50, acct4.NumberOfEmployees);

        Account acct5 = [SELECT NumberOfEmployees FROM Account WHERE Name = 'Test5' LIMIT 1];
        System.assertEquals(100, acct5.NumberOfEmployees);
    }
}
