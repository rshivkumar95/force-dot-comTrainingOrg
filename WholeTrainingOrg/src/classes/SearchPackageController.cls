public class SearchPackageController 
{
    
    @AuraEnabled
 	public static List <Package__c> fetchPackage(String searchKeyWord,Boolean createdInThisMonth) 
 	{
  		String newSearchText = '%' + searchKeyWord + '%';
    	Integer num;
        if(newSearchText.isNumeric())
			num=Integer.valueOf(newSearchText);
        else
            num=0;
     
  		List < Package__c> returnList = new List < Package__c > ();
        
  		List < Package__c > lstOfPackage;
        if(createdInThisMonth)
        {
            Integer mnth = System.Today().Month();
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
     	
        }
        else
        {
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num];
     	
        }
        
  		for (Package__c acc: lstOfPackage) {
   				returnList.add(acc);
  		}
  		return returnList;
 	}

}