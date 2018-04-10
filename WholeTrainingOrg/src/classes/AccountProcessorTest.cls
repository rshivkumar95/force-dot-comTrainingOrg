@IsTest
public class AccountProcessorTest {
    
    @IsTest
    private static void testAccountProcessor()
    {
        Account testAccount = new Account();
 		testAccount.Name='Test Account' ;
 		insert testAccount;
        List<Account> accounts = [SELECT Id FROM Account];
        List<Id> ids =  new List<Id>();
        for(Account ac:accounts)
        {
            ids.add(ac.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();
    }

}