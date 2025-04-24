public class ParkLocator {
    public static String[] country(String countryName){
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        String[] parkNames = parkService.byCountry(countryName);
        return parkNames;
    }
}