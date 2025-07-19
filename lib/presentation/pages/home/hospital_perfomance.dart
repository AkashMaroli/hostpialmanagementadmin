import 'package:flutter/material.dart';

class HospitalDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 15),
              Text(
                'Hospital Dashboard',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.graphic_eq_outlined, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Hospital perfomance',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Perfomance records will be displayed here',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
