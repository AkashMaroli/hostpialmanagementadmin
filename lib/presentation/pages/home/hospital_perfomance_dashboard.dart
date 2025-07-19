import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hospitalmanagementadmin/presentation/controllers/global_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedWeek = "Last Week";
  String selectedTimeframe = "Week";
  String selectedVisitType = "Week";

  final List<Color> gradientColors = [
    const Color(0xFF6E56F8),
    const Color(0xFF25BFA3),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Row(spacing: 10,
              children: [
                Expanded(
                  child: Container(color: Colors.white,
                    child: Column(spacing: 10,
                      children: [
                        _buildStatsCards('patients',100),
                        _buildStatCardSecondRow(),
                      ],
                    ),
                  ),
                ),
                 Expanded(
                  child: Container(color: Colors.white,
                    child: Column(
                      children: [
                        _buildStatsCards("Doctors",doctorRequests.length),
                        _buildStatCardSecondRow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildPatientStatistics()),
                const SizedBox(width: 20),
                Expanded(child: Container(color: Colors.red,)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Text(
                    selectedWeek,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16,color:  Colors.white,),
              label: const Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6E56F8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCards(String titleName,int value) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.people,
            title: 'Total $titleName',
            value: '$value',
            trend: '+28%',
            color: const Color(0xFF6E56F8),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            icon: Icons.calendar_today,
            title:titleName=='Doctors'?'Doctors on duty': 'Appointment',
            value:titleName=='Doctors'?'${doctorRequests.where((doctor) => doctor.activeStatus).toList().length}':'$value' ,
            trend: '+28%',
            color: const Color(0xFF6E56F8),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCardSecondRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.local_hospital,
            title: 'Total Operations',
            value: '6,050',
            trend: '+28%',
            color: const Color(0xFF6E56F8),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            icon: Icons.bed,
            title: 'Hospital Beds',
            value: '1400',
            trend: '+28%',
            color: const Color(0xFF6E56F8),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String trend,
    required Color color,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: title == 'Total Patients' ? color : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    title == 'Total Patients'
                        ? Colors.white.withOpacity(0.2)
                        : color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: title == 'Total Patients' ? Colors.white : color,
                size: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color:
                    title == 'Total Patients'
                        ? Colors.white.withOpacity(0.8)
                        : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: title == 'Total Patients' ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Last week',
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        title == 'Total Patients'
                            ? Colors.white.withOpacity(0.8)
                            : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                        size: 12,
                      ),
                      Text(
                        trend,
                        style: const TextStyle(fontSize: 10, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget _buildPatientStatistics() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Patients Statistics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedVisitType,
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.indigo.shade700,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(Colors.indigo, 'Patients Admission'),
              const SizedBox(width: 16),
              _buildLegendItem(Colors.orange, 'Discharge'),
              const SizedBox(width: 16),
              _buildLegendItem(const Color(0xFF25BFA3), 'Visit'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildStatisticBars(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStatisticBars() {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days.map((day) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildBar(Colors.orange, Random().nextInt(40) + 30),
          const SizedBox(height: 8),
          _buildBar(Colors.indigo, Random().nextInt(40) + 30),
          const SizedBox(height: 8),
          _buildBar(Colors.green, Random().nextInt(40) + 10),
          const SizedBox(height: 8),
          Text(
            day,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildBar(Color color, double height) {
    return Container(
      width: 10,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  // Widget _buildCalendar() {
  //   return Container(
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Calendar',
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             Row(
  //               children: [
  //                 _buildLegendItem(const Color(0xFF25BFA3), 'Appointment'),
  //                 const SizedBox(width: 16),
  //                 _buildLegendItem(Colors.indigo, 'Surgery'),
  //               ],
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 16),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.arrow_back_ios, size: 16),
  //                 ),
  //                 const Text(
  //                   'July 2024',
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //                 IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.arrow_forward_ios, size: 16),
  //                 ),
  //               ],
  //             ),
  //             const Text(
  //               'Activity Details',
  //               style: TextStyle(fontSize: 12, color: Colors.grey),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 16),
  //         _buildCalendarGrid(),
  //         const SizedBox(height: 16),
  //         _buildAppointmentsList(),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCalendarGrid() {
  //   const weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  //   final daysInMonth = List.generate(31, (index) => index + 1);

  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children:
  //             weekDays
  //                 .map(
  //                   (day) => SizedBox(
  //                     width: 24,
  //                     child: Center(
  //                       child: Text(
  //                         day,
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey.shade600,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //                 .toList(),
  //       ),
  //       const SizedBox(height: 16),
  //       GridView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 7,
  //           childAspectRatio: 1,
  //         ),
  //         itemCount: 42, // 6 weeks x 7 days
  //         itemBuilder: (context, index) {
  //           int day = index - 1; // Offset for last days of previous month
  //           bool isCurrentMonth = day >= 0 && day < daysInMonth.length;
  //           bool isToday = isCurrentMonth && daysInMonth[day] == 10;

  //           return Container(
  //             margin: const EdgeInsets.all(2),
  //             decoration: BoxDecoration(
  //               color: isToday ? Colors.indigo : null,
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //             child: Center(
  //               child:
  //                   isCurrentMonth
  //                       ? Text(
  //                         daysInMonth[day].toString(),
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           color: isToday ? Colors.white : Colors.black,
  //                         ),
  //                       )
  //                       : null,
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildAppointmentsList() {
  //   final appointments = [
  //     {
  //       'doctor': 'Dr. Edison',
  //       'type': 'Appointment',
  //       'time': '11:30-11:45 AM',
  //       'color': const Color(0xFF25BFA3),
  //     },
  //     {
  //       'doctor': 'Dr. Rita',
  //       'type': 'Surgery',
  //       'time': '2:00-2:45 PM',
  //       'color': Colors.indigo,
  //     },
  //     {
  //       'doctor': 'Dr. Alison',
  //       'type': 'Appointment',
  //       'time': '4:00-5:30 PM',
  //       'color': const Color(0xFF25BFA3),
  //     },
  //   ];

  //   return Column(
  //     children: [
  //       ...appointments.map(
  //         (appointment) => _buildAppointmentItem(
  //           doctor: appointment['doctor'] as String,
  //           type: appointment['type'] as String,
  //           time: appointment['time'] as String,
  //           color: appointment['color'] as Color,
  //         ),
  //       ),
  //       const SizedBox(height: 16),
  //       OutlinedButton.icon(
  //         onPressed: () {},
  //         icon: const Icon(Icons.add, size: 16),
  //         label: const Text('Add new'),
  //         style: OutlinedButton.styleFrom(
  //           foregroundColor: Colors.black,
  //           side: BorderSide(color: Colors.grey.shade300),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildAppointmentItem({
  //   required String doctor,
  //   required String type,
  //   required String time,
  //   required Color color,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 6,
  //           height: 6,
  //           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  //         ),
  //         const SizedBox(width: 8),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               '$doctor $type',
  //               style: const TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 13,
  //               ),
  //             ),
  //             Text(
  //               time,
  //               style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// Add this for random bar heights
