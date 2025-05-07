@IsTest
public class AccountManagerTest {
    @isTest 
    static void testGetAccount() {
        Account testAccount = new Account(Name='Melike Test');
        insert testAccount;
        
        Contact con = new Contact(
        FirstName='Melike',
        LastName='Bilen',
        Email='bilenmelike@gmail.com',
        AccountId= testAccount.Id
        );
        
        insert con;
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://brave-otter-viqehy-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ testAccount.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account account = AccountManager.getAccount();
        // Verify results
        Assert.isTrue(account != null);
        Assert.areEqual('Melike Test', account.Name);
    }
}