@isTest
public class Z_DPNewClass_Test {


    static testMethod void runUnitTest(){
        System.assertEquals(false, Z_DPNewClass.getIsForDP());
    }

    static testMethod void runRegressionTest(){

        Test.startTest();
            Z_DPNewClass.savePurposeOnContact();
        Test.stopTest();

        List<Contact> conList = [SELECT Id, Z_DPNewField__c FROM Contact];
        System.assertEquals(1, conList.size());
        System.assertEquals(true, conList[0].Z_DPNewField__c);

    }
}