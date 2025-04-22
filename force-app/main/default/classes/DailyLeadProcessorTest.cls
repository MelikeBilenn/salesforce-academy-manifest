@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';
	@isTest
    public static void testLeadProcessor() {
        List<Lead> testLeads = new List<Lead>();
        for(Integer i = 0 ; i <200 ; i ++) {
            testLeads.add(new Lead(
                LastName = 'bilen' + i,
                Company = 'companyy',
                Status = 'Working'
            ));
        }
        insert testLeads;
        
        DailyLeadProcessor job = new DailyLeadProcessor();
        Test.startTest();
        System.schedule('lead test', CRON_EXP, job);
        Test.stopTest();
        
        //Checking if correct
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'DreamForce' LIMIT 200];
        System.assertEquals(200, leads.size(), 'Leadsource olmalı');
    }
    
}