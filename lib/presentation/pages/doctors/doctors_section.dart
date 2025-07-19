import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/doctors_controller.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/home_controllers.dart';
import 'package:hospitalmanagementadmin/presentation/widgets/doctors_card_widget.dart';
import 'package:hospitalmanagementadmin/presentation/pages/doc_detail_screen/doc_detail_second_v.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorsController controller = Get.put(DoctorsController());
    final HomeController homeController = Get.find<HomeController>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button when showing doctor details
            Obx(() {
              if (homeController.isShowingDoctorsSectionDetails.value) {
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        homeController.goBackToDoctorsList();
                      },
                    ),
                    const Text(
                      'Doctor Detailss',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              } else {
                return const Text(
                  'Doctors',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              }
            }),
            const SizedBox(height: 10),

            // Content area
            Expanded(
              child: Obx(() {
                if (homeController.isShowingDoctorsSectionDetails.value) {
                  // Show doctor details
                  final doctorIndex =
                      homeController.selectedDoctorsSectionDoctorIndex.value;
                  if (doctorIndex >= 0 &&
                      doctorIndex < controller.doctorsList.length) {
                    final profile = controller.doctorsList[doctorIndex];
                    return DoctorDetailsScreen();
                  } else {
                    return const Center(child: Text("Doctor not found"));
                  }
                } else {
                  // Show doctors list with tabs
                  return Column(
                    children: [
                      // Tab Bar
                      GetBuilder<DoctorsController>(
                        builder: (controller) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TabBar(
                              controller: controller.tabController,
                              labelColor: Colors.purple,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.purple,
                              tabs:
                                  controller.departments
                                      .map((dept) => Tab(text: dept))
                                      .toList(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),

                      // Tab Bar View
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabController,
                          children:
                              controller.departments.map((dept) {
                                return Obx(() {
                                  if (controller.doctorsList.isEmpty) {
                                    return const Center(
                                      child: Text("No doctors available"),
                                    );
                                  }
                                  return DoctorsCard(
                                    dataSample: controller.doctorsList,
                                  );
                                });
                              }).toList(),
                        ),
                      ),
                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
