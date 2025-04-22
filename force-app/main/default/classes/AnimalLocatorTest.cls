@isTest
public class AnimalLocatorTest {
        class AnimalLocatorMockNull implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setStatusCode(404);
            response.setBody('{"error":"not found"');
            return response;
        }
    }
    @isTest
    static void testGetAnimalById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Test.startTest();
        String result = AnimalLocator.getAnimalNameById(1);
        Test.stopTest();
        System.assertEquals('chicken', result);
    }
    
        @isTest
    static void testGetAnimalByIdNull(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMockNull());
        Test.startTest();
        String result = AnimalLocator.getAnimalNameById(5);
        Test.stopTest();
        System.assertEquals(null, result);
    }
}