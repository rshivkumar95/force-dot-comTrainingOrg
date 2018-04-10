public class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads(String searchString)
    {
        List<List<sObject>> searchList = [FIND :searchString IN NAME FIELDS RETURNING Contact(Name), Lead(Name)];
		
		Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        
        return searchList;

    }
}