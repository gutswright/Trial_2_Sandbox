// In new_customer_page.dart
import 'package:flutter/material.dart';
import 'customer.dart';

class NewCustomerPage extends StatefulWidget {
  final Function(Customer) onAddCustomer;

  NewCustomerPage({required this.onAddCustomer});

  @override
  _NewCustomerPageState createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _lastServiceDate = DateTime.now();
  final _serviceTypeController = TextEditingController();
  final _serviceFrequencyController = TextEditingController();
  final _paymentMethodController = TextEditingController();
  final _outstandingBalanceController = TextEditingController();
  DateTime _lastPaymentDate = DateTime.now();
  final _notesController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newCustomer = Customer(
        name: _nameController.text,
        address: _addressController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        lastServiceDate: _lastServiceDate,
        serviceType: _serviceTypeController.text,
        serviceFrequency: _serviceFrequencyController.text,
        paymentMethod: _paymentMethodController.text,
        outstandingBalance: double.parse(_outstandingBalanceController.text),
        lastPaymentDate: _lastPaymentDate,
        notes: _notesController.text,
      );

      widget.onAddCustomer(newCustomer);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _serviceTypeController,
                decoration: InputDecoration(labelText: 'Service Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _serviceFrequencyController,
                decoration: InputDecoration(labelText: 'Service Frequency'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service frequency';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _paymentMethodController,
                decoration: InputDecoration(labelText: 'Payment Method'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a payment method';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _outstandingBalanceController,
                decoration: InputDecoration(labelText: 'Outstanding Balance'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an outstanding balance';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(labelText: 'Notes'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Customer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
