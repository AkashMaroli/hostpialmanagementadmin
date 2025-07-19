import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/core/constants.dart';
import 'package:hospitalmanagementadmin/data/models/doctors_detail_model.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/home_controllers.dart';
import 'package:hospitalmanagementadmin/presentation/pages/doc_detail_screen/doc_detail_second_v.dart';

class DoctorsCard extends StatelessWidget {
  const DoctorsCard({super.key, required this.dataSample});

  final List<DoctorsProfileModel> dataSample;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount =
            constraints.maxWidth ~/ 250; // Approximately how many cards can fit
        crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount; // At least 1

        return GridView.builder(
          shrinkWrap:
              true, // Allows the GridView to take only the space it needs
          itemCount: dataSample.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10, // Add spacing between grid items
            mainAxisSpacing: 10, // Add spacing between rows
            mainAxisExtent: 380, // Fixed height instead of aspect ratio
          ),
          itemBuilder: (context, index) {
            final profile = dataSample[index];
            return GestureDetector(
              onTap: () {
                homeController.showDoctorsSectionDetails(index);
              },
              child: Card(
                color: scaffoldColorTheme,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(
                            3,
                          ), // Creates the border thickness
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(137, 215, 215, 215),
                              ),
                              BoxShadow(
                                color: const Color.fromARGB(136, 156, 156, 156),
                              ),
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ), // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.purple.shade100,
                            backgroundImage:
                                profile.photoUrl != null
                                    ? NetworkImage(profile.photoUrl!)
                                    : null,
                            child:
                                profile.photoUrl == null
                                    ? const Icon(
                                      Icons.person,
                                      color: Colors.purple,
                                      size: 40,
                                    )
                                    : null,
                          ),
                        ),

                        SizedBox(height: 10),
                        Text(
                          dataSample[index].fullName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          dataSample[index].qualification,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(204, 221, 232, 241),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            ' ${dataSample[index].department} ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
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
                              width: 1, // Width of the divider
                              height: 20, // Height of the divider
                              color: const Color.fromARGB(
                                255,
                                133,
                                133,
                                133,
                              ), // Divider color
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
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
                        SizedBox(height: 15),
                      ],
                    ),
                    Positioned(
                      top: 15,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(204, 255, 220, 179),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomRight: Radius.circular(3),
                          ),
                        ),
                        child: Text(
                          'N',
                          style: TextStyle(
                            color: const Color.fromRGBO(251, 168, 15, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SampleData {
  String photo;
  String name;
  String department;
  String schedule;
  String qualification;
  SampleData({
    required this.qualification,
    required this.photo,
    required this.department,
    required this.name,
    required this.schedule,
  });
}
