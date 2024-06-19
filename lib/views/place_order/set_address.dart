import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectAddreshOnMap extends StatefulWidget {
  const SelectAddreshOnMap({super.key});

  @override
  State<SelectAddreshOnMap> createState() => _SelectAddreshOnMapState();
}

class _SelectAddreshOnMapState extends State<SelectAddreshOnMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  Position? latLong;

  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(25.7006, 82.4484),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserLocation().then((value) {
      setState(() {});
      latLong = value;
    });
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PickUp Delivery Address"),
      ),
      body: latLong == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onTap: (value) {
                    var marker1 = Marker(
                         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), 
                        markerId:  MarkerId('place_name${value.latitude}'),
                        position: LatLng(value.latitude, value.longitude),
                      );

                      markers[ MarkerId('place_name${value.latitude}')] = marker1;
                      setState(() {
                        
                      });
                    },
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      var marker1 = Marker(
                         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), 
                        markerId: const MarkerId('place_name1'),
                        position: LatLng(latLong!.latitude, latLong!.longitude),
                      );

                      markers[const MarkerId('place_name1')] = marker1;
                      setState(() {
                        
                      });
                    },
                    markers: markers.values.toSet(),
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latLong!.latitude, latLong!.longitude),
                      zoom: 14.4746,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
