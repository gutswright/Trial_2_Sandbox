import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Make sure to add this package to your pubspec.yaml

class CustomerDetailPage extends StatelessWidget {
  final Map<String, String> customer;

  CustomerDetailPage({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customer['name'] ?? 'Customer Details'),
      ),
      body: DefaultTabController(
        length: 5, // Number of tabs
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: 'Details'),
                Tab(text: 'Service History'),
                Tab(text: 'Notes & Reminders'),
                Tab(text: 'Add New Customer'),
                Tab(text: 'Customer List'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Details Tab
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Text('Name: ${customer['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Address: ${customer['address']}'),
                        Text('Phone Number: ${customer['phoneNumber']}'),
                        Text('Email: ${customer['email']}'),
                        Text('Last Service Date: ${customer['lastServiceDate']}'),
                        Text('Service Type: ${customer['serviceType']}'),
                        Text('Service Frequency: ${customer['serviceFrequency']}'),
                        Text('Payment Method: ${customer['paymentMethod']}'),
                        Text('Outstanding Balance: ${customer['outstandingBalance']}'),
                        Text('Last Payment Date: ${customer['lastPaymentDate']}'),
                        Text('Additional Notes: ${customer['additionalNotes']}'),
                      ],
                    ),
                  ),
                  // Service History Tab
                  Center(child: Text('Service History Content')),
                  // Notes & Reminders Tab
                  Center(child: Text('Notes & Reminders Content')),
                  // Add New Customer Tab
                  Center(child: Text('Add New Customer Content')),
                  // Customer List Tab
                  Center(child: Text('Customer List Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
