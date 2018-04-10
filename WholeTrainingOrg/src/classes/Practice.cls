public class Practice {
    
    public static String reverse(String str)
	{
		
		String[] words=str.split(' ');
		String reversed='';
		integer size=words.size();
		while(--size>=0)
		{
			reversed+=' '+words[size];
			
		}
		return reversed.trim();
	}
    
    public static List<Account> getAccounts()
    {
        
        return [select id,name from account];
    }
    
    public static void printList(List<Account> lst)
    {
        for(Account s:lst)
        {
            System.debug(s.id +' '+s.name);
        }
    }
    
    public static void printAll()
    {
        System.debug(UserInfo.getUserId());
        List<Account> res=[SELECT Id, Name, (SELECT AccountId, Name, Email, HomePhone  FROM Contacts) FROM Account];
        
        for(Account ac : res)
        {
            System.debug('Account\n'+ac.name+'\n-------------------');
            if(ac.Contacts.isEmpty())
            {
                 System.debug(' NULL ');
            }
            
            System.debug('\n---------------------');
           
        }
         
    }
    
    public static void printStart()
    {
        for(Integer i=0;i<=5;i++)
        {
            System.debug('*');
        }
        System.debug('\n');
    }

}