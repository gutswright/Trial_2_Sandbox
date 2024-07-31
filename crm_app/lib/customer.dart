class Customer {
  String name;
  String address;
  String phone;
  String email;
  DateTime lastServiceDate;
  String serviceType;
  String serviceFrequency;
  String paymentMethod;
  double outstandingBalance;
  DateTime lastPaymentDate;
  String notes;

  Customer({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.lastServiceDate,
    required this.serviceType,
    required this.serviceFrequency,
    required this.paymentMethod,
    required this.outstandingBalance,
    required this.lastPaymentDate,
    required this.notes,
  });
}
