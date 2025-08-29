import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Productos'),
            onTap: () => Navigator.pushReplacementNamed(context, '/catalogoProductos'),
          ),
          
          ListTile(
            leading: const Icon(Icons.supervisor_account),
            title: const Text('Clientes'),
            onTap: () => Navigator.pushReplacementNamed(context, '/catalogoClientes'),
          ),
        ],
      ),
    );
  }
}