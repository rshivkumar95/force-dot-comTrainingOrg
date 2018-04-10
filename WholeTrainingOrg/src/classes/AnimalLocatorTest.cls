@isTest
public class AnimalLocatorTest {

    static testmethod void test()
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animal = AnimalLocator.getAnimalNameById(1);
        System.assertEquals(animal, 'chicken');
    }
}