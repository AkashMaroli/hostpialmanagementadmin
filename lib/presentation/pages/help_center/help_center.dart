
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.help_center, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Help center',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Ask any doublts here',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
