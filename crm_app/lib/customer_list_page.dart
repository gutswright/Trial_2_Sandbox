import 'package:flutter/material.dart';
import 'customer_detail_page.dart'; // Import the new customer detail page

class CustomerListPage extends StatefulWidget {
  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  // Dummy data
  List<Map<String, String>> customers = [
    {'name': 'John Doe', 'address': '123 Elm St', 'lastServiceDate': '2024-07-01'},
    {'name': 'Jane Smith', 'address': '456 Oak St', 'lastServiceDate': '2024-07-15'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCustomers = customers
        .where((customer) => customer['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (query) {
              setState(() {
                searchQuery = query;
              });
            },
            decoration: InputDecoration(
              labelText: 'Search Customer',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCustomers.length,
            itemBuilder: (context, index) {
              final customer = filteredCustomers[index];
              return ListTile(
                title: Text(customer['name']!),
                subtitle: Text('Address: ${customer['address']}\nLast Service Date: ${customer['lastServiceDate']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerDetailPage(customer: customer),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
