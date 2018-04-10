({
	helperSearch : function(component,event) {
		
        /* Call fetchRecords function of Apex Controller */
        var apexSearchController=component.get("c.fetchRecords");
       
        /* Add argument to a fetchRecord function */       
        apexSearchController.setParams({
            'keyword':component.get("v.keyword")
        });
        
        /* This function returns data from fetchRecords function and set to bookList attribute*/
        apexSearchController.setCallback(this,function(response){
            var state = response.getState();
            var bookList = response.getReturnValue();
            console.log(bookList.length);
            component.set("v.bookList",bookList);
        });
        
        /* Call apex controller */
        $A.enqueueAction(apexSearchController);
	}
})