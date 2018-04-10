public class ExpenseController {
    
    @AuraEnabled
    public static List < Contact > fetchAccount(String searchKeyWord) {
        
        String searchKey = searchKeyWord + '%';
        List < Contact > returnList = new List < Contact > ();
        List < Contact > lstOfContact = [SELECT Name,Id FROM Contact WHERE Name LIKE :searchKey];
        
        for (Contact cc: lstOfContact) 
        {
            returnList.add(cc);
        }
        
        return returnList;
    }
    
}