public with sharing class AccountUtils {
    public List<Id> createAccs(List<String> names) {
        // from local repository
        List<Account> accts = new List<Account>();
        List<Id> ids = new List<Id>();
        
        for (String name : names) {
            // TODO1: remove Type, Industry, and Phone when you move this to a new org
            // TODO2: check git pull merge, rebase, and fast-forward only 
        	accts.add(new Account(Name = name, Type = 'Prospect', Industry = 'Agriculture', Phone = '(123) 456-7890'));
        }
        
        insert accts;
        
        for (Account acct : accts) {
            ids.add(acct.Id);
        }
        
        return ids;
    }
}