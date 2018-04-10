trigger accountUpdate on Account (before insert,before update) {
    
    for(Account acc:Trigger.new)
    {
        if(acc.NumberOfEmployees > 500)
        {
            acc.Type='Prospect';
        }
        else
        {
            acc.Type='Other';
        }
    }

}