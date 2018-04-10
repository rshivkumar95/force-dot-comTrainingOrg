public class PrintAllAccounts {
    
    public static void display()
    {
        List<Account> acc=[SELECT id,name from Account];
        System.debug('Done some changes');
        for(Account ac:acc)
        {
            System.debug(ac.Id+'\t'+ac.Name);
        }
        
        
    }
    

}