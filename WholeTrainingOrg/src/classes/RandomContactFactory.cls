public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer num, String str)
    {
        List<Contact> lc=new List<Contact>();
        for(Integer i=1;i<=num;i++)
        {
            Contact c=new Contact(FirstName='Test '+i,LastName=str);
            lc.add(c);
        }
        
        return lc;
    }

}