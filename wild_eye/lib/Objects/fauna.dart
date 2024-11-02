//add more info
import 'package:camera/camera.dart';
import 'package:wild_eye/Objects/location.dart';

class Fauna {
  Fauna({this.info, this.numsightings=1, required this.name, this.image, required this.location});

  final String name;

  final Location location;

  final String? info;

  XFile? image;

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
}