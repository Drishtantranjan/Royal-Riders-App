import 'package:hive/hive.dart';

part 'vehicle_model.g.dart';

@HiveType(typeId: 0)
class Vehicle extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String registrationNumber;

  @HiveField(2)
  String modelNumber;

  @HiveField(3)
  String modelName;

  @HiveField(4)
  String color;

  @HiveField(5)
  String nickname;

  @HiveField(6)
  String age;

  Vehicle({
    required this.name,
    required this.registrationNumber,
    required this.modelName,
    required this.modelNumber,
    required this.color,
    required this.nickname,
    required this.age,
  });

  // Convert Vehicle object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'registrationNumber': registrationNumber,
      'modelName': modelName,
      'modelNumber': modelNumber,
      'color': color,
      'nickname': nickname,
      'age': age,
    };
  }

  // Create a Vehicle object from a map
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      name: map['name'],
      registrationNumber: map['registrationNumber'],
      modelName: map['modelName'],
      modelNumber: map['modelNumber'],
      color: map['color'],
      nickname: map['nickname'],
      age: map['age'],
    );
  }
}
