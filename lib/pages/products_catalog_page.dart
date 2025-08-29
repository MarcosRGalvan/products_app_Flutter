import 'package:flutter/material.dart';
import 'package:products_app/models/product_catalog.dart';
import 'package:products_app/pages/product_detail_page.dart';
import 'package:products_app/pages/widgets/app_drawer.dart';
import 'package:products_app/services/api_service.dart';

class ProductsCatalogPage extends StatefulWidget {
  const ProductsCatalogPage({super.key});

  @override
  State<ProductsCatalogPage> createState() => _ProductsCataloPage();

}

class _ProductsCataloPage extends State<ProductsCatalogPage> {
  List<ProductCatalog> _productos = [];
  List<ProductCatalog> _productosFiltrados = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarProductos();
    _searchController.addListener(_filtrarProductos);
  }

  void _cargarProductos() async {
    try {
      final productos = await ApiService.fetchProducts();
      setState(() {
        _productos = productos;
        _productosFiltrados = productos;
      });
    } catch (e) {
      debugPrint("Error al cargar productos: $e");
    }
  }

  void _filtrarProductos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _productosFiltrados = _productos.where((p) {
        return p.productName.toLowerCase().contains(query) ||
              p.brandName.toLowerCase().contains(query);
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
        title: const Text('Cátalogo de Productos'),
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
                hintText: "Buscar producto o marca...",
                prefixIcon: const Icon(Icons.search, color: Colors.teal,),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Lista de productos
          Expanded(
            child: _productosFiltrados.isEmpty
              ? const Center(child: Text("No se encontraron productos"))
              : ListView.builder(
                itemCount: _productosFiltrados.length,
                itemBuilder: (context, index) {
                  final product = _productosFiltrados[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(product: product),
                        ),
                      );
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
                              product.productName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.brandName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Precio: \$${product.price}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber[600], size: 16),
                                const SizedBox(width: 4),
                                Text("${product.rating}"),
                                const SizedBox(width: 16),
                                if (product.isDiscount)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Descuento",
                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
          ),
        ],
      ),
    );
  }
}