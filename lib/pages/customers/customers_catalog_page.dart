import 'package:flutter/material.dart';
import 'package:products_app/models/customers_catalog.dart';
import 'package:products_app/pages/customers/customers_detail_page.dart';
import 'package:products_app/pages/widgets/app_drawer.dart';
import 'package:products_app/services/api_service.dart';

class CustomersCatalogPage extends StatefulWidget {
  const CustomersCatalogPage({super.key});

  @override
  State<CustomersCatalogPage> createState() => _CustomersCatalogPage();
}

class _CustomersCatalogPage extends State<CustomersCatalogPage> {
  List<CustomersCatalog> _clientes = [];
  List<CustomersCatalog> _clientesFiltrados = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarClientes();
    _searchController.addListener(_filtrarClientes);
  }

  void _cargarClientes() async {
    try {
      final clientes = await ApiService.fetchCustomers();
      setState(() {
        _clientes = clientes;
        _clientesFiltrados = clientes;
      });
    } catch (e) {
      debugPrint("Error al cargar los clientes: $e");
    }
  }

  void _filtrarClientes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _clientesFiltrados = _clientes.where((c) {
        return c.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Cátalogo de Clientes'),
        backgroundColor: Colors.teal,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [

          // Barra de busqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Buscar cliente...",
                prefixIcon: const Icon(Icons.search, color: Colors.teal,),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  //borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Lista de clientes
          Expanded(
            child: _clientesFiltrados.isEmpty
              ? const Center(child: Text("No se encontraron clientes"))
              : ListView.builder(
                itemCount: _clientesFiltrados.length,
                itemBuilder: (context, index) {
                  final customer = _clientesFiltrados[index];
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CustomersDetailPage(customer: customer),
                        ),
                      )
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            
                            Text(
                              customer.address,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                              ),

                            ),
                            const SizedBox(height: 8),

                            Text(
                              customer.company,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
          ),
        ],
      ),
    );
  }
}
