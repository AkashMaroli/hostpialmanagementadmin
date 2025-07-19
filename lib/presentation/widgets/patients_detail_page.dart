import 'package:flutter/material.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Patient Info Card
            _buildPatientInfoCard(),
            const SizedBox(height: 16),

            // Middle Row with Contact and General Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContactInfoCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildGeneralInfoCard()),
              ],
            ),
            const SizedBox(height: 16),

            // Row with Patient Notes and Appointment
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildPatientNotesCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildAppointmentsCard()),
              ],
            ),
            const SizedBox(height: 16),

            // Last Updated Row
            _buildLastUpdatedRow(),
            const SizedBox(height: 16),

            // Medical Info Card
            _buildMedicalInfoCard(),
            const SizedBox(height: 16),

            // Blood Test Files
            _buildBloodTestFiles(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const NetworkImage(
                "https://placehold.co/400x400/png",
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Suriya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      'Patient ID: ',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const Text('309', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Active',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.black54,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black54),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contact Info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black54),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Phone Number
            const Text(
              'Phone number',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            const Text('+18 555-124-4567', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            // Email
            const Text(
              'Email',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            const Text('Joseph2002@gmail.com', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            // Address
            const Text(
              'Address',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            const Text(
              'No.123, New street, Anna Nagar, Chennai, Tamil Nadu, India.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),

            // Emergency Contact
            const Text(
              'Emergency Contact',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            const Text('John - Brother', style: TextStyle(fontSize: 14)),
            const Text('+18 998-888-4221', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'General Info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black54),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Gender Row
            _buildInfoRow('Gender', 'Male', 'Blood', 'O+ve'),
            const SizedBox(height: 16),

            // Age Row
            _buildInfoRow('Age', '35', 'Diagnosis', 'Heart Attack'),
            const SizedBox(height: 16),

            // DOB Row
            _buildInfoRow('Date of Birth', '1995', 'Insurance', 'WellPride'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String label1,
    String value1,
    String label2,
    String value2,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label1,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(value1, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label2,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(value2, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPatientNotesCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Patient Notes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Hypertension Note
            _buildNoteItem(
              title: 'Hypertension',
              description:
                  'Advise the patient to engage in light and monitor blood press weekly.',
            ),
            const SizedBox(height: 12),

            // Asthma Note
            _buildNoteItem(
              title: 'Asthma',
              description:
                  'Ensure the patient always carries an inhaler and avoids severe triggers.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteItem({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(color: Colors.black87, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildAppointmentsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black54),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Upcoming Text
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Upcoming',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 8),

            // Dr. Rahul Appointment
            _buildAppointmentItem(
              doctorName: 'Dr. Rahul',
              date: 'Fri, 05 July 2025—09:00 AM',
              type: 'Routine Check Up',
              status: 'Confirmed',
              statusColor: Colors.green,
            ),
            const SizedBox(height: 16),

            // History Text
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'History',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 8),

            // Dr. Amutha Appointment
            _buildAppointmentItem(
              doctorName: 'Dr. Amutha',
              date: 'Fri, 05 July 2025—09:00 AM',
              type: 'Cardiac Consultation',
              status: 'Completed',
              statusColor: Colors.grey,
            ),
            const SizedBox(height: 12),

            // Dr. Rahul Previous Appointment
            _buildAppointmentItem(
              doctorName: 'Dr. Rahul',
              date: 'Sun, 17 July 2025—09:00 AM',
              type: 'Routine Check Up',
              status: 'Completed',
              statusColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentItem({
    required String doctorName,
    required String date,
    required String type,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doctorName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            type,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLastUpdatedRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: const [
          Text(
            'Last Updated ON: 15 June, 2025, 10:45 AM',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medical Info',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.height,
                    iconColor: Colors.teal,
                    label: 'Body Height',
                    value: '5 ft 1.5 in',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.monitor_weight_outlined,
                    iconColor: Colors.blue,
                    label: 'Body Weight',
                    value: '140 lbs',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.accessibility_new,
                    iconColor: Colors.purple,
                    label: 'Body Mass Index',
                    value: '26.4',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.favorite_outline,
                    iconColor: Colors.red,
                    label: 'Heart Rate',
                    value: '72 bpm',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.speed,
                    iconColor: Colors.cyan,
                    label: 'Blood Pressure',
                    value: '120/80 mmHg',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.blue,
                    label: 'Blood Sugar',
                    value: '90 mg/dL',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.analytics_outlined,
                    iconColor: Colors.amber,
                    label: 'Cholesterol',
                    value: '180 mg/DL',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.air,
                    iconColor: Colors.blue,
                    label: 'Respiratory',
                    value: '16 b/m',
                  ),
                ),
                Expanded(
                  child: _buildMedicalInfoItem(
                    icon: Icons.bloodtype_outlined,
                    iconColor: Colors.red,
                    label: 'Hemoglobin',
                    value: '14 g/dL',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalInfoItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBloodTestFiles() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black54),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Blood Test Files List
            for (int i = 1; i <= 4; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildBloodTestFileItem(
                  fileName: 'Blood_test_2025_05_pdf',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTestFileItem({required String fileName}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf, color: Colors.red.shade400, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(fileName, style: const TextStyle(fontSize: 14))),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
