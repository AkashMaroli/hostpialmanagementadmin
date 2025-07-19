import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/core/constants.dart';
import 'package:hospitalmanagementadmin/data/services/data_base_services.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/global_controller.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/home_controllers.dart';

class JobRequestWidget extends StatelessWidget {
  JobRequestWidget({super.key});

  final JobRequestController controller = Get.put(JobRequestController());
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth ~/ 250;
        crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

        return Obx(() {
          if (doctorRequests.isEmpty) {
            return const Center(child: Text("No Job Requests Available"));
          }

          return GridView.builder(
            shrinkWrap: true,
            itemCount: doctorRequests.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 380,
            ),
            itemBuilder: (context, index) {
              final profile = doctorRequests[index];

              return GestureDetector(
                onTap: () {
                  homeController.showDoctorDetails(index);
                },
                child: Card(
                  color: scaffoldColorTheme,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.purple.shade100,
                        backgroundImage:
                            (profile.photoUrl ?? '').isNotEmpty
                                ? NetworkImage(profile.photoUrl)
                                : null,
                        child:
                            (profile.photoUrl ?? '').isEmpty
                                ? const Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                  size: 40,
                                )
                                : null,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        profile.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        profile.qualification,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(204, 221, 232, 241),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          ' ${profile.department} ',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Approve Button
                      ElevatedButton(
                        onPressed:
                            profile.adminApproved
                                ? null
                                : () => controller.approveRequest(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              profile.adminApproved
                                  ? Colors.grey
                                  : Colors.white,
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          profile.adminApproved ? 'Approved' : 'Approve',
                        ),
                      ),

                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.calendar_today,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Availability',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 20,
                            color: Color.fromARGB(255, 133, 133, 133),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.phone, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                'Make a call',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
