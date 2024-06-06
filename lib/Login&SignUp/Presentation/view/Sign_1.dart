import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:royal_riders_application/Common_widgets/Button.dart';
import 'OtpFieldwithLabel.dart';
import 'SignUp_2.dart';
import '../../../../../Common_widgets/TextFieldwithLable.dart';

class Sign1 extends StatefulWidget {
  const Sign1({Key? key}) : super(key: key);

  @override
  _Sign1State createState() => _Sign1State();
}

class _Sign1State extends State<Sign1> {
  // ignore: unused_field
  bool _isLoading = false;
  bool _phoneNumberFilled = false;
  bool _phoneNumberError = false;
  String _phoneNumberErrorMessage = '';
  int _buttonPressed = 0;
  // ignore: unused_field
  int _resendOTPTimerDuration = 30;
  String _verificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController =
      TextEditingController(text: "+91");
  final TextEditingController _otpController = TextEditingController();
  FocusNode _otpFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _resendOTPTimerDuration = 30;
    });
    print('ph number ${_phoneController.text}');
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to verify phone number: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        print('otp sent true');
        _verificationId = verificationId;

        print(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _handleVerifyButtonPressed() {
    RegExp phoneNumberRegExp = RegExp(r'^\+[0-9]{12}$');
    if (_phoneController.text.isEmpty) {
      setState(() {
        _phoneNumberError = true;
        _phoneNumberErrorMessage = 'Field cannot be empty';
      });
    } else if (phoneNumberRegExp.hasMatch(_phoneController.text)) {
      if (_buttonPressed == 0) {
        _verifyPhoneNumber();
        setState(() {
          _buttonPressed = 1;
        });
      } else {
        _signInWithOTP();
      }
    } else {
      setState(() {
        _phoneNumberError = true;
        _phoneNumberErrorMessage = 'Invalid phone number';
      });
    }
  }

  Future<void> _signInWithOTP() async {
    try {
      setState(() {
        _isLoading = true;
      });

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );
      print('SMS Code: ${_otpController.text}');

      await _auth.signInWithCredential(credential);

      // Simulate a delay for the loader
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Sign2()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.48),
            const Text(
              'Welcome, Sign Up',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 3),
            const Text(
              'Lets Ride together!',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            TextFieldWithLabel(
              controller: _phoneController,
              label: 'Phone Number',
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _phoneNumberFilled = value.length >= 13;
                  _phoneNumberError = false;
                });
                if (value.length > 12) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
                if (!value.startsWith("+91")) {
                  _phoneController.value = TextEditingValue(
                    text: "+91" + value,
                    selection:
                        TextSelection.collapsed(offset: value.length + 4),
                  );
                }
              },
              errorText: _phoneNumberError ? _phoneNumberErrorMessage : null,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            if (_phoneNumberFilled)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Otpfieldwithlabel(
                    label: "Enter OTP",
                    controller: _otpController,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            const SizedBox(height: 20),
            RoundedButton(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              title: _buttonPressed == 0 ? "Send OTP" : "Verify Number",
              onPressed: _handleVerifyButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
