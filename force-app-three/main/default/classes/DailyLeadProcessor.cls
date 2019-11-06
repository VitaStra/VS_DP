global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        List<Lead> opptys = [SELECT Id, Name
            FROM Lead 
            WHERE LeadSource = '' LIMIT 200];
        for(Lead l : opptys){
            l.LeadSource = 'Dreamforce';
        }
        update opptys;
    }
    

}