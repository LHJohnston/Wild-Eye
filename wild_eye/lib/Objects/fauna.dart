//add more info
class Fauna {
  Fauna({required this.name, required this.location});

  final String name;

  final String location;
  
  

  int numLocations = 1;

  String getNumLocations(){
    return numLocations.toString();
  }

  void addLocation(){
    numLocations ++;
  }
}