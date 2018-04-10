({
    Search: function(component, event, helper) {
        var searchKeyFld = component.find("searchId");
        var srcValue = searchKeyFld.get("v.value");
        searchKeyFld.set("v.errors", null);
        console.log("test");
        helper.SearchHelper(component, event);
      
    },
    
    Set: function(component, event, helper) {
        
        var uri_dec = decodeURIComponent(window.location.href);
        console.log(uri_dec);
        var id=uri_dec.substr(uri_dec.indexOf("=")+1);
        console.log(id);
        component.set("v.pckid", id);
        
	},
    
    changeBox: function(component, event, helper){
        
        console.log(component.get("v.createdDate"));
        
    }
    
    
})