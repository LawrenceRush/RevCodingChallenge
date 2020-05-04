@isTest
public class TestDupAddress {
    @isTest static void testInsert (){
        Contact con = new Contact(
                              LastName = 'Contact1',
                              Email = 'testEmail@gmail.com');
        insert con;
		Contact con2 = new Contact( 
                              LastName = 'Contact2',
                              Email = 'testEmail@gmail.com');        
        Test.startTest();
        Database.SaveResult result = Database.insert(con2, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('No duplicate emails please',
                             result.getErrors()[0].getMessage());
    }
}