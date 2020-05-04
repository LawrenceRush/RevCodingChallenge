trigger AddAddress on Account (after insert, after update) {
    List<Address__c> newAddresses= New List<Address__c>();
    List<Account> newAccs = New List <Account>([Select ID, Name, ShippingStreet,
    ShippingCity, ShippingPostalCode, ShippingState, ShippingCountry
    FROM Account Where Id In :Trigger.New]);

    For(Account a: newAccs){
        if(a.ShippingStreet != null){

        newAddresses.add(new Address__c(
        Name = a.Name + '\'s house',
        Street_Address__c = a.ShippingStreet,
        Address_City__c = a.ShippingCity,
        Address_State__c = a.ShippingState,
        Address_Zip_Code__c = a.ShippingPostalCode,
            Address_Country__c = a.ShippingCountry
        ));
        }
    }
    insert newAddresses;
}