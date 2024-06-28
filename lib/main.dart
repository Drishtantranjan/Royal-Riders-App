import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:royal_riders_application/Login&SignUp/Presentation/view/SignUp_Screen.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/data/hive_model/vehicle_model.dart';
import 'package:royal_riders_application/Splash/Splash_Screen.dart';
import 'package:royal_riders_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(VehicleAdapter());
  await Hive.openBox<Vehicle>('vehicleBox');

  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: 'Notification for basic test'),
      ],
      debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
          home: SignUp(),
        ));
  }
}
