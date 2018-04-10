@isTest
public class AnimalLocatorMock implements HttpCalloutMock{
    
    public HTTPResponse respond(HTTPRequest request)
    {
        HttpResponse res=new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        res.setStatusCode(200);
        return res;
    }
	
}