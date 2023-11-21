import 'package:assignment_project/core/database/cache_helper.dart';
import 'package:assignment_project/features/products/presentation/controller/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }
}

_buildBody() {
  final LocationController controller = Get.put(LocationController());
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              OpenStreetMapSearchAndPick(
                  zoomInIcon: CupertinoIcons.zoom_in,
                  zoomOutIcon: CupertinoIcons.zoom_out,
                  center: LatLong(controller.lat.value, controller.long.value),
                  buttonColor: Colors.blue,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    controller.lat.value = pickedData.latLong.latitude;
                    controller.long.value = pickedData.latLong.longitude;
                    Get.find<CacheHelper>().saveData(
                        key: 'lat', value: pickedData.latLong.latitude);
                    Get.find<CacheHelper>().saveData(
                        key: 'long', value: pickedData.latLong.longitude);

                    controller.pickedCity.value = pickedData.addressName;

                    Get.back();
                  }),
              isScrollControlled: true,
            );
          },
          child: const Text('Open Map'),
        ),
        Obx(
          () => Text(
            controller.pickedCity.value,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
