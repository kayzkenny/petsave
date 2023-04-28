import 'package:animals_near_you/animals_near_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class RequestLocationPermissionPage extends ConsumerWidget {
  const RequestLocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/creature_dog-and-bone.png",
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'To find pets near you, first you need to share your current location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final permission = await Geolocator.requestPermission();
              if (permission == LocationPermission.whileInUse ||
                  permission == LocationPermission.always) {
                ref.invalidate(locationPermissionProvider);
              }

              if (permission == LocationPermission.deniedForever) {
                await Geolocator.openAppSettings();
                await Geolocator.openLocationSettings();
              }
            },
            icon: Icon(Icons.near_me),
            label: Text('Share Location'),
          ),
        ],
      ),
    );
  }
}
