@isTest
public class LeadProcessorTest {
    
    @testSetup
    static void setup()
    {
        List<Lead> l=new List<Lead>();
        
        for(Integer i=0;i<200;i++)
        {
            Lead ld=new Lead();
            ld.LastName='Lead '+(i+1);
            ld.Company='Something';
            ld.External_Id__c='extid'+(i+1);
            ld.Status='Open - Not Contacted';
           l.add(ld);
        }
        insert l;
        System.debug('Inserted');
    }
    
    static testmethod void test()
    {
        Test.startTest();
        LeadProcessor lp=new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }

}