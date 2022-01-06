@isTest
public class AccountUtilsTest {
    @isTest
    static void testCreateAccs(){
        List<String> names = TestDataFactory.createNames(200);
        AccountUtils accts = new AccountUtils();
        
        Test.startTest();
        List<Id> ids = accts.createAccs(names);
        Test.stopTest();

        // TODO1: add check if names are correct
        System.assertEquals(200, ids.size(), 'The actual size is ' + ids.size());
    }
}
