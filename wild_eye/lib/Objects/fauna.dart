//add more info
import 'package:wild_eye/Objects/location.dart';

class Fauna {
  Fauna({required this.name, required this.locations});

  final String name;
  
  List locations;

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