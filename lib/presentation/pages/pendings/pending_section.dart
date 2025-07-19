import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/data/services/data_base_services.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/global_controller.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/home_controllers.dart';
import 'package:hospitalmanagementadmin/presentation/pages/doc_detail_screen/doc_detail_second_v.dart';
import 'package:hospitalmanagementadmin/presentation/widgets/job_request_widget.dart';

class PendingsScreen extends StatelessWidget {
  final JobRequestController controller = Get.put(JobRequestController());
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with back button when showing doctor details
          Obx(() {
            if (homeController.isShowingDoctorDetails.value) {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      homeController.goBackToPendingList();
                    },
                  ),
                  const Text(
                    'Doctor Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            } else {
              return const Text(
                'Under Review',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }
          }),
          const SizedBox(height: 10),

          // Content area
          Expanded(
            child: Obx(() {
              if (homeController.isShowingDoctorDetails.value) {
                // Show doctor details using the actual DoctorProfileDetailScreen
                final doctorIndex = homeController.selectedDoctorIndex.value;
                if (doctorIndex >= 0 && doctorIndex < doctorRequests.length) {
                  final profile = doctorRequests[doctorIndex];
                  return DoctorDetailsScreen();
                } else {
                  return const Center(child: Text("Doctor not found"));
                }
              } else {
                // Show pending list
                if (doctorRequests.isEmpty) {
                  return const Center(child: Text("No profiles found"));
                }
                return JobRequestWidget();
              }
            }),
          ),
        ],
      ),
    );
  }
}
