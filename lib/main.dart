import 'package:flutter/material.dart';
import 'package:products_app/pages/customers/customers_catalog_page.dart';
import 'package:products_app/pages/home_page.dart';
import 'package:products_app/pages/products/products_catalog_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/catalogoProductos': (context) => const ProductsCatalogPage(),
        '/catalogoClientes': (context) => const CustomersCatalogPage(),
      },
    );
  }
}
