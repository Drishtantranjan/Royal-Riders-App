class User {
  String phoneNumber;
  List<Vehicle> vehicles;
  List<String> bookmarkRides;

  User({
    required this.phoneNumber,
    required this.vehicles,
    required this.bookmarkRides,
  });

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'vehicles': vehicles.map((v) => v.toMap()).toList(),
      'bookmarkRides': bookmarkRides,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phoneNumber: map['phoneNumber'],
      vehicles:
          List<Vehicle>.from(map['vehicles']?.map((v) => Vehicle.fromMap(v))),
      bookmarkRides: List<String>.from(map['bookmarkRides']),
    );
  }
}

class Vehicle {
  String name;
  String registrationNumber;
  String modelNumber;
  String color;
  String nickname;
  String age;

  Vehicle({
    required this.name,
    required this.registrationNumber,
    required this.modelNumber,
    required this.color,
    required this.nickname,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'registrationNumber': registrationNumber,
      'modelNumber': modelNumber,
      'color': color,
      'nickname': nickname,
      'age': age,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      name: map['name'],
      registrationNumber: map['registrationNumber'],
      modelNumber: map['modelNumber'],
      color: map['color'],
      nickname: map['nickname'],
      age: map['age'],
    );
  }
}
