import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapboxMapPage extends StatefulWidget {
  @override
  _MapboxMapPageState createState() => _MapboxMapPageState();
}

class _MapboxMapPageState extends State<MapboxMapPage> {
  MapboxMapController? mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Service Center'),
      ),
      body: MapboxMap(
        accessToken: 'YOUR_MAPBOX_ACCESS_TOKEN',
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              37.7749, -122.4194), // Set to your desired initial location
          zoom: 10,
        ),
      ),
    );
  }
}
