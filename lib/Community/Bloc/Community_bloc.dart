import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royal_riders_application/Community/Bloc/Community_events.dart';
import 'package:royal_riders_application/Community/Bloc/Community_states.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<LoadCarouselImages>((event, emit) async {
      emit(CarouselLoading());
      try {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('Assets')
            .doc('Carousel_Images')
            .get();

        List<String> imgList = List<String>.from(snapshot.get('Images'));
        emit(CarouselLoaded(imgList));
      } catch (error) {
        emit(CarouselError(error.toString()));
      }
    });
  }
}
