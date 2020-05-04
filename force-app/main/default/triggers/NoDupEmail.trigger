trigger NoDupEmail on Contact (before insert) {
    List <Contact> allCons = New List<Contact>([Select ID, Name, Email From Contact]);
    For (Contact newCon: Trigger.NEW){
        For(Contact oldCon: allCons){
            if (oldCon.Email == newCon.Email)
                newCon.addError('No duplicate emails please');
        }
            
    }
}