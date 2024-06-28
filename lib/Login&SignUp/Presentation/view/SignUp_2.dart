import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_state.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_2%20Cubit/sign2_cubit.dart';
import 'package:royal_riders_application/home/presentation/view/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Common_widgets/TextFieldwithLable.dart';
import '../../../Common_widgets/Button.dart';
import 'dart:ui';

class Sign2 extends StatefulWidget {
  const Sign2({Key? key}) : super(key: key);

  @override
  _Sign2State createState() => _Sign2State();
}

class _Sign2State extends State<Sign2> {
  bool _isAgreed = false;
  int? _value;

  @override
  void initState() {
    super.initState();
    _loadToggleValue();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTermsAndConditionsDialog(context);
    });
  }

  _loadToggleValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = prefs.getInt('toggleValue') ?? 0;
    });
  }

  void _toggleValue(int? val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = val;
      prefs.setInt('toggleValue', _value!);
      print("Value is : $_value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedInState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        child: BlocProvider(
          create: (context) => Sign2Cubit(),
          child: BlocBuilder<Sign2Cubit, void>(
            builder: (context, state) {
              final sign2Cubit = context.read<Sign2Cubit>();

              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/SignUp/sign2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            Row(
                              children: [
                                Container(
                                  height: 5,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      25,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 5,
                                  color: Colors.transparent,
                                ),
                                Container(
                                  height: 5,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      25,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              'Lets know your Vehicle',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const SizedBox(height: 15),
                            TextFieldWithLabel(
                              label: 'Owner\'s Name',
                              controller: sign2Cubit.nameController,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWithLabel(
                              label: 'Vehicle registration Number',
                              controller: sign2Cubit.vRegistrationController,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWithLabel(
                              label: 'Vehicle Model Number',
                              controller: sign2Cubit.vModelController,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWithLabel(
                              label: 'Vehicle Color',
                              controller: sign2Cubit.vColorController,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWithLabel(
                              label: 'Vehicle Nickname (optional)',
                              controller: sign2Cubit.vNameController,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWithLabel(
                              label: 'Vehicle Age',
                              controller: sign2Cubit.vAgeController,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  activeColor: Colors.white,
                                  onChanged: _toggleValue,
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                if (state is AuthLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                }
                                return RoundedButton(
                                  title: "Create account",
                                  onPressed: () {
                                    sign2Cubit.createAccount();
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                      );
                                    });
                                  },
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      if (_isAgreed == false)
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showTermsAndConditionsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        '1. By using this app, you agree to the collection and use of your vehicle information to improve app functionality and user experience. ',
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                      SizedBox(height: 10),
                      Text(
                          '2. Your data will be protected and not shared with third parties without your consent. By proceeding, you acknowledge and accept these terms.'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        child: const Text(
                          'Disagree',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the sign-up page
                        },
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        child: const Text(
                          'Agree',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            _isAgreed = true;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
