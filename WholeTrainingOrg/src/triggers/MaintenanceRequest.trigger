trigger MaintenanceRequest on Case (before update,after update) {
	
    Map<Id,Case> validCases=new Map<Id,Case>();
    if(Trigger.isUpdate)
    {
        if(Trigger.isAfter)
        {
            for(Case c : Trigger.new)
            {
                if(c.IsClosed && (c.Type.equals('Repair') || c.Type.equals('Routine Maintenance')))
                    validCases.put(c.Id, c);
            }
            MaintenanceRequestHelper.updateWorkOrders(validCases);
            
        }
    }
    
}