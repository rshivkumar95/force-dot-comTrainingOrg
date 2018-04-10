public class PackageSearch {
    
 
    public String searchtxt{get;set;}
    List<Package__c> results{get;set;}
    public Boolean createdInThisMonth{get;set;}
    
   
 
   public void setSearchText(String s) {
      searchtxt = s;
   }
    
  
 
   public List<Package__c> getResults() {
      return results;
   }
    public PageReference search() {
       
        String newSearchText = '%'+searchtxt+'%';
        	Integer num;
        if(newSearchText.isNumeric())
			num=Integer.valueOf(searchtxt);
        else
            num=0;
     
        if(createdInThisMonth)
          {
              Integer mnth = System.Today().Month();
              results = [SELECT Package_Number__c,Package_Quantity__c,Package_Product__c,Company__c FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
          }
          else
            results = [SELECT Package_Number__c,Package_Quantity__c,Package_Product__c,Company__c FROM Package__c WHERE Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num];
        return null;
    }

}