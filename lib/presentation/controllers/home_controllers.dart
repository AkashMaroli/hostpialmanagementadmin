import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var isDrawerOpen = true.obs;
  var drawerWidth = 280.obs;

  // Add state for doctor details (pending section)
  var isShowingDoctorDetails = false.obs;
  var selectedDoctorIndex = (-1).obs;

  // Add state for doctors section details
  var isShowingDoctorsSectionDetails = false.obs;
  var selectedDoctorsSectionDoctorIndex = (-1).obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    // Reset doctor details when changing sections
    isShowingDoctorDetails.value = false;
    selectedDoctorIndex.value = -1;
    isShowingDoctorsSectionDetails.value = false;
    selectedDoctorsSectionDoctorIndex.value = -1;
  }

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  // Method to show doctor details (pending section)
  void showDoctorDetails(int doctorIndex) {
    isShowingDoctorDetails.value = true;
    selectedDoctorIndex.value = doctorIndex;
  }

  // Method to go back to pending list
  void goBackToPendingList() {
    isShowingDoctorDetails.value = false;
    selectedDoctorIndex.value = -1;
  }

  // Method to show doctor details (doctors section)
  void showDoctorsSectionDetails(int doctorIndex) {
    isShowingDoctorsSectionDetails.value = true;
    selectedDoctorsSectionDoctorIndex.value = doctorIndex;
  }

  // Method to go back to doctors list
  void goBackToDoctorsList() {
    isShowingDoctorsSectionDetails.value = false;
    selectedDoctorsSectionDoctorIndex.value = -1;
  }
}
