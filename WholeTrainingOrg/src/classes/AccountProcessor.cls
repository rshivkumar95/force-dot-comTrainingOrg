public class AccountProcessor {
    
    @future(callout=true)
    public static void countContacts(List<Id> recordIds)
    {
        List<Account> accounts = [SELECT Id, (Select id from contacts) FROM Account Where Id IN :recordIds];
        List<Account> updateThisAccount = new List<Account>();
        for(Account ac : accounts)
        {
            System.debug(ac.Contacts.size());
            
            ac.Number_Of_Contacts__c=ac.Contacts.size();
            updateThisAccount.add(ac);
            
        }
        update updateThisAccount;
    }

}