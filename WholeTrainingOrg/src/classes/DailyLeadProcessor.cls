global class DailyLeadProcessor implements Schedulable{
    
    global void execute(SchedulableContext ctx) {
        
        List<Lead> leads = [SELECT Id,LastName,LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> leadsToUpdate = new List<Lead>();
        for(Lead l:leads)
        {
           l.LeadSource='Dreamforce';
           leadsToUpdate.add(l);
        }
        update leadsToUpdate;
    }

}