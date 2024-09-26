//add more info
import 'package:wild_eye/Objects/location.dart';

class Fauna {
  Fauna({required this.name, required this.location});

  final String name;

  final Location location;

  List<Location> locations = [];
  
  int numLocations = 1;
  

  String getNumLocations(){
    return numLocations.toString();
  }

  void addLocation(Location location){
    numLocations ++;
    locations.add(location);

  }

  List getLocations(){
    return locations;
  }

  String getName(){
    return name;
  }
}