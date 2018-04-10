({
	afterClick : function(component, event, helper) {
        
        
        //console.log(component.find("id-name").get("v.value"));
        swal('success');
        //var 
        //
       
       
		
	},
    toggleVisibility : function(component, event, helper)
        {
         setTimeout(function(){
              var ddDiv = component.find('ddId');
              $A.util.toggleClass(ddDiv,'slds-is-open');
            }, 300);
        },
    
})