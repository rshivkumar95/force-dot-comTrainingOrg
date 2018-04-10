@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
    
    @HttpGet
    global static Case getCaseById()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1
        );
        
        Case result = [SELECT CaseNumber, Subject, Status, Origin, Priority 
                       From Case 
                       where Id=:caseId];
        
        return result;
    }
    
    
    @HttpPost
    global static ID createCase(String subject, String status,
                               String origin, String priority)
    {
        Case thisCase=new Case(Subject=subject,
                              Status=status,
                              Origin=origin,
                              Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }
    
    
    @HttpPut
    global static ID upsertCase(String id, String subject, String status,
                               String origin, String priority)
    {
        Case thisCase=new Case(Id=id,
                              Subject=subject,
                              Status=status,
                              Origin=origin,
                              Priority=priority);
        upsert thisCase;
        return thisCase.Id;
    }
    
    
    @HttpPatch
    global static ID updateCase()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1
        );
        
        Case thisCase = [Select Id from Case where Id=:caseId];
        
        Map<String,Object> params = (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.tostring());
        
        for(String fieldName : params.keySet())
        {
            thisCase.put(fieldName, params.get(fieldName));
        }
        
        update thisCase;
        return thisCase.Id;     
    }
    
    
    @HttpDelete
    global static void  deleteCase()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1
        );
        
        Case thisCase = [SELECT Id 
                       From Case 
                       where Id=:caseId];
        delete thisCase;
        
    }
        
}