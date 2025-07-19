// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hospitalmanagementadmin/data/models/doctors_detail_model.dart';

// Stream<List<DoctorsProfileModel>> fetchDoctors() {
//   return FirebaseFirestore.instance
//       .collection('doctors').where('admin_approved',isEqualTo:  false)
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => DoctorsProfileModel.fromFirestore(doc)).toList());
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/data/models/doctors_detail_model.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/global_controller.dart';

class JobRequestController extends GetxController {
  @override
  void onInit() {
    fetchJobRequests();
    departmentCollection();
    super.onInit();
  }

  //! Fetch doctors who are not verified yet
  void fetchJobRequests() {
    FirebaseFirestore.instance
        .collection('doctors')
        .where('admin_approved', isEqualTo: false)
        .snapshots()
        .listen((snapshot) {
          doctorRequests.value =
              snapshot.docs
                  .map((doc) => DoctorsProfileModel.fromFirestore(doc))
                  .toList();
        });
  }

  //! Approve doctor request
  void approveRequest(int index) {
    final doctorId = doctorRequests[index].id;
    if (doctorId == null) return;

    // Update Firestore first before modifying local state
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctorId)
        .update({'verified': true})
        .then((_) {
          // Only update list after Firestore update succeeds
          doctorRequests.removeAt(index);
          Get.snackbar(
            "Success",
            "Doctor Approved Successfully",
            snackPosition: SnackPosition.BOTTOM,
          );
        })
        .catchError((error) {
          // Get.snackbar("Error", "Failed to Approve: $error", snackPosition: SnackPosition.BOTTOM);
        });
  }

  departmentCollection() {
    FirebaseFirestore.instance.collection('departments').doc();
  }
}
