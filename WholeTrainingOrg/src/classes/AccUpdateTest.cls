@isTest
public class AccUpdateTest {
    static testmethod void test_Method()
    {
        Account acc=new Account();
        acc.Name='Banana';
        insert acc;
        acc.NumberOfEmployees=6000;
        update acc;
        System.assertEquals('Prospect', acc.Type);
        acc.NumberOfEmployees=6;
        update acc;
        System.assertEquals('Other', acc.Type);
    }
}