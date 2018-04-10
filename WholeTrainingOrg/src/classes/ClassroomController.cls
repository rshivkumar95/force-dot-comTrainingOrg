public with sharing class ClassroomController {
    
        public String Classroom{get;set;}
        
        public list<Classroom__c> classs{get;set;}
        
        public ClassroomController()
        {
           classs=[select name,Address__c,Room_No__c from Classroom__c limit 5];
        }

}