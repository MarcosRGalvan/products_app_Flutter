import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:products_app/models/customers_catalog.dart';

class CustomersDetailPage extends StatelessWidget {
  final CustomersCatalog customer;

  const CustomersDetailPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(customer.name),
        backgroundColor: Colors.teal,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                ),
                const SizedBox(height: 8),

                Text(
                  customer.address,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.teal
                  ),
                ),
                //const SizedBox(height: 8),

                Text(
                  "C.P: ${customer.postalCode}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey,
                  ),
                ),

                Text(
                  customer.city,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "País: ${customer.country}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,),
                ),
                SizedBox(height: 10),

                Text(
                  "Compañia: ${customer.company}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),

                Text(
                  "Datos de Contacto:",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 5),

                Text(
                  "Telefono: ${customer.phone}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey),
                ),
                SizedBox(height: 5),

                Text(
                  "Fax: ${customer.fax}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey),
                ),
                SizedBox(height: 5),

                Text(
                  "Email: ${customer.email}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey
                    ),
                ),
                SizedBox(height: 50),

                Text(
                  "Atendio: ${customer.supportRep}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}