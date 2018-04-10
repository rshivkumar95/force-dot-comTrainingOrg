@IsTest
public class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
           Account ac1=new Account();
            ac1.Name='NY '+i;
            ac1.BillingState='NY';
           Account ac2=new Account();
            ac2.Name='CA '+i;
            ac2.BillingState='CA';  
           accounts.add(ac1);
           accounts.add(ac2);
        }
        insert accounts;
    }
    
    static testmethod void test()
    {
        Contact ct = new Contact();
        ct.LastName='Rathod';
        insert ct;
        
        String state = 'CA';
        AddPrimaryContact adp=new AddPrimaryContact(ct,state);
        Test.startTest();
        	System.enqueueJob(adp);
        test.stopTest();
        System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :state)]);  
        
    }
    

}