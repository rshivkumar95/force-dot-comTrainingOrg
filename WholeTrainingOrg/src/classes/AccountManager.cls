@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount()
    {
        RestRequest request = RestContext.request;
        
       	String[] st = request.requestURI.split('/');
        String accId = st[st.size()-2];
        System.debug(accId);
        Account acc = [SELECT Id,Name,(Select id,name from contacts) FROM Account where id = :accId];
        return acc;
    }

}