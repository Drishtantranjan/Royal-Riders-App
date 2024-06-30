import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:royal_riders_application/Home/presentation/view/HomePage.dart';
import 'package:royal_riders_application/Login&SignUp/Presentation/view/SignUp_2.dart';
import 'package:royal_riders_application/Login&SignUp/Presentation/view/SignUp_Screen.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/data/hive_model/vehicle_model.dart';
import 'package:royal_riders_application/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? toggleValue = prefs.getInt('toggleValue');

  await Hive.initFlutter();
  Hive.registerAdapter(VehicleAdapter());
  var vehicleBox = await Hive.openBox<Vehicle>('vehicleBox');

  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: 'Notification for basic test'),
      ],
      debug: true);

  Vehicle? vehicle;
  if (vehicleBox.isNotEmpty) {
    vehicle = vehicleBox
        .getAt(vehicleBox.length - 1); // Retrieve the last added vehicle
  }

  runApp(MyApp(vehicle: vehicle, toggleValue: toggleValue));
}

class MyApp extends StatelessWidget {
  final Vehicle? vehicle;
  final int? toggleValue;

  const MyApp({Key? key, this.vehicle, this.toggleValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ROYAL RIDERS APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: toggleValue == 1 ? const HomePage() : const SignUp(),
      ),
    );
  }
}
