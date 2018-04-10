({
	Search : function(component, event, helper) {
		
        /* (Optional) This will print your entered keyword into console. This is just for debug purpose */
        console.log(component.find("id-name").get("v.value"));
        
        /* Call helper js function */
        helper.helperSearch(component, event);
	},
    Set: function(component, event, helper) {
        
        /* Read URL extract ID from URL*/
        var uri_dec = decodeURIComponent(window.location.href);
        var id=uri_dec.substr(uri_dec.indexOf("=")+1);
        
        /* Set extracted ID to bookid attribute which is used in recordview */
        component.set("v.bookid", id);
     }
})