@isTest
public class AccountManagerTest {
    
    public static testmethod void testgetAccount()
    {
        Id accId = insertAccount();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+accId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account acc = AccountManager.getAccount();
        System.assert(acc!=null);
        System.assertEquals(acc.Name,'testAccount');              	
    }
    
    public static Id insertAccount()
    {
        Account acc = new Account();
            acc.Name='testAccount';
        insert acc;
        Contact ct1=new Contact();
        	ct1.LastName='Test Contact1';
        	ct1.AccountId=acc.Id;
        insert ct1;
        Contact ct2=new Contact();
        	ct2.LastName='Test Contact2';
        	ct2.AccountId=acc.Id;
        insert ct2;
        return acc.Id;
    }

}