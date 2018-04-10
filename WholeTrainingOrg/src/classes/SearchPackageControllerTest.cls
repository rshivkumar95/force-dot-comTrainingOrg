@isTest
public class SearchPackageControllerTest {
    
static testMethod void testMethod1()
{
    List<Package__c> pck=SearchPackageController.fetchPackage('a',true);
    String newSearchText='%'+'a'+'%';
    Integer mnth = System.Today().Month();
    Integer num;
        if(newSearchText.isNumeric())
			num=Integer.valueOf(newSearchText);
        else
            num=0;
     List<Package__c> lstOfPackage=new  List<Package__c>();
     if(true)
        {
            //Integer mnth = System.Today().Month();
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
     	
        }
        else
        {
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num];
     	
        }
        
  // List<Package__c> lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
   System.assertEquals(lstOfPackage, pck);
}
    static testMethod void testMethod2()
{
    List<Package__c> pck=SearchPackageController.fetchPackage('a',true);
    String newSearchText='%'+'a'+'%';
    Integer mnth = System.Today().Month();
    Integer num;
        if(newSearchText.isNumeric())
			num=Integer.valueOf(newSearchText);
        else
            num=0;
     List<Package__c> lstOfPackage=new  List<Package__c>();
     if(false)
        {
            //Integer mnth = System.Today().Month();
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
     	
        }
        else
        {
            lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num];
     	
        }
        
  // List<Package__c> lstOfPackage = [SELECT Id,Package_Number__c,Name,Package_Quantity__c,Package_Product__c,Company__r.Name FROM Package__c WHERE CALENDAR_MONTH(CreatedDate) = :mnth AND (Package_Product__c LIKE :newSearchText OR Package_Priority__c LIKE :newSearchText OR Package_Number__c = :num)];
   System.assertEquals(lstOfPackage, pck);
}
    
   
}