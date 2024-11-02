import 'package:camera/camera.dart';
import 'package:wild_eye/Objects/location.dart';

class Flora {
  Flora({this.info, this.numsightings=1, this.image, required this.name, required this.location});

  final String name;

  final Location location;

  final String? info;

  int numsightings;

  XFile? image;

 
  
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

  XFile? getimage(){
    return image;
  }

  String getinfo(){
    return info.toString();
  }

  void addSighting(){
    //setState();
    numsightings ++;
  }

  String getLocationName(){
    return location.getLocationName();
  }
  
}