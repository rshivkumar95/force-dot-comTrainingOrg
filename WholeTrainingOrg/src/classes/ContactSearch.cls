public class ContactSearch {

    public static List<Contact> searchForContacts(string lname,string mpostal)
    {
        List<Contact> result = [ select id,name from contact where LastName =:lname and MailingPostalCode =: mpostal];
        
        return result;
    }
}