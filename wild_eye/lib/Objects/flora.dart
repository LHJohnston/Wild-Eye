
import 'package:wild_eye/Objects/location.dart';

class Flora {
  Flora({this.info, this.numsightings=1, required this.name, required this.location});

  final String name;

  final Location location;

  final String? info;

  int numsightings;

 
  
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
  String getinfo(){
    return info.toString();
  }

  void addSighting(){
    //setState();
    numsightings ++;
  }
  
}