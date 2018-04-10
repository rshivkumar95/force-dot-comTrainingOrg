@isTest
public class DailyLeadProcessorTest {
    
    @testSetup
    public static void setup()
    {
	    List<Lead> l=new List<Lead>();
        
        for(Integer i=0;i<200;i++)
        {
            Lead ld=new Lead();
            ld.LastName='TestLead '+(i+1);
            ld.Company='Something';
            ld.External_Id__c='extid'+(i+1);
            ld.Status='Open - Not Contacted';
           l.add(ld);
        }
        insert l;
    }
    
    public static testmethod void test()
    {
        String CRON_EXP = '00 02 16 21 4 ?';
        Test.startTest();
     
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());  
        Test.stopTest();
    }
    

}