@isTest
private class TestRestrictContactByName {
    @isTest 
    static void createcontact(){
        Test.startTest();
        Contact con = new Contact(LastName ='INVALIDNAME');
        Database.UpsertResult result = Database.upsert(con,false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML.' ,result.getErrors()[0].getMessage());
      }
}