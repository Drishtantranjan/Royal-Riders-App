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
  String color;

  @HiveField(4)
  String nickname;

  @HiveField(5)
  String age;

  Vehicle({
    required this.name,
    required this.registrationNumber,
    required this.modelNumber,
    required this.color,
    required this.nickname,
    required this.age,
  });
}
