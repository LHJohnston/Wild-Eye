class Location{
  Location({required this.locationName, required this.numItems});
  
  final String locationName;
  int numItems;

  int getNumItems(){
    return numItems;
  }
  
  String getLocationName(){
    return locationName;
  }
}