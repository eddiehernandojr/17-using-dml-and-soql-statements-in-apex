public with sharing class UpdateAccount {
    public void updatePriority() {
        List<Account> accts = [SELECT AnnualRevenue FROM Account WHERE AnnualRevenue != null];

        for (Account acct : accts) {
            if (acct.AnnualRevenue < 200000000) {
                acct.CustomerPriority__c = 'Low';
            } else if (acct.AnnualRevenue >= 200000000 && acct.AnnualRevenue <= 800000000) {
                acct.CustomerPriority__c = 'Medium';
            } else {
                acct.CustomerPriority__c = 'High';
            }
        }
    }
}
