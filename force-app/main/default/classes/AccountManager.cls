@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        system.debug(request);
        // grab the caseId from the end of the URL
        String accId = request.requestURI.substring(
          request.requestURI.lastIndexOf('s/')+2);
        accId = accId.left(16);
        system.debug(accId);
        Account result =  [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id = :accId];
        return result;
    }
}