import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  AuthCubit() : super(AuthInitialState());

  String? _verificationId;

  void sentOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        sendPushNotification();
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  Future<void> sendPushNotification() async {
    try {
      final String serverToken = 'YOUR_SERVER_KEY_HERE';
      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'Account created successfully!',
              'title': 'Account Creation'
            },
            'priority': 'high',
            'to': await _messaging.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Notification sent successfully");
      } else {
        print("Notification failed to send");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
