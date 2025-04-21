@isTest
public class LeadProcessorTest {
    @testSetup
    private static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead newLead = new Lead(LastName='Soyadı', Company='X');
            leads.add(newLead);
        }
        insert leads;
    }
    
    @isTest 
    private static void test() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();
        
        // After the testing stops, assert records were updated properly
        List<Lead> updatedLeads = [select LeadSource from Lead];
        for (Lead le : updatedLeads) {
            System.assertEquals('Dreamforce', le.LeadSource, 'They should be the same');
        }
    }
}