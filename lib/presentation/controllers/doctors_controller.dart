import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospitalmanagementadmin/data/models/doctors_detail_model.dart';

class DoctorsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  
  final List<String> departments = [
    'All', 'Cardiology', 'Orthopedics', 'Dermatology', 'Gynecology', 'ENT'
  ];

  var selectedTabIndex = 0.obs;
  var doctorsList = <DoctorsProfileModel>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: departments.length, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
      fetchDoctors(department: departments[selectedTabIndex.value]);
    });
    fetchDoctors();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  //! Fetch doctors from Firestore based on selected department
  void fetchDoctors({String? department}) {
    Query query = FirebaseFirestore.instance.collection('doctors').where('verified', isEqualTo: true);

    if (department != null && department != 'All') {
      query = query.where('department', isEqualTo: department);
    }

    query.snapshots().listen((snapshot) {
      doctorsList.value = snapshot.docs
          .map((doc) => DoctorsProfileModel.fromFirestore(doc))
          .toList();
    });
  }
}
