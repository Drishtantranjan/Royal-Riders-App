import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:royal_riders_application/Login&SignUp/data/hive_model/vehicle_model.dart';

class Sign2Cubit extends Cubit<void> {
  Sign2Cubit() : super(null);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController vRegistrationController = TextEditingController();
  final TextEditingController vModelController = TextEditingController();
  final TextEditingController vModelNameController = TextEditingController();
  final TextEditingController vColorController = TextEditingController();
  final TextEditingController vNameController = TextEditingController();
  final TextEditingController vAgeController = TextEditingController();

  @override
  Future<void> close() {
    nameController.dispose();
    vRegistrationController.dispose();
    vModelController.dispose();
    vColorController.dispose();
    vModelNameController.dispose();
    vNameController.dispose();
    vAgeController.dispose();
    return super.close();
  }

  void triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Royal Riders',
        body:
            'Welcome to Royal Riders your account has been created successfully, gear up for some thrill. Happy to have you on board 😁',
      ),
    );
  }

  Future<void> createAccount() async {
    // Save to Hive
    final box = Hive.box<Vehicle>('vehicleBox');
    final vehicle = Vehicle(
      name: nameController.text,
      registrationNumber: vRegistrationController.text,
      modelNumber: vModelController.text,
      modelName: vModelNameController.text,
      color: vColorController.text,
      nickname: vNameController.text,
      age: vAgeController.text,
    );
    await box.add(vehicle);

    // Save to Firestore
    await FirebaseFirestore.instance.collection('users').add({
      'name': vehicle.name,
      'registrationNumber': vehicle.registrationNumber,
      'modelName': vehicle.modelName,
      'modelNumber': vehicle.modelNumber,
      'color': vehicle.color,
      'nickname': vehicle.nickname,
      'age': vehicle.age,
      'bookmarkRides': [], // Initialize bookmarkRides with an empty list
    });

    // Print vehicle details to console
    print("Vehicle Details:");
    print("Name: ${vehicle.name}");
    print("Registration Number: ${vehicle.registrationNumber}");
    print("Model Number: ${vehicle.modelNumber}");
    print("Color: ${vehicle.color}");
    print("Nickname: ${vehicle.nickname}");
    print("Age: ${vehicle.age}");

    triggerNotification();
  }
}
