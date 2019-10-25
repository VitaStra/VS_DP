public class Z_DPNewClass {

    public static Boolean getIsForDP(){
        return true;
    }

    public static void savePurposeOnContact(){
        Contact newCon = new Contact(LastName = 'Test');
        newCon.Z_DPNewField__c = getIsForDP();
        insert newCon;
    }
}