public class ToDoController {
    
    @AuraEnabled
    public static Integer addToDo(String title)
    {
        Integer oldSize = [SELECT count() FROM ToDo__c];
        ToDo__c td=new ToDo__c();
        td.title__c=title;
        td.Status__c='Pending';       
        insert td;
        Integer newSize = [SELECT count() FROM ToDo__c];
        if(oldSize==(newSize-1))
            return 1;
        else
            return 0;
    }
    
    @AuraEnabled
    public static List<ToDo__c> getAllToDo()
    {
        List<ToDo__c> todos = [SELECT Id,Name,Status__c,title__c FROM ToDo__c];
        
        return todos;
    }
    
    @AuraEnabled
    public static Integer deleteToDo(String todoId)
    {
        Integer oldSize = [SELECT count() FROM ToDo__c];
        ToDo__c todo = [SELECT Id,Name,Status__c,title__c FROM ToDo__c WHERE Id = :todoId];
        delete todo;
        Integer newSize = [SELECT count() FROM ToDo__c];
        if(oldSize == ( newSize+1))
           return 1;
        else
           return 0;       
    }
    
    @AuraEnabled
    public static Integer toggleToDoStatus(String todoId)
    {       
        ToDo__c todo = [SELECT Id,Name,Status__c,title__c FROM ToDo__c WHERE Id = :todoId];
        String oldStatus = todo.Status__c;
        
        if(todo.Status__c == 'Pending')
            todo.Status__c='Completed';
        else
            todo.Status__c='Pending';
        
        update todo;
        
        if(oldStatus != todo.Status__c)
           return 1;
        else
           return 0;       
    }
    
    @AuraEnabled
    public static Integer deleteCompletedToDo()
    {       
        List<ToDo__c> todos = [SELECT Id,Name,Status__c,title__c FROM ToDo__c WHERE Status__c = 'Completed'];
		delete todos;
        
        todos = [SELECT Id,Name,Status__c,title__c FROM ToDo__c WHERE Status__c = 'Completed'];
        
        Integer size = todos.size();
        
        if(size == 0)
           return 1;
        else
           return 0;       
    }
    
    

}