public class ParkLocator {
	
    public static String[] country(String str) {
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
		return ps.byCountry(str);
    }
}