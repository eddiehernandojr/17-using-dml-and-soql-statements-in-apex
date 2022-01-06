@isTest
public class UpdateAccountTest {
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
}
