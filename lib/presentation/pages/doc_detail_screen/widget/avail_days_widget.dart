import 'package:flutter/material.dart';

class AvailabilityContainer extends StatefulWidget {
  @override
  _AvailabilityContainerState createState() => _AvailabilityContainerState();
}

class _AvailabilityContainerState extends State<AvailabilityContainer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  final Map<String, List<String>> availabilityData = {
    'Monday': ['11:30 AM - 12:30 PM', '06:00 PM - 07:30 PM'],
    'Tuesday': ['12:30 PM - 01:30 PM', '07:00 PM - 08:30 PM'],
    'Wednesday': ['02:30 PM - 03:30 PM', '09:00 PM - 11:00 PM'],
    'Thursday': ['04:30 PM - 05:30 PM', '11:00 PM - 11:30 PM'],
    'Friday': ['04:30 PM - 05:30 PM', '11:00 PM - 11:30 PM'],
    'Saturday': ['10:00 AM - 11:00 AM', '03:00 PM - 04:00 PM', '08:00 PM - 09:00 PM'],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: days.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Text(
            'Availability',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 20),

          // Tab Bar
          Container(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.blue,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: days.map<Tab>((String day) => Tab(
                child: Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(day),
                ),
              )).toList(),
            ),
          ),

          SizedBox(height: 16),

          // Tab Bar View
          Container(
            height: 100, // Fixed height for the time slots area
            child: TabBarView(
              controller: _tabController,
              children: days.map<Widget>((String day) {
                final List<String> dayTimeSlots = availabilityData[day] ?? [];

                return SingleChildScrollView(
                  child: dayTimeSlots.isEmpty
                      ? Container(
                          padding: EdgeInsets.all(32),
                          child: Text(
                            'No availability for $day',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 12.0, // Horizontal space between items
                          runSpacing: 12.0, // Vertical space between lines
                          children: dayTimeSlots.map<Widget>((String time) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                time,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}