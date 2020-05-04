public class SeeGroceryListsController {
    Public List<Grocery_List__c> GroceryLists{get; set;}
    public Grocery_List__c newList { get; set; }
    public string SelectedListId { get; set; }
    
    
    public SeeGroceryListsController (){
        
        GroceryLists = [Select Name, Id From Grocery_List__c ];
        newList = new Grocery_List__c();
    }     
    
    public  pageReference submitList (){
        if(string.isEmpty(newList.Name)){
            ApexPages.addmessage(new ApexPages.message
                                 (ApexPages.severity.WARNING,'Please enter a List name'));
            
            return null;
        } else {
            insert newList;
            GroceryLists = [Select Name From Grocery_List__c ];
            ApexPages.addmessage(new ApexPages.message
                                 (ApexPages.severity.WARNING,'List Submitted'));
            
            return null;
            
        }
    }
    public void DeleteList()
    {
        Grocery_List__c tobeDeleted = null;
        for(Grocery_List__c l : GroceryLists)
            if (l.Id == SelectedListId) {
                tobeDeleted = l;
                break;
            }
        
        if (tobeDeleted != null) {
            Delete tobeDeleted;
        }
        
        GroceryLists = [Select Name, Id From Grocery_List__c ];

    }
}