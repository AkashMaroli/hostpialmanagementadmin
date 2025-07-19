
import 'package:flutter/material.dart';

class PatientHistoryScreen extends StatelessWidget {
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
                'Patient History',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.history, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Patient History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Patient records will be displayed here',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
