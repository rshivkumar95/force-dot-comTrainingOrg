({
	buttonPress : function(component, event, helper) {
		if (event.keyCode === 13) {
             helper.helperAddNewToDo(component, event);
        }

	},
    fetchToDo : function(component, event, helper){
        
        helper.helperGetAllToDo(component, event);
    },
    SetId : function(component, event, helper){
        
        var selectedId= event.target.id;
        helper.helperChangeStatus(component, event, selectedId);
    },
    RemoveId : function(component, event, helper){
        
        var selectedId= event.target.id;
        console.log(selectedId);
        helper.helperRemoveTodo(component, event, selectedId);
          
    }
    
})