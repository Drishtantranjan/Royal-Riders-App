import 'package:flutter/material.dart';
import 'package:royal_riders_application/home/presentation/view/HomePage.dart';

import '../../../../../Common_widgets/TextFieldwithLable.dart';
import '../../../Common_widgets/Button.dart';

class Sign2 extends StatefulWidget {
  const Sign2({Key? key}) : super(key: key);

  @override
  _Sign2State createState() => _Sign2State();
}

class _Sign2State extends State<Sign2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController vRegistrationController = TextEditingController();
  final TextEditingController vModelController = TextEditingController();
  final TextEditingController vColorController = TextEditingController();
  final TextEditingController vNameController = TextEditingController();
  final TextEditingController vAgeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    vRegistrationController.dispose();
    vModelController.dispose();
    vColorController.dispose();
    vNameController.dispose();
    vAgeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.65, 0.98],
          colors: [Colors.black12, Color(0XFF737373)],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/SignUp/Group17.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                              bottomRight: Radius.circular(20))),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Lets know your Vehicle',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 3),
                const SizedBox(height: 15),
                TextFieldWithLabel(
                  label: 'Owner\'s Name',
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Vehicle registration Number',
                  controller: vRegistrationController,
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Vehicle Model Number',
                  controller: vModelController,
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Vehicle Color',
                  controller: vColorController,
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Vehicle Nickname (optional)',
                  controller: vNameController,
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Vehicle Age',
                  controller: vAgeController,
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  title: "Create account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
