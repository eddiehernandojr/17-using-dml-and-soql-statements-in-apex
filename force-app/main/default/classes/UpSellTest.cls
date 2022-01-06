@isTest
public class UpSellTest {
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
}
