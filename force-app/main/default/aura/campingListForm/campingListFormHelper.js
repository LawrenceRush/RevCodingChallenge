({
	createItem : function(component) {
        var action = component.get("c.saveItem");

            var newItem = component.get("v.newItem");
            action.setParams({
                "item": newItem
            });

            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    /* var items = component.get("v.items");
                    items.push(response.getReturnValue());
                    newItem = {sobjectType: "Camping_Item__c"};
                    component.set("v.newItem", newItem);
                    component.set("v.items", items); */

                    var addItemEvent = component.getEvent("addItem");
                    addItemEvent.setParams({"item": response.getReturnValue()});
                    addItemEvent.fire();
                    newItem = {sobjectType: "Camping_Item__c"};
                    component.set("v.newItem", newItem);
                }
            });

            $A.enqueueAction(action);
    }
})