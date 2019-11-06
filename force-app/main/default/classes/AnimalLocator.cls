public class AnimalLocator {
    
    public class animal {
        Integer id;
        String name;
        String eats;
        String says;
    }
    
    public class sth {
        AnimalLocator.animal animal;
    }
	
    public static String getAnimalNameById(Integer num){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
            // Deserializes the JSON string into collections of primitive data types.
            AnimalLocator.sth a = new AnimalLocator.sth();
            a = (AnimalLocator.sth)JSON.deserialize(response.getBody(), animalLocator.sth.class);
            // Cast the values in the 'animals' key as a list
            //AnimalLocator.Animal animal = (AnimalLocator.Animal) results.get('animal');
            System.debug(a);
        	return a.animal.name;
    }
    
}