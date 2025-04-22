public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext sc) {
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = NULL LIMIT 200 ];
        
        for (Lead lead : leads) {
            lead.LeadSource = 'DreamForce';
        }
        update leads;
        
    }

}