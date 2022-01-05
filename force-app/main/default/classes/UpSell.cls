public with sharing class UpSell {
    public enum Sla { BRONZE, SILVER, GOLD, PLATINUM }

    public void createOpps() {
        List<Account> accts = [SELECT Id, Name, SLA__c FROM Account];
        List<Opportunity> opps = new List<Opportunity>();

        for (Account acct : accts) {
            String nextLevel = '';
            
            try {
                Sla level = Sla.valueOf(acct.SLA__c);
                nextLevel = getNextLevel(level);
            } catch (NoSuchElementException e) {
				nextLevel = Sla.BRONZE.name().toLowerCase().capitalize();
            }           
             
            String message = '({0}) SLA Upsell - {1}';
            String output = String.format(message, new List<String>{ acct.Name, nextLevel });
            Opportunity opp = new Opportunity(AccountId = acct.Id, Name = output, StageName = 'Prospecting', CloseDate = Date.today() + 30);
            opps.add(opp);
        }

        upsert opps;
    }

    public String getNextLevel(Sla level) {
        Integer index = 0;
        Sla nextLevel;
		System.debug(level.name());
        // Note: There is no fall-through. After the code block is executed, the switch statement exits.
        switch on level {
            when BRONZE {
                index = Sla.BRONZE.ordinal() + 1;
                nextLevel = Sla.values()[index];
            }
            when SILVER {
                index = Sla.SILVER.ordinal() + 1;
                nextLevel = Sla.values()[index];
            }
            when GOLD {
                index = Sla.GOLD.ordinal() + 1;
                nextLevel = Sla.values()[index];
            }
            when PLATINUM {
                nextLevel = Sla.PLATINUM;
            }
            when else {
                nextLevel = Sla.BRONZE;
            }
        }
        
        return nextLevel.name().toLowerCase().capitalize();
    }
}