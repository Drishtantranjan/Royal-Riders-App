import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_riders_application/Common_widgets/Button.dart';
import 'package:royal_riders_application/Common_widgets/RideContainer.dart';
import 'package:royal_riders_application/Community/Bloc/Community_bloc.dart';
import 'package:royal_riders_application/Community/Bloc/Community_events.dart';
import 'package:royal_riders_application/Community/Bloc/Community_states.dart';
import 'package:shimmer/shimmer.dart';

class MyRidesScreen extends StatelessWidget {
  MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselBloc()..add(LoadCarouselImages()),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                if (state is CarouselLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      color: Colors.white,
                    ),
                  );
                } else if (state is CarouselLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                    items: state.images
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
                } else if (state is CarouselError) {
                  return Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.white),
                  );
                }
                return Container(); // Placeholder for initial state
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
      ),
    );
  }
}
