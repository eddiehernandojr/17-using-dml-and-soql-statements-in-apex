public with sharing class UpdateAccount {
    public void updatePriority() {
        List<Account> updatedAccts = new List<Account>();

        // TODO: check if null is valid for this SOQL query
        for (Account acct : [SELECT AnnualRevenue FROM Account WHERE AnnualRevenue != null]) {
            if (acct.AnnualRevenue < 200000000) {
                acct.CustomerPriority__c = 'Low';
            } else if (acct.AnnualRevenue >= 200000000 && acct.AnnualRevenue <= 800000000) {
                acct.CustomerPriority__c = 'Medium';
            } else {
                acct.CustomerPriority__c = 'High';
            }
            updatedAccts.add(acct);
        }
        
        update updatedAccts;
    }
}