@isTest
public class AddPrimaryContactTest {
	@testSetup 
    static void  setup() {
        List<Account> accounts = new List<Account>();
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState = 'NY'
            ));
        }
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState = 'CA'
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        String stateName = 'CA';
        Contact con = new Contact(LastName = 'Versatile');
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, stateName);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from Contact where FirstName = 'sth']);
    }

}