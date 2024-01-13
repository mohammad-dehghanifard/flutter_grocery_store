import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.onSelected});
  final Function(String latlang) onSelected;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.back();
        showSnackBar(message: "شما دسترسی های لازم را به اپلیکیشن ندادید!", type: SnackBarType.error);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    selectedPosition = LatLng(position.latitude, position.longitude);
    mapController.move(LatLng(position.latitude, position.longitude), 15);
    markers.add(Marker(point: LatLng(position.latitude, position.longitude), child: Icon(Icons.location_on,color: Theme.of(context).primaryColor)));
    setState(() {});
  }
  List<Marker> markers = [];
  LatLng? selectedPosition;


  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: "انتخاب آدرس روی نقشه"),
            // map
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FlutterMap(
                    mapController: mapController,
                    options:  MapOptions(
                      onTap: (tapPosition, point) {
                        markers.clear();
                        markers.add(Marker(point: point, child: Icon(Icons.location_on,color: Theme.of(context).primaryColor)));
                        selectedPosition = point;
                        setState(() {});
                      },
                      initialCenter: const LatLng(35.7077402, 51.1828482),
                      initialZoom: 14,
                    ),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                      MarkerLayer(markers: markers)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10 ),
              child: ButtonWidget(
                  onPress: () {
                     widget.onSelected("${selectedPosition?.latitude},${selectedPosition?.longitude}");
                     Get.back();
                  },
                  text: "ثبت موقعیت مکانی"),
            )
          ],
        ),
      ),
    );
  }
}
