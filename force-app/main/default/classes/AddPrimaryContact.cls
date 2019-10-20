public class AddPrimaryContact implements Queueable {
    
    private Contact cont;
    private String stateName;
    
    public AddPrimaryContact(Contact record, String abb) {
        this.cont = record;
        this.stateName = abb;
    }
    public void execute(QueueableContext context) {
        List<Account> accs = [SELECT Id, Name, BillingState FROM Account WHERE BillingState =: stateName LIMIT 200];
        //Contact temp = new Contact(LastName = 'Idk');
        List<Contact> contacts = new List<Contact>();
        for (Account acc : accs) {
            Contact con = cont.clone();
          	con.FirstName = 'sth';
            con.AccountId = acc.Id;
            contacts.add(con);
          // perform other processing or callout
        }
        insert contacts;
    }
    
}