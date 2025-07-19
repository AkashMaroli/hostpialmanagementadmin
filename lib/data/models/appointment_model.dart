
import 'package:hospitalmanagementadmin/domain/appointment_status_enum.dart';

class AppointmentModel {
  final String userId;
  final String doctorId;
  final bool consultationType; // true = video, false = direct
  final String patientName;
  final String reason;
  final DateTime createdTime;
  final DateTime updatedTime;
  final AppointmentStatus appointmentStatus;
  final bool appointmentConfirmed;

  AppointmentModel({
    required this.userId,
    required this.doctorId,
    required this.consultationType,
    required this.patientName,
    required this.reason,
    required this.createdTime,
    required this.updatedTime,
    required this.appointmentStatus,
    required this.appointmentConfirmed,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      userId: json['user_id'] ?? '',
      doctorId: json['doctor_id'] ?? '',
      consultationType: json['consultation_type'] ?? false,
      patientName: json['patient_name'] ?? '',
      reason: json['reason'] ?? '',
      createdTime: DateTime.tryParse(json['created_time'] ?? '') ?? DateTime.now(),
      updatedTime: DateTime.tryParse(json['updated_time'] ?? '') ?? DateTime.now(),
      appointmentStatus: appointmentStatusFromString(json['appointment_status'] ?? ''),
      appointmentConfirmed: json['appointment_confirmed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'doctor_id': doctorId,
      'consultation_type': consultationType,
      'patient_name': patientName,
      'reason': reason,
      'created_time': createdTime.toIso8601String(),
      'updated_time': updatedTime.toIso8601String(),
      'appointment_status': appointmentStatusToString(appointmentStatus),
      'appointment_confirmed': appointmentConfirmed,
    };
  }
}
