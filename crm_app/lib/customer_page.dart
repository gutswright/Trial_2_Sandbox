import 'package:flutter/material.dart';
import 'customer_detail_page.dart'; // Import the customer detail page

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  // Dummy data for customers
  List<Map<String, String>> customers = [
    {'name': 'John Doe', 'address': '123 Elm St', 'lastServiceDate': '2024-07-01'},
    {'name': 'Jane Smith', 'address': '456 Oak St', 'lastServiceDate': '2024-07-15'},
  ];

  String searchQuery = '';
  String sortBy = 'name'; // default sorting

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> sortedCustomers = List.from(customers);

    // Sort customers based on the selected criteria
    sortedCustomers.sort((a, b) {
      if (sortBy == 'name') {
        return a['name']!.compareTo(b['name']!);
      } else if (sortBy == 'address') {
        return a['address']!.compareTo(b['address']!);
      } else if (sortBy == 'lastServiceDate') {
        return a['lastServiceDate']!.compareTo(b['lastServiceDate']!);
      }
      return 0;
    });

    final filteredCustomers = sortedCustomers
        .where((customer) => customer['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer List'),
        actions: [
          // Sort dropdown
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                sortBy = value;
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              PopupMenuItem(value: 'address', child: Text('Sort by Address')),
              PopupMenuItem(value: 'lastServiceDate', child: Text('Sort by Last Service Date')),
            ],
          ),
        ],
      ),
      body: Column(
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
      ),
    );
  }
}
