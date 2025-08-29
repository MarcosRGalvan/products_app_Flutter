import 'dart:convert';

import 'package:products_app/models/customers_catalog.dart';
import 'package:products_app/models/product_catalog.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = 'http://172.16.2.55:3000';

  // Productos
  static Future<List<ProductCatalog>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products_catalog'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => ProductCatalog.fromJson(item)).toList();

    } else {
      throw Exception('Error al cargar productos');
    }
  }

  // Clientes
  static Future<List<CustomersCatalog>> fetchCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers_catalog'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => CustomersCatalog.fromJson(item)).toList();
    
    } else {
      throw Exception('Error al cargar clientes');
    }
  }
}