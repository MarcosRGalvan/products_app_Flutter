import 'package:intl/intl.dart';

class ProductCatalog {
  final String id;
  final String productName;
  final String brandName;
  final String description;
  final String price;
  final int rating;
  final String launchingDate;
  final bool isDiscount;

  ProductCatalog({
    required this.id,
    required this.productName,
    required this.brandName,
    required this.description,
    required this.price,
    required this.rating,
    required this.launchingDate,
    required this.isDiscount
  });

  String get formattedLaunchingDate {
    final parsed = DateTime.tryParse(launchingDate);
    if (parsed == null) return launchingDate;
    return DateFormat('dd/MM/yyyy').format(parsed);
  }

  factory ProductCatalog.fromJson(Map<String, dynamic> json) {
    return ProductCatalog(
      id: json['id'],
      productName: json['product_name'],
      brandName: json['brand_name'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      launchingDate: json['launching_date'],
      isDiscount: json['is_discount'],
    );
  }
}