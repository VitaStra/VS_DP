@isTest
public class DailyLeadProcessorTest {
    
	@testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(Lastname='Lead '+i, Company = 'Company ' + i, 
                city='New York', country='USA', LeadSource = ''));
        }
        insert leads;
    }
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());     
    }
}