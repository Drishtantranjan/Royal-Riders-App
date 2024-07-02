import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:royal_riders_application/Common_widgets/appBar_with_divider.dart';
import 'package:royal_riders_application/Common_widgets/helpers.dart';
import 'package:royal_riders_application/Login&SignUp/data/hive_model/vehicle_model.dart';
import 'package:royal_riders_application/motorcycle/presentation/widget/textFieldwithLabelandDivider.dart';

class MotorcycleScreen extends StatefulWidget {
  const MotorcycleScreen({Key? key}) : super(key: key);

  @override
  _MotorcycleScreenState createState() => _MotorcycleScreenState();
}

class _MotorcycleScreenState extends State<MotorcycleScreen> {
  late Box<Vehicle> vehicleBox;
  Vehicle? vehicle;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    vehicleBox = Hive.box<Vehicle>('vehicleBox');
    if (vehicleBox.isNotEmpty) {
      vehicle = vehicleBox.getAt(0);
      fetchBikeImage(normalizeModelNumber(vehicle!.modelNumber),
          normalizeVehicleColor(vehicle!.color));
    }
  }

  Future<void> fetchBikeImage(String modelNumber, String color) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Bike_images')
          .doc(modelNumber)
          .get();

      if (snapshot.exists) {
        String fetchedUrl = snapshot.get(color);
        setState(() {
          imageUrl = fetchedUrl.startsWith('https') ? fetchedUrl : null;
        });
        if (imageUrl == null) {
          print('Invalid image URL: $fetchedUrl');
        }
      } else {
        print('No image found for this model number and color');
      }
    } catch (e) {
      print('Error fetching bike image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/SignUp/sign2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppbarWithDivider(
              title: "Garage Mode",
            ),
            if (vehicle != null) ...[
              TextFieldWithLabelandDivider(
                label: "Owner's name",
                value: vehicle!.name,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              TextFieldWithLabelandDivider(
                label: "Registration Number",
                value: vehicle!.registrationNumber,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              TextFieldWithLabelandDivider(
                label: "Model Name",
                value: vehicle!.modelName,
                width: MediaQuery.of(context).size.width * 0.27,
              ),
              TextFieldWithLabelandDivider(
                label: "Model Number",
                value: vehicle!.modelNumber,
                width: MediaQuery.of(context).size.width * 0.24,
              ),
              TextFieldWithLabelandDivider(
                label: "Vehicle color",
                value: vehicle!.color,
                width: MediaQuery.of(context).size.width * 0.27,
              ),
            ] else ...[
              const Text('No vehicle data available')
            ],
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    vehicle!.modelNumber + ', ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    vehicle!.color,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            imageUrl != null
                ? Image.network(convertGoogleDriveUrl(imageUrl!))
                : const Text('No image available for this bike'),
            Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                vehicle!.nickname,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
