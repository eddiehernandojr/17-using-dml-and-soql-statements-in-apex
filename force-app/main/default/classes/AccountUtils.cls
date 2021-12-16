public with sharing class AccountUtils {
    public List<Id> createAccs(List<String> names) {
        // from local repository
        List<Account> accts = new List<Account>();
        List<Id> ids = new List<Id>();
        
        for (String name : names) {
            // remove Type, Industry, and Phone when you move this to a new org
        	accts.add(new Account(Name = name, Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890'));
        }
        
        insert accts;
        
        for (Account acct : accts) {
            ids.add(acct.Id);
        }
        
        return ids;
    }
}
