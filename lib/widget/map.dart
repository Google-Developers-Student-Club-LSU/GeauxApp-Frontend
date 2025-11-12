import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geaux_app_frontend/constant.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _mapController;

  final LatLng _center = const LatLng(30.4120, -91.1838);

  late final Set<Polygon> _polygons = {
    const Polygon(
      polygonId: PolygonId('focus-area'),
      points: lsuCampus, // assuming this is a const List<LatLng> in constant.dart
      fillColor: Colors.transparent,
      strokeColor: Color(0xFF3F51B5),
      strokeWidth: 2,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      return const Center(
        child: Text(
          'Missing GOOGLE_MAPS_API_KEY in .env',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return GoogleMap(
      onMapCreated: (controller) {
        _mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 14.11, 
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      polygons: _polygons,
    );
  }
}
