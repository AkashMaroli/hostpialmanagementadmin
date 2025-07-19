import 'package:flutter/material.dart';



class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String mobile;
  final String department;
  final DateTime dateInfo;
  final TimeOfDay appointmentTime;
  final String status;
  final String avatarUrl;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.mobile,
    required this.department,
    required this.dateInfo,
    required this.appointmentTime,
    required this.status,
    required this.avatarUrl,
  });
}

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  late List<Patient> _patients;
  String _activeTab = 'Patients Records';
  bool _selectAll = false;
  final List<String> _selectedPatients = [];

  @override
  void initState() {
    super.initState();
    // Load dynamic data
    _patients = _getDummyPatients();
  }

  List<Patient> _getDummyPatients() {
    // This would typically come from an API or database
    return [
      Patient(
        id: '1',
        name: 'Ronald Richards',
        age: 42,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Orthopaedic',
        dateInfo: DateTime(2024, 7, 27),
        appointmentTime: const TimeOfDay(hour: 11, minute: 30), 
        status: 'Completed',
        avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      ),
      Patient(
        id: '2',
        name: 'Ralph Edwards',
        age: 56,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Neurology',
        dateInfo: DateTime(2024, 7, 27),
        appointmentTime: const TimeOfDay(hour: 12, minute: 01),
        status: 'Completed',
        avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      ),
      Patient(
        id: '3',
        name: 'Bessie Allison',
        age: 38,
        gender: 'Female',
        mobile: '+91 3355 8462',
        department: 'Cardiology',
        dateInfo: DateTime(2024, 7, 27),
        appointmentTime: const TimeOfDay(hour: 2, minute: 48),
        status: 'Completed',
        avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      ),
      Patient(
        id: '4',
        name: 'Jerome Bell',
        age: 55,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Orthopaedic',
        dateInfo: DateTime(2024, 7, 27),
        appointmentTime: const TimeOfDay(hour: 20, minute: 20),
        status: 'Completed',
        avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      ),
      Patient(
        id: '5',
        name: 'Jane Cooper',
        age: 32,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Radiology',
        dateInfo: DateTime(2024, 7, 28),
        appointmentTime: const TimeOfDay(hour: 1, minute: 08),
        status: 'Today',
        avatarUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      ),
      Patient(
        id: '6',
        name: 'Jenny Wilson',
        age: 42,
        gender: 'Female',
        mobile: '+91 3355 8462',
        department: 'Dentist',
        dateInfo: DateTime(2024, 7, 28),
        appointmentTime: const TimeOfDay(hour: 5, minute: 14),
        status: 'Today',
        avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      ),
      Patient(
        id: '7',
        name: 'Savannah Nguyen',
        age: 24,
        gender: 'Female',
        mobile: '+91 3355 8462',
        department: 'Radiology',
        dateInfo: DateTime(2024, 7, 28),
        appointmentTime: const TimeOfDay(hour: 2, minute: 30),
        status: 'Today',
        avatarUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
      ),
      Patient(
        id: '8',
        name: 'Darrell Steward',
        age: 38,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Cardiology',
        dateInfo: DateTime(2024, 7, 28),
        appointmentTime: const TimeOfDay(hour: 12, minute: 23),
        status: 'Pending',
        avatarUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      ),
      Patient(
        id: '9',
        name: 'Wendy Raza',
        age: 59,
        gender: 'Male',
        mobile: '+91 3355 8462',
        department: 'Dentist',
        dateInfo: DateTime(2024, 7, 28),
        appointmentTime: const TimeOfDay(hour: 5, minute: 35),
        status: 'Pending',
        avatarUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
      ),
    ];
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade100;
      case 'today':
        return Colors.blue.shade100;
      case 'pending':
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'today':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
       Expanded(
         child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTabBar(),
              const SizedBox(height: 16),
              Expanded(
                child: _activeTab == 'Patients Records' 
                  ? _buildPatientsRecordsView() 
                  : _activeTab == 'Add Details' 
                    ? _buildAddDetailsView()
                    : _buildEditDetailsView(),
              ),
            ],
          ),
               ),
       );
    
  }

  Widget _buildPatientsRecordsView() {
    return Column(
      children: [
        _buildTableHeader(),
        Expanded(
          child: _buildPatientList(),
        ),
    //    _buildPagination(),
      ],
    );
  }

  Widget _buildAddDetailsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person_add_alt_1_rounded,
            size: 80,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 24),
          Text(
            'Add Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Use this page to add new patient details to the system',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditDetailsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit_note_rounded,
            size: 80,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 24),
          Text(
            'Edit Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Edit patient information in the system',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Appointments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Check todays appointment List',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_download_outlined),
              label: const Text('Export'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _activeTab = 'Add Details';
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: [
        _buildTab('Patients Records'),
        const SizedBox(width: 16),
        _buildTab('Add Details'),
        const SizedBox(width: 16),
        _buildTab('Edit Details'),
      ],
    );
  }

  Widget _buildTab(String title) {
    final isActive = _activeTab == title;
    return InkWell(
      onTap: () {
        setState(() {
          _activeTab = title;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.deepPurple : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 120,
            color: isActive ? Colors.deepPurple : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          // SizedBox(
          //   width: 40,
          //   child: Checkbox(
          //     value: _selectAll,
          //     onChanged: (value) {
          //       setState(() {
          //         _selectAll = value ?? false;
          //         if (_selectAll) {
          //           _selectedPatients.clear();
          //           _selectedPatients.addAll(_patients.map((p) => p.id));
          //         } else {
          //           _selectedPatients.clear();
          //         }
          //       });
          //     },
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(4),
          //     ),
          //   ),
          // ),
          _buildTableColumn('Patients Name', flex: 2, isCenter: true),
          _buildTableColumn('Age', isCenter: true),
          _buildTableColumn('Gender', isCenter: true),
          _buildTableColumn('Mobile', flex: 2, isCenter: true),
          _buildTableColumn('Department', flex: 2, isCenter: true),
          _buildTableColumn('Date', isCenter: true),
          _buildTableColumn('Time', isCenter: true),
          _buildTableColumn('Status', isCenter: true),
          _buildTableColumn('Action', isCenter: true),
        ],
      ),
    );
  }
     
  Widget _buildTableColumn(String title, {int flex = 1, bool isCenter = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade700,
        ),
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
      ),
    );
  }

  Widget _buildPatientList() {
    return ListView.builder(
      itemCount: _patients.length,
      itemBuilder: (context, index) {
        final patient = _patients[index];
        final isSelected = _selectedPatients.contains(patient.id);
        
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Row(
            children: [
              // SizedBox(
              //   width: 40,
              //   child: Checkbox(
              //     value: isSelected,
              //     onChanged: (value) {
              //       setState(() {
              //         if (value ?? false) {
              //           _selectedPatients.add(patient.id);
              //         } else {
              //           _selectedPatients.remove(patient.id);
              //         }
              //         _selectAll = _selectedPatients.length == _patients.length;
              //       });
              //     },
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(patient.avatarUrl),
                      radius: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      patient.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(patient.age.toString()),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(patient.gender),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    patient.mobile,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              Expanded(
                flex: 2, 
                child: Center(
                  child: Text(patient.department),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(_formatDate(patient.dateInfo)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(_formatTime(patient.appointmentTime)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(patient.status),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      patient.status,
                      softWrap: false,
                      style: TextStyle(
                        color: _getStatusTextColor(patient.status),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      // Show action menu
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildPagination() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Row(
  //           children: [
  //             Text('Show Result', style: TextStyle(color: Colors.grey.shade600)),
  //             const SizedBox(width: 8),
  //             Container(
  //               padding: const EdgeInsets.symmetric(horizontal: 8),
  //               decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.grey.shade300),
  //                 borderRadius: BorderRadius.circular(4),
  //               ),
  //               child: Row(
  //                 children: [
  //                   Text('10'),
  //                   const SizedBox(width: 4),
  //                   Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             _buildPageButton(1),
  //             _buildPageButton(2),
  //             Text('...', style: TextStyle(color: Colors.grey.shade600)),
  //             _buildPageButton(9),
  //             _buildPageButton(10),
  //             ElevatedButton(
  //               onPressed: () {
  //                 if (_currentPage < 10) {
  //                   setState(() {
  //                     _currentPage++;
  //                   });
  //                 }
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.white,
  //                 foregroundColor: Colors.black,
  //                 elevation: 0,
  //                 side: BorderSide(color: Colors.grey.shade300),
  //               ),
  //               child: const Text('Next'),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPageButton(int page) {
    final isActive = _currentPage == page;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _currentPage = page;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.deepPurple : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.black,
          elevation: 0,
          side: BorderSide(color: isActive ? Colors.transparent : Colors.grey.shade300),
          shape: const CircleBorder(),
          minimumSize: const Size(40, 40),
        ),
        child: Text(page.toString()),
      ),
    );
  }
}