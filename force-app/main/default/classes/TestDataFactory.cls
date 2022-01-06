@isTest
public class TestDataFactory {
    public static List<String> createNames(Integer numNames) {
        List<String> names = new List<String>();

        for (Integer i = 0; i < numNames; i++) {
            names.add('Test' + i);
        }

        return names;
    }

    public static void createAccounts() {
        List<Account> accts = new List<Account>();

        // TODO: remove Type, Industry, and Phone when you move this to a new org
        accts.add(new Account(Name = 'Test1', Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890', AnnualRevenue = 0, SLA__c = '', NumberOfEmployees = 0));
      	accts.add(new Account(Name = 'Test2', Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890', AnnualRevenue = 199999999, SLA__c = 'Bronze', NumberOfEmployees = 49));
        accts.add(new Account(Name = 'Test3', Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890', AnnualRevenue = 200000000, SLA__c = 'Silver', NumberOfEmployees = 50));
        accts.add(new Account(Name = 'Test4', Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890', AnnualRevenue = 800000000, SLA__c = 'Gold', NumberOfEmployees = 99));
        accts.add(new Account(Name = 'Test5', Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890', AnnualRevenue = 800000001, SLA__c = 'Platinum', NumberOfEmployees = 100));

        insert accts;
    }
}
