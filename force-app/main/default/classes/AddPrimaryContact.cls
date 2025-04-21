public class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = [SELECT Id, BillingState FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> cloneContacts = new List<Contact>();
        
        for (Account acc: accounts) {
            Contact clone = contact.clone();
            clone.AccountId = acc.Id;
            cloneContacts.add(clone);
        }
        insert cloneContacts;
    }

}