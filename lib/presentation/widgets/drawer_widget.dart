import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/core/constants.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/home_controllers.dart';
import 'package:hospitalmanagementadmin/presentation/pages/Departments/departments_screen.dart';
import 'package:hospitalmanagementadmin/presentation/pages/appointments/appointments.dart';
import 'package:hospitalmanagementadmin/presentation/pages/doctors/doctors_section.dart';
import 'package:hospitalmanagementadmin/presentation/pages/help_center/help_center.dart';
import 'package:hospitalmanagementadmin/presentation/pages/home/hospital_perfomance_dashboard.dart';
import 'package:hospitalmanagementadmin/presentation/pages/patients/patient_records.dart';
import 'package:hospitalmanagementadmin/presentation/pages/payments/payments.dart';
import 'package:hospitalmanagementadmin/presentation/pages/pendings/pending_section.dart';
import 'package:hospitalmanagementadmin/presentation/pages/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  final List<String> _sectionTitles = [
    'Hospital Performance',
    // 'Staff Management',
    'Doctors',
    'Appointments',
    'Patients ',
    'Payments',
    'Departments',
    'Help & Center',
    'Settings',
    'Pending ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColorTheme,
      body: Row(
        children: [
          //! Sidebar Drawer
          Obx(
            () => AnimatedContainer(
              color: Colors.white,
              duration: const Duration(milliseconds: 300),
              width: controller.isDrawerOpen.value ? 280 : 70,
              onEnd: () {
                controller.drawerWidth.value =
                    controller.isDrawerOpen.value ? 280 : 70;
              },
              child: Drawer(
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            controller.isDrawerOpen.value
                                ? Icons.close_fullscreen_rounded
                                : Icons.menu,
                          ),
                          onPressed: controller.toggleDrawer,
                        ),
                        const SizedBox(width: 13),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _sectionTitles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Obx(
                              () => ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                leading: SizedBox(
                                  width: 24,
                                  child: Icon(
                                    _getIconForIndex(index),
                                    color:
                                        controller.selectedIndex.value == index
                                            ? Color(0xFF6E56F8)
                                            : Colors.grey,
                                  ),
                                ),
                                title: SizedBox(
                                  height: 24,
                                  child: AnimatedOpacity(
                                    opacity:
                                        controller.drawerWidth.value > 200
                                            ? 1.0
                                            : 0.0,
                                    duration: Duration(milliseconds: 150),
                                    child: Text(
                                      _sectionTitles[index],
                                      style: TextStyle(
                                        color:
                                            controller.selectedIndex.value ==
                                                    index
                                                ? Color(0xFF6E56F8)
                                                : Colors.grey,
                                        fontWeight:
                                            controller.selectedIndex.value ==
                                                    index
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                selected:
                                    controller.selectedIndex.value == index,
                                onTap: () => controller.changeIndex(index),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                   
                  ],
                ),
              ),
            ),
          ),

          //! Main Section
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                 
                  Expanded(
                    child: _getBodyForIndex(controller.selectedIndex.value),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.person_rounded;
      case 2:
        return Icons.today;
      case 3:
        return Icons.groups_sharp;
      case 4:
        return Icons.payments;
      case 5:
        return Icons.schema;
      case 6:
        return Icons.help_center;

      case 7:
        return Icons.settings;
      case 8:
        return Icons.pending_actions;
      default:
        return Icons.error;
    }
  }

  Widget _getBodyForIndex(int index) {
    switch (index) {
      case 0:
        return DashboardScreen();
      case 1:
        return DoctorsScreen();
      case 2:
        return AppointmentsScreen();
      case 3:
        return PatientsScreen();
      case 4:
        return InvoiceListScreen();
      case 5:
        return DepartmentsScreen();
      case 6:
        return HelpCenterScreen();
      case 7:
        return SettingsScreen();
      case 8:
        return PendingsScreen();

      default:
        return const Center(child: Text('Section not found'));
    }
  }
}
