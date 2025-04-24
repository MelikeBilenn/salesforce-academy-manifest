@isTest
public class ParkLocatorTest {
    @isTest
    static void testCallout() {
        // Set up the mock response
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        // Call the method from ParkLocator
        String countryName = 'Test country';
        List<String> parkNames = ParkLocator.country(countryName);

        // Assert the expected result
        Assert.areEqual(new List<String>{'melike', 'zeynep', 'elif'}, parkNames);
    }
}