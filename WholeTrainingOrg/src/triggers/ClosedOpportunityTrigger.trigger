trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    List<Opportunity> opprs = Trigger.New;
     List<Task> tasks = new List<Task>();
    for(Opportunity o:opprs)
    {
       
        if(o.StageName=='Closed Won')
        {
            Task tsk = new Task(whatID = o.ID,  Subject='Follow Up Test Task'); 
            tasks.add(tsk);
        }
        
    }
     insert tasks;


}