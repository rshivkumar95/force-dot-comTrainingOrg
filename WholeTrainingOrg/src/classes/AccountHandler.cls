public class AccountHandler {
    
    public static Account insertNewAccount(String accName)
    {
        Account acc=new Account();
        acc.name=accName;
        try{
        insert acc;
        }
        catch(Exception e)
        {
            return null;
        }
        return acc;
    }

}