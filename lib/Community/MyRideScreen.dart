import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Common_widgets/Button.dart';
import '../Common_widgets/RideContainer.dart';

class MyRidesScreen extends StatelessWidget {
  MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Assets')
                .doc('Carousel_Images')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                );
              }
              print(
                'Error: ${snapshot.error}',
              );
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              List<String> imgList =
                  List<String>.from(snapshot.data!.get('Images'));
              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                items: imgList
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Join Rides",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const RideContainer(),
          const SizedBox(height: 10),
          RoundedButton(title: "Create Rides", onPressed: () {}),
        ],
      ),
    );
  }
}
