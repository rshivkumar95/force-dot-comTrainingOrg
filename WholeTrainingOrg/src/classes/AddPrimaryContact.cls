public class AddPrimaryContact implements Queueable{
	
    Contact ct;
    String StateAbr;
    public AddPrimaryContact(Contact ct,String StateAbr)
    {
        this.ct=ct;
        this.StateAbr=StateAbr;
    }
    public void execute(QueueableContext context) {
        
         List<Account> accs = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :StateAbr LIMIT 200];
         List<Contact> contacts= New List<Contact>();
        
         for(Account a:accs)
         {
             Contact cont = ct.clone(false,false,false,false);
             cont.AccountId=a.Id;
             contacts.add(cont);
         }
        
        insert contacts;
        
          
    }
    
}