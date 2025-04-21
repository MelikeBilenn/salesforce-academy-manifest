@isTest
public class AddPrimaryContactTest {
    public static testMethod void testAddPrimaryContact() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                Name = 'Melike Account ' + i,
                BillingState = 'NY'
            ));
        }
        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                Name = 'Melike Account ' + i,
                BillingState = 'CA'
            ));
        }
        
        insert accounts;
        
        Contact c = new Contact(LastName = 'Bilen');
        insert c; // Insert the contact before using it
        
        Test.startTest();
        AddPrimaryContact job = new AddPrimaryContact(c, 'CA'); // Ensure this is the correct class
        System.enqueueJob(job); // Enqueue the job to run it
        Test.stopTest();
        
        List<Contact> caContacts = [SELECT Id, AccountId, Account.BillingState FROM Contact WHERE Account.BillingState = 'CA'];
        System.assertEquals(50, caContacts.size(), '50 tane CA Account Contact bekle iypr');
    }
}