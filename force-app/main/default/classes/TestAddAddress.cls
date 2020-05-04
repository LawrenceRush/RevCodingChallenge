@isTest
public class TestAddAddress {
    @isTest static void TestAddingAnAccount(){
    string shippingStreet = '12345';
    string shippingCity = 'New York';
    string shippingCountry = 'USA';
    string shippingPostalCode = '12345';
    Account acct = new Account(Name='Test Account', 
                              ShippingStreet = shippingStreet,
                              ShippingCity = shippingCity,
                              ShippingCountry = shippingCountry,
                              ShippingPostalCode = shippingPostalCode);
        
        
        Test.startTest();
        Database.SaveResult result = Database.insert(acct, false);
        List <Address__c> newAddress = new List <Address__c> (
            [Select ID, Street_Address__c, Address_City__c, Address_Country__c,
             Address_State__C From Address__c WHERE Street_Address__c =:shippingStreet And
            Address_City__c =:shippingCity And Address_Zip_Code__c =: shippingPostalCode And 
            Address_Country__c =: shippingCountry]
        );
		Test.stopTest();
        
        System.assert(!result.isSuccess());
		System.assert(result.getErrors().size() < 0);
        System.assert(newAddress.size()>1);
    }
}