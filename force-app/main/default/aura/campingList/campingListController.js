({
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    clickCreate: function(component, event, helper) {
        var validExpense = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newExpense));
             var theItems = component.get("v.items");
 
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
      helper.createItem(component);
             var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
           component.set("v.newItem",{'sobjectType':'Camping_Item__c',

                'Name': '',

                'Quantity__c': 0,

                'Price__c': 0,

                'Packed__c': false});
 
        }
    },
      handleAddItem: function(component, event, helper) {
        var updatedItem = event.getParam("item");
        helper.updateItem(component, updatedItem);
    }
})