global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
	
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Address,AnnualRevenue,City,Email,Name FROM Lead'
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        
        List<Lead> leads = new List<Lead>();
        for(Lead l : scope)
        {
            l.LeadSource='Dreamforce';
            leads.add(l);
        }
        update leads;
        
    }
    global void finish(Database.BatchableContext bc){
        
        System.debug(recordsProcessed + ' records processed.');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug(job);
        
    }
}