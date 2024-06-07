import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_riders_application/Login&SignUp/Presentation/view/SignUp_Screen.dart';
import 'package:royal_riders_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  final String _logTag = 'AppBlocObserver';

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // if (bloc is AuthBloc && change.nextState is AuthUnauthenticated) {
    //   AppConstants.navigatorKey.currentState!.pushNamedAndRemoveUntil(
    //       Routes.signin, (Route<dynamic> route) => false);
    // }
    print(
      '$_logTag.onChange ${bloc.runtimeType} - $change',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(
      '$_logTag.onError ${bloc.runtimeType} - $error',
    );
    super.onError(bloc, error, stackTrace);
  }
}
