@IsTest
public class AccountManagerTest {

    @isTest static void testGetAccById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisCase = AccountManager.getAccount();
        // Verify results
        System.assert(thisCase != null);
        System.assertEquals('Test record', thisCase.Name);
    }
    
    static Id createTestRecord() {
        // Create test record
        Account caseTest = new Account(
            Name='Test record');
        insert caseTest;
        return caseTest.Id;
    } 
}