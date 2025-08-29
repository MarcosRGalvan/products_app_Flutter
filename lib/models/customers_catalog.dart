class CustomersCatalog {
  final int customerId;
  final String name;
  final String company;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String phone;
  final String fax;
  final String email;
  final String supportRep;

  CustomersCatalog({
    required this.customerId,
    required this.name,
    required this.company,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.phone,
    required this.fax,
    required this.email,
    required this.supportRep
  });


  factory CustomersCatalog.fromJson(Map<String, dynamic> json) {
    return CustomersCatalog(
      customerId: json['customer_id'],
      name: json['name'],
      company: json['company'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postal_code'],
      phone: json['phone'],
      fax: json['fax'],
      email: json['email'],
      supportRep: json['support_rep']
    );
  }
}