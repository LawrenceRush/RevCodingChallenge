public class SeeGroceryListsController {
  Public List<Grocery_List__c> GroceryLists{get; set;}
  public Grocery_List__c newList { get; set; }


    public SeeGroceryListsController (){
     
        GroceryLists = [Select Name From Grocery_List__c ];
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
}