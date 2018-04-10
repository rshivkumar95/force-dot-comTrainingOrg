public class BookSearchController {
	
        @AuraEnabled
    public static List<Book__c> fetchRecords(String keyword)
    {
        /* Add '%' symbol on both side of keyword. Then it will work like contains. It will search for book name which contain this keyword */
        String searchKeyword='%'+keyword+'%';
        
        /* Declare foundRecords List of type Book__c*/
        List<Book__c> foundRecords =new List<Book__c>();    
        
        /* Write SOQL query to find records whose book name contains given keyword*/
        foundRecords = [SELECT Book_Name__c,Edition__c,Id,Price__c FROM Book__c WHERE Book_Name__c LIKE :searchKeyword];    
        
        /* Record List of records */
        return foundRecords;
    }
}