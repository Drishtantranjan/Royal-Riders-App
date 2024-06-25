import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive/hive.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_1%20Cubit/auth_state.dart';
import 'package:royal_riders_application/Login&SignUp/Sign_2%20Cubit/sign2_cubit.dart';
import 'package:royal_riders_application/Login&SignUp/data/hive_model/vehicle_model.dart';
import 'package:royal_riders_application/home/presentation/view/HomePage.dart';
import '../../../../../Common_widgets/TextFieldwithLable.dart';
import '../../../Common_widgets/Button.dart';

class Sign2 extends StatelessWidget {
  const Sign2({Key? key}) : super(key: key);

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/SignUp/sign2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width / 2 - 25,
                              decoration: BoxDecoration(
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
                              width: MediaQuery.of(context).size.width / 2 - 25,
                              decoration: BoxDecoration(
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
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }
                            return RoundedButton(
                              title: "Create account",
                              onPressed: () {
                                sign2Cubit.createAccount();
                              },
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
