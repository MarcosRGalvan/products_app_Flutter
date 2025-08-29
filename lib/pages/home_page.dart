import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:products_app/pages/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Colors.teal),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Bienvenido 👋, selecciona una opción del menú"),
      ),
    );
  }
}