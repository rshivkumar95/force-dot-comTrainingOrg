({
	helperAddNewToDo : function(component,event) {
		
        var addNewToDo = component.get("c.addToDo");
        addNewToDo.setParams({
            'title':document.getElementById("input-unique-id").value
        });
        
        addNewToDo.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS")
            {
                var sts = response.getReturnValue();
                if(sts==1)
                {
                    //swal("Added New ToDo");
                    swal('Good job!','Added New ToDo','success');
                    this.helperGetAllToDo(component,event);
                    document.getElementById("input-unique-id").value="";
                }
                else
                    swal('Something Wrong!','Error Removing ToDo','error');         	
            }
            
        });
        
        $A.enqueueAction(addNewToDo);
	},
    helperGetAllToDo : function(component,event) {
		
        var getAllToDo = component.get("c.getAllToDo");
        
        getAllToDo.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS")
            {
                var list = response.getReturnValue();
                component.set("v.ToDoList",list);      	
            }
            
        });
        
        $A.enqueueAction(getAllToDo);
	},
    helperChangeStatus : function(component,event,selectedId){
        
        var toggleToDoStatus = component.get("c.toggleToDoStatus");
        
        toggleToDoStatus.setParams({
            'todoId':selectedId
        });
        
        toggleToDoStatus.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS")
            {
                var sts = response.getReturnValue();
                if(sts==1)
                    swal('Changed','ToDo Status Has Been Changed','success');
                else
                    swal('Something Wrong!','Error In Changing ToDo Status','error');           	
            }
            
        });
        
        $A.enqueueAction(toggleToDoStatus);
    },
    helperRemoveTodo : function(component,event,selectedId){
        
        var deleteToDo = component.get("c.deleteToDo");
        
        deleteToDo.setParams({
            'todoId':selectedId
        });
        
        deleteToDo.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS")
            {
                var sts = response.getReturnValue();
                if(sts==1)
                {
                    swal('Removed','ToDo Has Been Removed','success');
                    //var action = component.get("c.helperGetAllToDo");
					//action.$meth$();
                   this.helperGetAllToDo(component,event);
                }
                else
                    swal('Something Wrong!','Error In Removing ToDo','error');        	
            }
            
        });
        
        $A.enqueueAction(deleteToDo);
    }
})