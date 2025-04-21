@isTest
public class AddPrimaryContactTest {
    @isTest
    public static void testQueueableContacts() {
		List<Account> accounts = new List<Account>();
   		for (Integer i = 0; i< 50 ; i++) {
        	accounts.add(new Account(
				Name = 'Melike Account ' + i,
            	BillingState= 'NY'
        	));
    	}
    
       	for(Integer k = 0; k< 50 ; k++){
        	accounts.add(new Account(
				Name = 'Melike Account ' + k,
            	BillingState= 'CA'
        	));
    	}
    
		insert accounts;
    	Contact contact = new Contact(LastName='Bilen');
        insert contact;
    	Test.startTest();
    	AddPrimaryContact job = new AddPrimaryContact(contact, 'CA');
        System.enqueueJob(job);
    	List<Contact> caContacts = [SELECT Id, AccountId, Account.BillingState FROM Contact WHERE Account.BillingState = 'CA'];
    	System.assertEquals(50, caContacts.size(), '50 tane CA Account Contact bekleniyor');
    	Test.stopTest(); 
    }

}