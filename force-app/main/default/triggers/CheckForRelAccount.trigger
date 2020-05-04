trigger CheckForRelAccount on Contact (after insert, after update) {
    List<Account> allAccounts = new List<Account>(
        [Select Name From Account]
    );
    //Map <String, Contact> conSave = new Map <String, Contact> ();
    Set <Id> conIds = new Set <Id>();
    List <Contact> conInsert = new List <Contact>();
    For(Contact con: Trigger.New){
        conIds.add(con.Id);
    }

    For(Contact con: [Select Id, FirstName, LastName, AccountId 
    FROM Contact Where Id IN :conIds] ){
        if(con.AccountId == null){
            For(Account acc: allAccounts){
                System.debug(acc.Name);
                System.debug(con.FirstName);
                if(acc.Name.contains(con.FirstName) && acc.Name.contains(con.LastName)){
                 System.debug('success');
                    con.AccountId = acc.Id;
                    conInsert.add(con);
                }
                
            }            
        }
    }
    upsert conInsert;
}