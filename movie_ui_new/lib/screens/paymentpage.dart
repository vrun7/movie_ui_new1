import 'package:flutter/material.dart';
import 'package:movie_ui_new/core/theme/app_color.dart';
import 'package:movie_ui_new/screens/paymentupi.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildPaymentMethodOption('UPI', Icons.payment),
            _buildPaymentMethodOption('Credit Card', Icons.credit_card),
            _buildPaymentMethodOption('Debit Card', Icons.card_membership),
            _buildPaymentMethodOption('Net Banking', Icons.account_balance),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 17),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UPIPaymentPage()));
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption(String method, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(method),
      trailing: Radio<String>(
        value: method,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? value) {
          setState(() {
            _selectedPaymentMethod = value;
          });
        },
      ),
    );
  }

  void _processPayment() {
    // Handle payment processing here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment'),
        content: Text('Processing payment via $_selectedPaymentMethod'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
