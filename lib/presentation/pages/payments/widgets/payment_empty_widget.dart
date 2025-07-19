
import 'package:flutter/material.dart';

class EmptyPaymentWidget extends StatelessWidget {
  const EmptyPaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payments, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Payments',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Payment records will be displayed here',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
