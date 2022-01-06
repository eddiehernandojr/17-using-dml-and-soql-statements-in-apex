@isTest
public class EmployeeNumberModTest {
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
