public with sharing class EmployeeNumberMod {
    public void roundDown() {
        List<Account> accts = [SELECT Id, NumberOfEmployees FROM Account];

        for (Account acct : accts) {
            acct.NumberOfEmployees = acct.NumberOfEmployees == null ? null : getRoundDownValue(acct.NumberOfEmployees, 50);
        }

        update accts;
    }

    // TODO: refactor to accommodate large values
    public Integer getRoundDownValue(Integer val, Integer modulo) {
        return val - Math.mod(val, modulo);
    }
}