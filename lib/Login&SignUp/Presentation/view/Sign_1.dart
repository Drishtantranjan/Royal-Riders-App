import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_riders_application/Common_widgets/Button.dart';
import 'package:royal_riders_application/Home/presentation/view/HomePage.dart';
import 'package:royal_riders_application/Login&SignUp/Cubit/auth_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/Cubit/auth_state.dart';
import 'package:royal_riders_application/Login&SignUp/Presentation/view/SignUp_2.dart';
import 'OtpFieldwithLabel.dart';
import '../../../../../Common_widgets/TextFieldwithLable.dart';

class Sign1 extends StatefulWidget {
  const Sign1({Key? key}) : super(key: key);

  @override
  _Sign1State createState() => _Sign1State();
}

class _Sign1State extends State<Sign1> {
  bool _isLoading = false;
  bool _phoneNumberFilled = false;
  bool _phoneNumberError = false;
  bool _showOTPField = false;
  String _phoneNumberErrorMessage = '';
  int _buttonPressed = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  errorText:
                      _phoneNumberError ? _phoneNumberErrorMessage : null,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthCodeSentState) {
                      setState(() {
                        _buttonPressed = 1;
                        _showOTPField = true;
                      });
                    } else if (state is AuthLoggedInState) {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => Sign2()),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    return Column(
                      children: [
                        if (_showOTPField) ...[
                          Otpfieldwithlabel(
                            label: "Enter OTP",
                            controller: _otpController,
                          ),
                          const SizedBox(height: 20),
                          RoundedButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            title: "Verify Number",
                            onPressed: () {
                              String otp = _otpController.text;
                              BlocProvider.of<AuthCubit>(context)
                                  .verifyOTP(otp);
                            },
                          ),
                        ] else ...[
                          RoundedButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            title: "Send OTP",
                            onPressed: () {
                              String phoneNumber = _phoneController.text;
                              BlocProvider.of<AuthCubit>(context)
                                  .sentOTP(phoneNumber);
                            },
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/SignUp/loader.gif'),
              ),
            ),
        ],
      ),
    );
  }
}
